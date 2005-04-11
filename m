From: Adrian Turcu <adrian.turcu@gmvinteractive.com>
Subject: I need help with "CONNMARK --set-mark"
Date: Mon, 11 Apr 2005 11:34:19 +0100
Message-ID: <200504111134.26674.adrian.turcu@gmvinteractive.com>
Reply-To: adrian.turcu@gmvinteractive.com
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3288114.DHMKXhYjoV";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

--nextPart3288114.DHMKXhYjoV
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello list,

I experience some intermittent problems with CONNMARK chain when try to=20
conserve the connection mark. Sometimes it works just fine, but sometimes i=
t=20
seems that it stops working for whatever reason. Let me explain my setup=20
(it's a test environment):


outside world | ---- | eth1 Linux_box eth0 | ---- | server

The traffic to the server has to be marked in order to shape it with tc=20
(iproute2). Well, I envisage that the rules in iptables will be growing fas=
t=20
for the production environment, so I took advise from someone (Wang Jiang) =
on=20
LARTC who suggested to use CONNMARK to skip processing the long rules-list=
=20
for each packet enters/output my Linux box (which is really cool stuff). Th=
e=20
discussion was there on a different subject, but the problems I have are=20
related (I believe) with CONNMARK behaviour.

So, I have the rules as follows:


# match 'n' skip already marked traffic
/sbin/iptables -t mangle -A PREROUTING -m connmark --mark 0x8000/0x8000 \
	-j CONNMARK --restore-mark --mask 0xffff
/sbin/iptables -t mangle -A PREROUTING -m connmark --mark 0x8000/0x8000 \
	-j RETURN
#
# Assign different marks to different traffic:
# 192.168.1.218/32 is my server IP address and
# the traffic refers to Ingress (Egress will be similar)

# create a class :3280x
/sbin/iptables -t mangle -N class_3280x
/sbin/iptables -t mangle -A PREROUTING -i eth1 \
	-d ! 192.168.1.218/255.255.255.255 -j class_3280x
# mark the traffic matchin this class and return=20
# class :32801	(section 1)
/sbin/iptables -t mangle -A class_3280x -j CONNMARK --set-mark 0x8021/0xFFFF
/sbin/iptables -t mangle -A class_3280x -j RETURN

# create a class: 6550x
/sbin/iptables -t mangle -N class_6550x
/sbin/iptables -t mangle -A PREROUTING -i eth1 \
	-d 192.168.1.218/255.255.255.255 -j class_6550x
# mark the traffic matching this class and return
# class 65501 (section 2)
/sbin/iptables -t mangle -A class_6550x -j CONNMARK --set-mark 0xFFDD/0xFFFF
/sbin/iptables -t mangle -A class_6550x -j RETURN

# iprtoute2 tc stuff to regulate the traffic
#
# Ingress
/sbin/tc qdisc add dev eth1 handle ffff: ingress

# class :32801 (0x8021)
/sbin/tc filter add dev eth1 parent ffff: protocol ip prio 10 \
        u32 match mark 0x8021 0xffff \
        police rate 512kbit burst 512kbit mtu 1500 drop flowid :1

# class :65501  (0xFFDD)
/sbin/tc filter add dev eth1 parent ffff: protocol ip prio 10 \
        u32 match mark 0xFFDD 0xffff \
        police rate 256kbit burst 256kbit mtu 1500 drop flowid :1


Well, I generate some traffic on the network of eth1 to match the above rul=
es.=20
I can see first packets (SYN if the rules are applied before the connection=
s=20
establishes) matching the iptables rules for each class and then the flow i=
s=20
matched by the first 2 rules only (which is what I intended to do - skip th=
e=20
rules if traffic already marked). Now, I can also see the marked connection=
s=20
using

cat /proc/net/ip_conntrack

which is fine.


When this setup works the traffic matches the tc rules, no probs, and it is=
=20
assigned the bandwidth I want. When it doesn't work... the traffic matches=
=20
the iptables rules in the same way when it's working, I can still track the=
=20
connections marks in /proc/net/ip_conntrack, but the tc rules are never=20
applied (I can see the stats for tc intercepting the traffic but not matchi=
ng=20
the marks, it's like they are not there).

Some will say that this is related with iproute2 tools, but I have came acr=
oss=20
with this situation: instead of CONNTRACK marking, I do normal MARK and sav=
e=20
the marks with CONNTRACK (just before RETURN), which means that in sections=
 1=20
& 2 identified above (for iptables rules) I rewrite the rules like this:

/sbin/iptables -t mangle -A class_3280x -j MARK --set-mark 0x8021
/sbin/iptables -t mangle -A class_3280x -j CONNMARK --save-mark
/sbin/iptables -t mangle -A class_3280x -j RETURN

respectively,

/sbin/iptables -t mangle -A class_6550x -j MARK --set-mark 0xFFDD
/sbin/iptables -t mangle -A class_3280x -j CONNMARK --save-mark
/sbin/iptables -t mangle -A class_6550x -j RETURN

This works always for me, I have try it dozens of time with no problem, whi=
lst=20
the --set-mark in CONNTRACK works sometime 1 out of 10 tries or never. It=20
looks that setting the mark per connection is not that accurate and I need =
to=20
remark every packet if unmarked? Am I doing something wrong?

I'm using custom built kernel 2.6.11.6 and iptables 1.3.1. This rather stra=
nge=20
behaviour occurs (for at least I could tell) when restarting the linux box=
=20
and reaplying the rules or just deleting the rules and reaplying them again=
=20
or inserting new matching rules.

Any help will be much appreciated,
Adrian

--nextPart3288114.DHMKXhYjoV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBCWlKyeUXaRUbEOnARAncBAJ9G+VtV06bFUbVLyBV4Dq19I1YvAACeICkX
XxC2Cja4Ih1GCCmJPuR3vgE=
=AmHo
-----END PGP SIGNATURE-----

--nextPart3288114.DHMKXhYjoV--

