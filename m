From: =?ISO-8859-1?Q?Martin_Schi=F8tz?= <malinux@gmail.com>
Subject: iptables performance
Date: Wed, 25 May 2005 19:20:53 +0000
Message-ID: <e208f5d1050525122040c9003a@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Martin_Schi=F8tz?= <malinux@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi=20

I'm planning to set up a bridge running iptables on an uplink of a lot
of internet user. The uplink is on maximum at about 30 mbit/s. There
are about 1800 * /29 ip nets - some /29 nets needs to be stopped be
the bridge and some can pass. I'm wondering about the performance of
iptables when having 1800*2 rules worst case (PREROUTING rules on src
and dst nets).

Actually I have made some kind of hashing using user defined rules.
This gives a maximum of a packet to travel through about 65 + 32
rules. I have not tested live - before I do this, I would like to know
if anybody here have any experience or idea about performance  with
that kind of traffic load and number of rules?

Best regards,
Martin

My user defined rules:

iptables -t mangle -N 10.0.0.0/24
...
...
iptables -t mangle -N 10.0.x.x/24

iptables -t mangle -I 10.0.0.0/24 1 -m physdev --physdev-in $IF_DOWN
-s  10.0.0.0/29-j ACCEPT
iptables -t mangle -I 10.0.0.0/24 1 -m physdev --physdev-in $IF_UP -d=20
10.0.0.0/29 -j ACCEPT
...
...
iptables -t mangle -A 10.0.0.0/24 -j DROP
...
...

iptables -t mangle -I PREROUTING 4 -m physdev --physdev-in $IF_DOWN -s
$CUSTOMER_NET_1 --goto 10.0.0.0/24
iptables -t mangle -I PREROUTING 4 -m physdev --physdev-in $IF_UP -d
$CUSTOMER_NET_1 --goto 10.0.0.0/24
...
...
iptables -t mangle -I PREROUTING 4 -m physdev --physdev-in $IF_DOWN -s
$CUSTOMER_NET_1 --goto 10.0.x.x/24
iptables -t mangle -I PREROUTING 4 -m physdev --physdev-in $IF_UP -d
$CUSTOMER_NET_1 --goto 10.0.x.x/24

