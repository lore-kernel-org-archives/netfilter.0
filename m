From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Help with IPtables and NAT
Date: Fri, 21 Jul 2006 16:32:21 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE58290167984@pxtbenexd01.pxt.primeexalia.com>
References: <44C16109.20704@jemconsult.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <44C16109.20704@jemconsult.biz>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: James Marcinek <jmarc1@jemconsult.biz>, netfilter@lists.netfilter.org

You basically you are looking for DNAT on the inside for all hosts and
1:1 SNAT for the .2 address?

If that is the case then you will to change the *nat rules to something
like this:

Where 192.168.0.x are the external address and 10.1.0.x are the internal
addresses

-A PREROUTING -d 192.168.0.1 -j DNAT --to-destination 10.1.0.1
-A PREROUTING -d 192.168.0.2 -j DNAT --to-destination 10.1.0.2

-A POSTROUTING -s 10.1.0.1 -o eth0 -j SNAT --to-source 192.168.0.1
-A POSTROUTING -s 10.1.0.2 -o eth0 -j SNAT --to-source 192.168.0.2=20
# Some say the next two aren't required but odd things happen when I'm=20
# trying to access things from the internal subnet from the external=20
# IP.  This seems to fix that.
-A POSTROUTING -s 10.1.0.1 -d 10.1.0.1 -j SNAT --to-source 192.168.0.1
-A POSTROUTING -s 10.1.0.2 -d 10.1.0.2 -j SNAT --to-source 192.168.0.2
-A POSTROUTING -o eth0 -j SNAT --to-source 192.168.0.1

-A OUTPUT -d 192.168.0.1 -j DNAT --to-destination 10.1.0.1
-A OUTPUT -d 192.168.0.2 -j DNAT --to-destination 10.1.0.1

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of James Marcinek
> Sent: Friday, July 21, 2006 4:20 PM
> To: netfilter@lists.netfilter.org
> Subject: Help with IPtables and NAT
>=20
> Hello Everyone,
>=20
> I've been running my Red Hat box as a router for my small network for
> the past couple of years with no problems (if it works don't fix it).
I
> have another live IP address that I would like use. I would like any
> traffic destined for this 'new' address to forward (DNAT) traffic to a
> system in my intranet. I don't want to blindly allow all traffic, just
> certain ones based off of rules. I have attempted to do this a couple
of
> time but without success. Below is my current topology (real IP's have
> been substituted for 172.10.10.x addresses:
>=20
>=20
>=20
>=20
>                    Internet
>=20
>                           |
>=20
>                          |
>=20
>                          |
>=20
>            -------------------------
>=20
>            | 172.10.10.1 eth0        |
>=20
>            |                                    |
>=20
>            |                                    |
>=20
>            | 192.168.0.1 eth1         |
>=20
>            -------------------------
>=20
>                           |
>=20
>                           |
>=20
>                           |
>=20
>                  Intranet (private network)
>=20
>=20
> Here's what I would like to have:
>=20
>=20
>                    Internet
>=20
>                           |
>=20
>                          |
>=20
>                          |
>=20
>            -------------------------
>=20
>            | 172.10.10.1 eth0        |
>=20
>            | 172.10.10.2 eth0:0     |
>=20
>            |                                    |
>=20
>            | 192.168.0.1 eth1        |
>=20
>            -------------------------
>=20
>                           |
>=20
>                           |
>=20
>                           |
>=20
>                  Intranet (private network)
>=20
>                           |
>=20
>=20
> ----------------------------------------->172.10.10.2 traffic to
> 192.168.0.2
>=20
> I have bound the 2 IP addresses to the external NIC on my system (RHEL
> 4). I have attempted at modifying the script and have reverted to my
> original to start over. Here's my current config:
>=20
> # First drop everything (lets you open what you want)
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
>=20
> # User-defined chain for ACCEPTed TCP packets
> iptables -N okay
> iptables -A okay -p TCP --syn -j ACCEPT
> iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A okay -p TCP -j DROP
>=20
> # INPUT chain rules
> iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/24 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 172.10.10.1 -j ACCEPT
> iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j ACCEPT
>=20
> # Rules for incoming packets from the Internet
>=20
> # Packets for established connections
> iptables -A INPUT -p ALL -d 172.10.10.1 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
>=20
> # TCP rules
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 21 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 22 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 25 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 80 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 443 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 953 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 993 -j okay
>=20
> # UDP rules
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 53 -j
ACCEPT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 2074 -j
ACCEPT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 4000 -j
ACCEPT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 953 -j
ACCEPT
>=20
> # ICMP rules
>=20
> # FORWARD chain rules
> iptables -A FORWARD -i eth1 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
>=20
> # OUTPUT chain rules
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 172.10.10.1 -j ACCEPT
>=20
> # POSTROUTING
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 172.10.10.1
>=20
> ###################
>=20
> This has been working fine for me. I've been modifying it and things
> haven't been going well for me I have to say. Would I would like to do
> is forward any traffic that is going to eth0:0 and send it to an
> internal system. I don't want everything open on this system. This is
my
> latest concoction:
>=20
> # First drop everything (lets you open what you want)
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> iptables -t nat -P PREROUTING DROP
> iptables -t nat -P POSTROUTING DROP
>=20
> # PREROUTING chain rules
> # iptables -t nat -i PREROUTING 1 -d 172.10.10.2 -j LOG --loglevel
debug
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 80 -j DNAT
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 443 -j
DNAT
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 21 -j DNAT
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 22 -j DNAT
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 25 -j DNAT
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 953 -j
DNAT
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 993 -j
DNAT
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT
> --to-dest 192.168.0.2
>=20
> # User-defined chain for ACCEPTed TCP packets
> iptables -N okay
> iptables -A okay -p TCP --syn -j ACCEPT
> iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A okay -p TCP -j DROP
>=20
> # INPUT chain rules
> iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/24 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 172.10.10.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 172.10.10.2 -j ACCEPT
> iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j ACCEPT
>=20
> # Rules for incoming packets from the Internet
>=20
> # Packets for established connections
> iptables -A INPUT -p ALL -d 172.10.10.1 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -p ALL -d 172.10.10.2 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
>=20
> # TCP rules
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 21 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 22 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 25 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 80 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 443 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 953 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 993 -j okay
>=20
> # UDP rules
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 53 -j
ACCEPT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 2074 -j
ACCEPT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 4000 -j
ACCEPT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 953 -j
ACCEPT
>=20
> # ICMP rules
>=20
> # FORWARD chain rules
> iptables -A FORWARD -i eth1 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> # iptables -A FORWARD -i eth0 -d 192.168.0.2 -j ACCEPT
>=20
> # OUTPUT chain rules
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 172.10.10.1 -j ACCEPT
> # iptables -A OUTPUT -p ALL -s 172.10.10.2 -j ACCEPT
> iptables -t nat -A OUTPUT -d 172.10.10.2 -p ALL -j DNAT
--to-destination
> 192.168.0.2
>=20
> # POSTROUTING
> iptables -t nat -A POSTROUTING -s 192.168.0.2 -j SNAT --to-source
> 172.10.10.2
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 172.10.10.1
>=20
> I put all of the ports that I want allowed to go to the internal
system
> in the PREROUTING table. Is this the right way to do it? I would hope
> that somebody can look at this and tell me what I'm doing wrong and
what
> I'm missing.
>=20
> Thanks,
>=20
> James
>=20
>=20


