From: "gregry ." <gregry_7@yahoo.com>
Subject: Removing DROP from nat table
Date: Wed, 9 Nov 2011 16:41:50 -0800 (PST)
Message-ID: <1320885710.82187.YahooMailNeo@web36903.mail.mud.yahoo.com>
Reply-To: "gregry ." <gregry_7@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1320885710; bh=QyUIbJ3HEeEJpZ2Gy96JYmkAdmBq9BQ9ly4ZrzfXIAo=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=6mSyWVEe/C21xY0B1tnDPomlpHljY4+ouYBalxoJiuCnDzKdAVzki2OBZr3fqYGzXZQ8QNHaSUey68wFSmIK6zNmI6BgeOpSrgsjnEUZdkDg3osOiS99lnNSgPVQEwq6Y22oYP8rrxjXdSZqe3J4oRdpTVCbrjJ24e1hqN1GDVw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Through recent upgrades I've learned that the nat table no longer allow=
s DROP as a target.=A0 I've done googling to try to find reasons why th=
is was removed, and hopefully find workarounds.=A0 I may have work arou=
nds (using the raw or mangle tables to do the DROP?).=A0 I'm still inte=
rested in the reason why this was changed, other than "it wasn't intend=
ed to be used that way."

I'd also like to try to describe my use case, and why using DROP from n=
at seemed appropriate for it.

I have 200+ users connecting to an OpenVPN server to reach services tha=
t are not public.=A0 Each user is assigned an IP address unique to that=
 user.=A0 The router (OpenVPN server) uses primarily the nat table's PR=
EROUTING chain to control access and do port forwarding.

"Hold on, that's your problem right there, you should use filter instea=
d," someone will say.=A0 Maybe, but I'll describe why I didn't.

The router uses port forwarding based on the users source IP and the de=
stinations they are trying to reach in order to allow the connection (m=
eaning, DNAT) or deny the connection (meaning, DROP).


Lets say the users VPN clients have addresses in the range 10.0.0.2 to =
10.0.0.250, and 10.0.0.1 being the VPN router.=A0 The router is the sin=
gle destination address that users "see" and "connect" to.=A0 In actual=
ity, connections to its IP does port forwarding to other machines scatt=
ered throughout multiple 192.168.*.* subnets and other non-public subne=
t ranges.=A0 This arrangement of using 10.0.0.0/24 as the only range cl=
ients "see" was to minimize possible IP range conflicts between our use=
rs' local networks and our physical server destinations.=A0 Instead it =
made sense for the users to "connect" to a single fixed destination, an=
d let port forwarding handle the rest.


So the VPN router has a lot of port forwards, of the form (skipping som=
e obvious steps):
iptables -t nat -A nat_fwd_srvc -p tcp --dport 8001 -j DNAT --to 192.16=
8.10.23:80

iptables -t nat -A nat_fwd_srvc -p tcp --dport 8002 -j DNAT --to 192.16=
8.11.19:8080

iptables -t nat -A nat_fwd_srvc -p tcp --dport 8003 -j DNAT --to 192.16=
8.190.5:80

iptables -t nat -A nat_fwd_srvc -p tcp --dport 8004 -j DNAT --to 192.16=
8.190.5:443
=2E.etc, for about 20 hosts.


If a particular service moves to a different host or port number, a sin=
gle line DNAT can be changed (which does happen).


Access was controlled by tables called from PREROUTING for new connecti=
ons, that checked the source and destination to see if that user was al=
lowed to reach the given service.=A0 That table was basicly like this (=
skipping some obvious steps):
iptables -t nat -A natclnt_10_0_0_1 -p tcp --dport 8001 -j nat_fwd_srvc
iptables -t nat -A natclnt_10_0_0_1 -j LOG --log-prefix NatClnt_1=3D

iptables -t nat -A natclnt_10_0_0_1 -j DROP

iptables -t nat -A natclnt_10_0_0_2 -p tcp --dport 8001 -j nat_fwd_srvc
iptables -t nat -A natclnt_10_0_0_2 -p tcp --dport 8003 -j nat_fwd_srvc
iptables -t nat -A natclnt_10_0_0_2 -p tcp --dport 8004 -j nat_fwd_srvc=
iptables  -t nat -A natclnt_10_0_0_2 -j LOG --log-prefix NatClnt_2=3D

iptables -t nat -A natclnt_10_0_0_2 -j DROP
=2E..etc
iptables -t nat -A nat_clnt_new -p tcp -s 10.0.0.1 -j natclnt_10_0_0_1=20
iptables -t nat -A nat_clnt_new -p tcp -s 10.0.0.2 -j natclnt_10_0_0_2

=2E..etc
iptables -t nat -A nat_clnt_new -j LOG --log-prefix UsrUnk=3D

iptables -t nat -A nat_clnt_new -j DROP
iptables -t nat -A PREROUTING -p tcp -m state --state NEW -s 10.0.0.0/2=
4 -d 10.0.0.1 -j nat_clnt_new
These chains above would be called when new TCP connections come in fro=
m VPN clients trying to reach 10.0.0.1.=A0 The filter table only needs =
a single "blind" ACCEPT for all new TCP connections from 10.0.0.0/8.


On average, each user is allowed to 5 different services (some just one=
, some 12 or more).=A0 At 200 such users, that's over 1000 rules just t=
o control access.


The major advantage to this setup was that if a service moved to a diff=
erent host (say, going from dev/test to production DMZ), only the DNAT =
line for that one service needed to change.


However, if this setup gets rebuilt using the filter table in the 'inte=
nded' way, the rules would have to be like:iptables -t filter -A fwdcln=
t_10_0_0_1 -p tcp -d  192.168.10.23 --dport 80 -j ACCEPT
iptables -t filter -A fwdclnt_10_0_0_1 -j LOG --log-prefix FwdClnt_1=3D

iptables -t filter -A fwdclnt_10_0_0_1 -j DROP

iptables -t filter -A fwdclnt_10_0_0_2 -p tcp -d  192.168.10.23 --dport=
 80 -j ACCEPT
iptables -t filter -A fwdclnt_10_0_0_2 -p tcp -d 192.168.190.5 --dport =
80 -j ACCEPT
iptables -t filter -A fwdclnt_10_0_0_2 -p tcp -d 192.168.190.5 --dport =
443 -j ACCEPTiptables  -t filter -A fwdclnt_10_0_0_2 -j LOG --log-prefi=
x FwdClnt_2=3D

iptables -t filter -A fwdclnt_10_0_0_2 -j DROP
=2E..etc

iptables -t filter -A fwdclnt_new -p tcp -s 10.0.0.1 -j fwdclnt_10_0_0_=
1=20
iptables -t filter -A fwdclnt_new -p tcp -s 10.0.0.2 -j fwdclnt_10_0_0_=
2

=2E..etc

iptables -t filter -A fwdclnt_new -j LOG --log-prefix UsrUnk=3D

iptables -t filter -A fwdclnt_new -j DROP
iptables -t filter -A FORWARD -p tcp -m state --state NEW -s 10.0.0.0/2=
4 -d 10.0.0.1 -j fwdclnt_new

Notice that in this setup, if a service gets moved to another host or p=
ort, potentially hundreds of filter rules also have to be changed to re=
flect that.=A0 Much more laborious and error prone.



Comments welcome.
