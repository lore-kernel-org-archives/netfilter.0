From: Moritz Gartenmeister <moritz.gartenmeister@access.unizh.ch>
Subject: iptables dnat, ebtables, mark
Date: Wed, 10 Nov 2004 16:41:05 +0100
Message-ID: <41923691.40803@access.unizh.ch>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi

my idea:
i know the mac-adress from a compromised computer in my lan. i want to redirect all the traffic from 
this computer to a webserver (to show up a page with e.g. "bad guy! you got a virus").

my system:
debian testing 2.6.7
iptables
ebtables
bridge-code

my solution so far:
ebtables -t nat -A PREROUTING -s $MAC -j mark --set-mark 8 --mark-target CONTINUE
there are no other rules in this chain.
some more rules in -A FORWARD all with -s macadress, but not the one above.

is the only rule in prerouting nat.
iptables -t nat -A PREROUTING -m mark --mark 0x8 -j DNAT --to-destination $IP-WWW

is the first role in the mangle chain.
iptables -t mangle -A PREROUTING -m mark --mark 0x8 -j ACCEPT

one check rule in mangl POSTROUTING
iptables -t mangle -A POSTROUTING -m -mark --makr 0x8 -j LOG --log-prefix IPT_MARK

my problem:
the user can access the webserver and only this server, but the user is not redirected to the 
web-server, if he tries to access e.g. www.google.com. he only get an error-message.

my observation:
number of packets differ...
ebtables 213 packets
prerouting mangle 200 packets
prerouting nat 118 packets
postrouting mangle 93 packets

any explanations? the number should be at least the same. i don't understand this. the filter-rules 
seem to work properly...

cheers
moritz

