From: "Hirantha Wijayawardena" <hirantha@crescat.com>
Subject: RE: Need an advice
Date: Tue, 23 Nov 2004 17:47:10 +0600
Message-ID: <C97EC9D40F9B8E469B2187228615909104853C@mail.crescat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Hi,

Thank a lot for those posts. I have an ADSL router which is built-in NAT
to the LAN users.

<INTERNET> <--> <ADSLROUTER (NAT enabled)> <--> <eth0><LINUX
FIREWALL><eth1>

INET_IFACE=3D"eth0"
INET_IP=3D"192.168.1.2"

LAN_IP=3D"10.1.1.1"
LAN_IFACE=3D"eth1"

IPTABLES=3D"/usr/sbin/iptables
$IPTABLES -N allowed
$IPTABLES -N tcp_packets

1.) I do not wanted to enable the NAT on my Linux firewall but tight the
security for the LAN users, though the following rule is still valid! Is
it ture?

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT -to $INET_IP

2.) If I need to install and enable squid/SquidGuard on the Linux
firewall and redirect LAN user's initial web request to the squid
authentication page. Is the following rules are enough?

$IPTABLES -t nat -A PREROUTING -i $LAN_IFACE -p tcp --dport 80 \
		-j REDIRECT --to-ports 3128
$IPTABLES -A OUTPUT -j ACCEPT -m state --state NEW -o $INET_IFACE \
		-p tcp --dport 80

3.) How do I enable LAN users to access specific services on the
internet (i.e. http,https,pop3,mms and dns) only and block all other
ports. Is it possible with following rules?

$IPTABLES -A INPUT -i $INET_IFACE -p tcp ! --syn --source-port 25 \
		-s $INET-IP --destination-port 1024: -j ACCEPT
$IPTABLES -A OUTPUT -o $INET_IFACE -p tcp -s $INET_IP --source-port
1024: \
		--destination-port 25 -j ACCEPT

$IPTABLES -A INPUT -i $INET-IFACE -p tcp ! --syn --source-port 80 \
		-s $INET-IP --destination-port 1024: -j ACCEPT
$IPTABLES -A OUTPUT -o $INET_IFACE -p tcp -s $INET_IP --source-port
1024: \
		--destination-port 80 -j ACCEPT

and so on...

4.) If I run the DNS service (DNS forwarder) on the Linux firewall, is
following rule is still valid as previous mail explained?

$IPTABLES -A tcp_packets --dport 53 -j allowed


Please advice since I need to get good understand about iptables before
I going to implement stage.

Thanks in advance.

- Hirantha





-----Original Message-----
Date: Wed, 17 Nov 2004 08:30:09 -0500
From: Jason Opperisano <opie@817west.com>
Subject: Re: Need an advice
To: netfilter@lists.netfilter.org
Message-ID: <1100698209.3695.73.camel@hubcap.ljm.dom>
Content-Type: text/plain

On Wed, 2004-11-17 at 00:16, Hirantha Wijayawardena wrote:
> Dear Experts,
>=20
> These days I'm following the iptables tutorial 1.1.19 to refresh my
mind
> with iptables. But I came across some confusions while reading the doc
> (I thinks I'm having some misunderstands). The following are my
> questions and please explain how these packets traverse.
>=20
> # INPUT chain
>=20
> $IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
> This match all TCP packets in the INPUT chain that comes in on the
> $INET_IFACE interface, and send those to the tcp_packets

yes.

> #
> # TCP rules
> #
>=20
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed
>=20
>=20
> -A tcp_packets tells iptables in which chain to add the new rule, the
> rule will be added to the end of the chain. -p TCP tells it to match
TCP
> packets

since the only way a packet will ever enter the "tcp_packets" chain is
if it matches "-p TCP -i $INET_IFACE" the "-p tcp" is somewhat redundant
here.

>  and -s 0/0 matches all source addresses from 0.0.0.0 with
> netmask 0.0.0.0, in other words all source addresses.=20

-s 0/0 is assumed if not specified.  so your tcp_packets chain really
could look like:

  $IPTABLES -A tcp_packets --dport 21 -j allowed
  $IPTABLES -A tcp_packets --dport 22 -j allowed
  $IPTABLES -A tcp_packets --dport 80 -j allowed
  $IPTABLES -A tcp_packets --dport 113 -j allowed

or even cleaner:

  $IPTABLES -A tcp_packets -m multiport --dports 21,22,80,113 -j allowed

> If all the
> criteria are matched, then the packet will be targeted for the allowed
> chain. If it doesn't match any of the rules, they will be passed back
to
> the original chain that sent the packet to the tcp_packets chain.

yes.

> 1.) If the packet does not match, then it will return to the original
> chain. So what is the chain? Is it:
>=20
> $IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets=20
> or
> $IPTABLES -P INPUT DROP

it is whatever rule comes after:

  $IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets

if that happens to be the last rule in the INPUT chain--then the POLICY
of the INPUT chain will be enforced.

> 2.) If that is send to $IPTABLES -P INPUT DROP, do we have to create
TCP
> rules for each destination port?
> 3.) TCP rules set are for only we are running particular services on
the
> filerwall or should assign if we running services behind the firewall?

since you're jumping to "tcp_packets" from INPUT--these rules only apply
to services running on the firewall itself.  if you want to allow access
to TCP services behind the firewall, you would need to jump to
"tcp_packets" from FORWARD.

> 4.) What is the best method to sharing the internet for the LAN users?
> Is it SNAT or MASUERADE?

easy:  if your external interface has a static IP, use SNAT; if it's
dynamically assigned, use MASQUERADE

-j

--
"Here we have an ordinary square.
 Whoa! Slow down egghead!"
	--The Simpsons

