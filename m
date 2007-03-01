From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Blocking direct private IP address
Date: Thu, 01 Mar 2007 10:20:34 +0100
Message-ID: <45E69AE2.9040401@plouf.fr.eu.org>
References: <BAY119-F18E57FAE6C344557F46010D6810@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY119-F18E57FAE6C344557F46010D6810@phx.gbl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Andrew Kraslavsky a =E9crit :
>=20
> iptables -t nat -A PREROUTING -d 10.0.0.1 -j DNAT --to-destination=20
> 192.168.0.99
>=20
> If I set up a host on the external/public network with a static route=20
> that causes it to send traffic addressed to 192.168.0.0/24 to the=20
> 10.0.0.1 external/public IP address of the firewall/router and then=20
> attempt to access the Web server using 192.168.0.99 as the address,=20
> these directly addressed packets get through the firewall.

Yes.

> The reason these packets are not dropped by my filter:FORWARD chain is=20
> because, at that point, the destination IP is 192.168.0.99 regardless o=
f=20
> whether the destination was NATted or not. I.e., I do not how to create=
=20
> a filtering rule that says "allow traffic from eth0 to 192.168.0.99 on=20
> eth1, but only if it was NATted".

Yes.

> I can certainly drop the directly addressed packets in the=20
> mangle:PREROUTING chain, either by adding a rule that tests for and=20
> drops all possible local subnets IP address destinations on incoming=20
> eth0 traffic or, probably more cleanly, add a rule in mangle:PREROUTING=
=20
> that only allows through packets from eth0 with a destination IP of=20
> 10.0.0.1, but it seems like the iptables guidlelines are to only do=20
> filtering in the filter table.
>=20
> I also did some research on /proc settings but could not find one that=20
> seemed to meet my needs.

You won't find anything in /proc.

> The other option I was considering was to define some advanced routing=20
> stuff, but I have not really looked into that in detail yet.

Advanced routing won't help you much either. Routing occurs after the=20
PREROUTING chain and doesn't know about the original destination address.

You have a handful of options :

1) DROP in the mangle/PREROUTING chain before it is DNATed. Sure, it is=20
not recommended in guidelines, but it is simple and it works.

iptables -t mangle -A PREROUTING -i eth0 -d 192.168.0.0/24 -j DROP

2) DNAT traffic originally destined to the private address into an=20
invalid address such as a loopback address, so that the routing drops it.

iptables -t nat -A PREROUTING -i eth0 -d 192.168.0.0/24 \
   -j DNAT --to 127.0.0.0

* Note that this rule won't match packets in the INVALID state (and=20
UNTRACKED, but you should know when you use the NOTRACK target), so you=20
have to make sure they are dropped in the FORWARD chain.

3) Mark traffic in the mangle/PREROUTING chain before it is DNATed and=20
filter in the FORWARD chain according to the mark.

iptables -t mangle -A PREROUTING -i eth0 -d ! 10.0.0.1 \
   -j MARK --set-mark 1
iptables -A FORWARD -i eth0 -m mark --mark 1 -j DROP

You can also use marks in the other way, to mark valid packets and=20
accept only those. Or you can use the mark with advanced routing with a=20
"blackhole" or "unreachable" route.

4) Check the original destination address with the "conntrack" match.

iptables -A FORWARD -i eth0 -d 192.168.0.99 -p tcp --dport 80 \
   -m conntrack --ctstate DNAT --ctorigdst 10.0.0.1 -j ACCEPT

5) And last, my favourite option : just don't care about it. After all,=20
why bother ? ;-)

