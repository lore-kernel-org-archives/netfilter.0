From: Eduardo =?ISO-8859-1?Q?Fern=E1ndez_Gonz=E1lez?= <efgonzalez@worldonline.es>
Subject: Bonding + NAT
Date: Fri, 28 Mar 2003 14:50:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030328145059.2ea1241a.efgonzalez@worldonline.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter mailing list <netfilter@lists.netfilter.org>

Hello.

In my university dorm we've got a private net with two subnets: I'll call o=
ne of them the servers subnet (10.1.5.0/24) because there are some servers =
(ftp, web, streaming, etc) and a couple of routers: one is a cisco router w=
hich provide us with internet access and the other one is a linux system wh=
ich acts as a router between this subnet and the other subnet (10.1.7.0/24)=
, which I'll refer as the students subnet, where there are about 250 hosts.=
=20

The linux router is doing NAT, and it is a dhcp, ddns and pdc (primary doma=
in controller) server too. The traffic between this subnets is very heavy b=
ecause of the ftp server, so we decided to add two more ethernet cards to t=
he linux router (4 in total) and configure bonding. But only the switches a=
t the students subnet supported bonding, so now we have two cards (eth1 and=
 eth3) showing the same ip (10.1.7.1) with bonding and the other two cards =
(eth0 and eth2) with two ips (10.1.5.4 and 10.1.5.3). Then, our idea was to=
 force the traffic between the subnets to leave the router over eth2, and t=
o make the rest of the traffic leave the router over eth0. At first, I thou=
ght the following nat rules were enough to implement this,

# iptables -t nat -A POSTROUTING -o eth2 -s 10.1.7.0/24 -d 10.1.5.0/24 -j S=
NAT --to-source 10.1.5.3
# iptables -t nat -A POSTROUTING -o eth0 -s 10.1.7.0/24 -d ! 10.1.5.0/24 -j=
 SNAT --to-source 10.1.5.4

but I was wrong: I was able to ping the internet from the students subnet, =
and the traffic left the router over the right interface, but I was unable =
to ping any host at the servers subnet. And the question is, am I wrong? Is=
 it possible to implement what I've said via iptables?=20

As a quick and dirty hack, we're using iproute2 to make all traffic between=
 the students and the ftp leave the router over eth2, but what's bad on ipr=
oute2 is that you have to specify single hosts, not a whole network like 10=
.1.5.0/24. Moreover, you can't use rules of the kind -d ! 10.1.5.0/24, unli=
ke with iptables. Is iptables the right approach to do this? Am i missing s=
omething?

Thank you very much in advance,

Eduardo Fern=E1ndez

