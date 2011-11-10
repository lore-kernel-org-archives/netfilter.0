From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Removing DROP from nat table
Date: Thu, 10 Nov 2011 15:12:14 +1300
Message-ID: <160bb99d89c82a755e3f6d01de577de8@treenet.co.nz>
References: <1320885710.82187.YahooMailNeo@web36903.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1320885710.82187.YahooMailNeo@web36903.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

 On Wed, 9 Nov 2011 16:41:50 -0800 (PST), gregry . wrote:
> Through recent upgrades I've learned that the nat table no longer
> allows DROP as a target.=C2=A0 I've done googling to try to find reas=
ons
> why this was removed, and hopefully find workarounds.=C2=A0 I may hav=
e=20
> work
> arounds (using the raw or mangle tables to do the DROP?).=C2=A0 I'm s=
till
> interested in the reason why this was changed, other than "it wasn't
> intended to be used that way."
>
> I'd also like to try to describe my use case, and why using DROP from
> nat seemed appropriate for it.
>
> I have 200+ users connecting to an OpenVPN server to reach services
> that are not public.=C2=A0 Each user is assigned an IP address unique=
 to
> that user.=C2=A0 The router (OpenVPN server) uses primarily the nat=20
> table's
> PREROUTING chain to control access and do port forwarding.
>
> "Hold on, that's your problem right there, you should use filter
> instead," someone will say.=C2=A0 Maybe, but I'll describe why I didn=
't.
>
> The router uses port forwarding based on the users source IP and the
> destinations they are trying to reach in order to allow the=20
> connection
> (meaning, DNAT) or deny the connection (meaning, DROP).
>
>
> Lets say the users VPN clients have addresses in the range 10.0.0.2
> to 10.0.0.250, and 10.0.0.1 being the VPN router.=C2=A0 The router is=
 the
> single destination address that users "see" and "connect" to.=C2=A0 I=
n
> actuality, connections to its IP does port forwarding to other
> machines scattered throughout multiple 192.168.*.* subnets and other
> non-public subnet ranges.=C2=A0 This arrangement of using 10.0.0.0/24=
 as
> the only range clients "see" was to minimize possible IP range
> conflicts between our users' local networks and our physical server
> destinations.=C2=A0 Instead it made sense for the users to "connect" =
to a
> single fixed destination, and let port forwarding handle the rest.
>
>
> So the VPN router has a lot of port forwards, of the form (skipping
> some obvious steps):
> iptables -t nat -A nat_fwd_srvc -p tcp --dport 8001 -j DNAT --to
> 192.168.10.23:80
>
> iptables -t nat -A nat_fwd_srvc -p tcp --dport 8002 -j DNAT --to
> 192.168.11.19:8080
>
> iptables -t nat -A nat_fwd_srvc -p tcp --dport 8003 -j DNAT --to
> 192.168.190.5:80
>
> iptables -t nat -A nat_fwd_srvc -p tcp --dport 8004 -j DNAT --to
> 192.168.190.5:443
> ..etc, for about 20 hosts.
>
>
> If a particular service moves to a different host or port number, a
> single line DNAT can be changed (which does happen).
>
>
> Access was controlled by tables called from PREROUTING for new
> connections, that checked the source and destination to see if that
> user was allowed to reach the given service.=C2=A0 That table was bas=
icly
> like this (skipping some obvious steps):
> iptables -t nat -A natclnt_10_0_0_1 -p tcp --dport 8001 -j=20
> nat_fwd_srvc
> iptables -t nat -A natclnt_10_0_0_1 -j LOG --log-prefix NatClnt_1=3D
>
> iptables -t nat -A natclnt_10_0_0_1 -j DROP
>
> iptables -t nat -A natclnt_10_0_0_2 -p tcp --dport 8001 -j=20
> nat_fwd_srvc
> iptables -t nat -A natclnt_10_0_0_2 -p tcp --dport 8003 -j=20
> nat_fwd_srvc
> iptables -t nat -A natclnt_10_0_0_2 -p tcp --dport 8004 -j
> nat_fwd_srvciptables  -t nat -A natclnt_10_0_0_2 -j LOG --log-prefix
> NatClnt_2=3D
>
> iptables -t nat -A natclnt_10_0_0_2 -j DROP
> ...etc
> iptables -t nat -A nat_clnt_new -p tcp -s 10.0.0.1 -j=20
> natclnt_10_0_0_1
> iptables -t nat -A nat_clnt_new -p tcp -s 10.0.0.2 -j=20
> natclnt_10_0_0_2
>
> ...etc
> iptables -t nat -A nat_clnt_new -j LOG --log-prefix UsrUnk=3D
>
> iptables -t nat -A nat_clnt_new -j DROP
> iptables -t nat -A PREROUTING -p tcp -m state --state NEW -s
> 10.0.0.0/24 -d 10.0.0.1 -j nat_clnt_new
> These chains above would be called when new TCP connections come in
> from VPN clients trying to reach 10.0.0.1.=C2=A0 The filter table onl=
y
> needs a single "blind" ACCEPT for all new TCP connections from
> 10.0.0.0/8.
>
> On average, each user is allowed to 5 different services (some just
> one, some 12 or more).=C2=A0 At 200 such users, that's over 1000 rule=
s=20
> just
> to control access.
>
> The major advantage to this setup was that if a service moved to a
> different host (say, going from dev/test to production DMZ), only the
> DNAT line for that one service needed to change.
>

 You mean *all* of the DNAT lines surely. Since there are multiple=20
 entries for it, one for each client needing access.

 Also, DROP does not being this benefit. It is the benefit of the DNAT=20
 rules. Hopefully nobody has removed DNAT capability from the NAT table=
