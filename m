From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: iptables dnat, ebtables, mark
Date: Wed, 10 Nov 2004 16:42:46 +0100
Message-ID: <419236F6.4060306@uplink-verein.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

hi

my idea:
i know the mac-adress from a compromised computer in my lan. i want to re=
direct all the traffic from
this computer to a webserver (to show up a page with e.g. "bad guy! you g=
ot a virus").

my system:
debian testing 2.6.7
iptables
ebtables
bridge-code

my solution so far:
ebtables -t nat -A PREROUTING -s $MAC -j mark --set-mark 8 --mark-target =
CONTINUE
there are no other rules in this chain.
some more rules in -A FORWARD all with -s macadress, but not the one abov=
e.

is the only rule in prerouting nat.
iptables -t nat -A PREROUTING -m mark --mark 0x8 -j DNAT --to-destination=
 $IP-WWW

is the first role in the mangle chain.
iptables -t mangle -A PREROUTING -m mark --mark 0x8 -j ACCEPT

one check rule in mangl POSTROUTING
iptables -t mangle -A POSTROUTING -m -mark --makr 0x8 -j LOG --log-prefix=
 IPT_MARK

my problem:
the user can access the webserver and only this server, but the user is n=
ot redirected to the
web-server, if he tries to access e.g. www.google.com. he only get an err=
or-message.

my observation:
number of packets differ...
ebtables 213 packets
prerouting mangle 200 packets
prerouting nat 118 packets
postrouting mangle 93 packets

any explanations? the number should be at least the same. i don't underst=
and this. the filter-rules
seem to work properly...

cheers
moritz


--=20
Uplink student association
Moritz Gartenmeister
B=FClachstrasse 1 F
8057 Z=FCrich
Switzerland

