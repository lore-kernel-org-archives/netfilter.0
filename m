From: =?utf-8?q?Fr=C3=A9d=C3=A9ric=20Gonzatti?= <fred99@libertysurf.fr>
Subject: Re: Firewall IP change
Date: Mon, 2 Aug 2004 17:10:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408021710.01203.fred99@libertysurf.fr>
References: <40FEE340.8090907@ctwa.com> <200408021612.41826.fred99@libertysurf.fr> <200408021557.12351.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408021557.12351.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org


1-My iptables rules are the following :
iptables -t filter -F
iptables -t nat -F

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT DROP

iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT

iptables -t nat POSTROUTING -o eth2 -j MASQUERADE

###########
# FORWARD #
###########

                        ##############
                        # LAN -->DMZ #
                        ##############



iptables -t filter -A FORWARD -i eth0 -o eth1 -s 172.16.0.0/16 -d=20
192.168.2.150/32 -p tcp --dport 110 -m state --state NEW,ESTABLISHED -j=20
ACCEPT
iptables -t filter -A FORWARD -i eth1 -o eth0 -s 192.168.2.150/32 -d=20
172.16.0.0/16 -p tcp --sport 110 -m state --state ESTABLISHED -j ACCEPT




                        ###############
                        # LAN --> WAN #
                        ###############




####################################
# PROTOCOLE IDENT : TCP et UDP 113 #
####################################
iptables -t filter -A FORWARD -p tcp --dport 113 -j ACCEPT
iptables -t filter -A FORWARD -p tcp --sport 113 -j ACCEPT
iptables -t filter -A FORWARD -p udp --dport 113 -j ACCEPT
iptables -t filter -A FORWARD -p udp --sport 113 -j ACCEPT



###################################
# HTTP, HTTPS : TCP 80 et TCP 443 #
###################################
iptables -t filter -A FORWARD -i eth0 -o eth2 -s 172.16.0.0/16 -d 0/0 -p tc=
p=20
=2D-dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -s 0/0 -d 172.16.0.0/16 -p tc=
p=20
=2D-sport 80 -m state --state ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -i eth0 -o eth2 -s 172.16.0.0/16 -d 0/0 -p tc=
p=20
=2D-dport 443 -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -s 0/0 -d 172.16.0.0/16 -p tc=
p=20
=2D-sport 443 -j ACCEPT
iptables -t filter -A FORWARD -i eth0 -o eth2 -s 172.16.0.0/16 -d 0/0 -p ud=
p=20
=2D-dport 443 -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -s 0/0 -d 172.16.0.0/16 -p ud=
p=20
=2D-sport 443 -j ACCEPT

##################
# Protocole POP3 #
##################

iptables -t filter -A FORWARD -i eth0 -o eth2 -s 172.16.0.0/16 -d 0/0 -p tc=
p=20
=2D-dport 110 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -s 0/0 -d 172.16.0.0/16 -p tc=
p=20
=2D-sport 110 -m state --state ESTABLISHED -j ACCEPT

#################
# Protocole FTP #
#################


modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

iptables -t filter -A FORWARD -s 172.16.0.0/16 -d 0/0 -p tcp --dport 21 -m=
=20
state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -s 0/0 -d 172.16.0.0/16 -p tcp --sport 21 -m=
=20
state --state ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -s 172.16.0.0/16 -d 0/0 -p tcp --dport 20 -m=
=20
state --state ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -s 0/0 -d 172.16.0.0/16 -p tcp --sport 20 -m=
=20
state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -s 172.16.0.0/16 -d 0/0 -p tcp --dport=20
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -s 0/0 -d 172.16.0.0/16 -p tcp --sport=20
1024:65535 -m state --state ESTABLISHED -j ACCEPT


iptables -t filter -A INPUT -j DROP
iptables -t filter -A OUTPUT -j DROP
iptables -t filter -A FORWARD -j DROP

2- My default route is the IP of the LAN interface of my router which is a=
=20
public IP (62.160.X.X/255.255.255.248)

3- eth0 : 172.16.2.1/255.255.0.0
    eth1: 192.168.2.1/255.255.255.0
    eth2: 62.160.X.Y/255.255.255.248

Regards,

=46rederic



> On Monday 02 August 2004 3:12 pm, Fr=C3=A9d=C3=A9ric Gonzatti wrote:
> > Sorry, my external interface is eth2 (it's just an error when I wrote t=
he
> > mail).
> > Some pages takes lots of time to appear when I'm using the first line in
> > my script. When I'm using the second one they appear immediately.
> > My DNS server is on my LAN with a private IP address 172.16.2.200.
>
> Please show us:
>
> 1. The exact rules you are referring to (no typos, no hidden addresses, t=
he
> exact rules as they appear in the scripts).
>
> 2. The routing table (output of "route -n") of the firewall
>
> 3. The interface configuration (output of "ifconfig") from the firewall.
>
> Regards,
>
> Antony.
>
> > > On Monday 02 August 2004 1:07 pm, Fr=C3=A9d=C3=A9ric Gonzatti wrote:
> > > > If I replace in my iptables script :
> > > > iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to my_public_IP
> > > > by
> > > > iptables -t nat POSTROUTING -o eth1 -j MASQUERADE
> > > >
> > > > ...I can access to the internet faster !
> > > >
> > > > Have you got any idea ?
> > >
> > > Which is your external interface?   eth1 or eth2?
> > >
> > > How are you measuring "faster"?
> > >
> > > Where are your DNS servers?
> > >
> > > Regards,
> > >
> > > Antony.