=2E

>
> However, if this setup gets rebuilt using the filter table in the
> 'intended' way, the rules would have to be like:iptables -t filter -A
> fwdclnt_10_0_0_1 -p tcp -d  192.168.10.23 --dport 80 -j ACCEPT
> iptables -t filter -A fwdclnt_10_0_0_1 -j LOG --log-prefix FwdClnt_1=3D
>
> iptables -t filter -A fwdclnt_10_0_0_1 -j DROP
>
> iptables -t filter -A fwdclnt_10_0_0_2 -p tcp -d  192.168.10.23
> --dport 80 -j ACCEPT
> iptables -t filter -A fwdclnt_10_0_0_2 -p tcp -d 192.168.190.5
> --dport 80 -j ACCEPT
> iptables -t filter -A fwdclnt_10_0_0_2 -p tcp -d 192.168.190.5
> --dport 443 -j ACCEPTiptables  -t filter -A fwdclnt_10_0_0_2 -j LOG
> --log-prefix FwdClnt_2=3D
>
> iptables -t filter -A fwdclnt_10_0_0_2 -j DROP
> ...etc
>
> iptables -t filter -A fwdclnt_new -p tcp -s 10.0.0.1 -j=20
> fwdclnt_10_0_0_1
> iptables -t filter -A fwdclnt_new -p tcp -s 10.0.0.2 -j=20
> fwdclnt_10_0_0_2
>
> ...etc
>
> iptables -t filter -A fwdclnt_new -j LOG --log-prefix UsrUnk=3D
>
> iptables -t filter -A fwdclnt_new -j DROP
> iptables -t filter -A FORWARD -p tcp -m state --state NEW -s
> 10.0.0.0/24 -d 10.0.0.1 -j fwdclnt_new
>
> Notice that in this setup, if a service gets moved to another host or
> port, potentially hundreds of filter rules also have to be changed to
> reflect that.=C2=A0 Much more laborious and error prone.
>

 The ability to design things complicated does not imply the iptables=20
 developers intended you to design it that way.
 (disclaimer: I'm not one of them, just a user like yourself).


 Consider something like this:

  # 192.168.* is internal. Not the VPN or publicly advertised IPs for=20
 these services.
  # prevent attackers going directly there in case of an information=20
 leakage
  iptables -t mangle -d 192.168.0.0/16 -j DROP

  # ... NAT rules .... use RETURN or ACCEPT where you now have DROP

  # block anything that NAT did not alter to a internal destination.
  iptables -t filter -P DROP
  iptables -t filter -d 192.168.0.0/16 -j ACCEPT


 Simples. You can make the firewall more targeted by reducing the ACCEP=
T=20
 down to those particular ranges you say are scattered around.

 AYJ
