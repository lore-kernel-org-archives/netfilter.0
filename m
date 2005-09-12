From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: performance question
Date: Mon, 12 Sep 2005 21:06:27 +0200
Message-ID: <4325D1B3.5030606@uplink-verein.ch>
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
To: netfilter lists <netfilter@lists.netfilter.org>

hi

i'm just wondering, if my experienced performance in my network is usual.

setup:

debian linux
kernel 2.6.8.1 (patched with pom espacially l7-filter and ipp2p)
linux-brigde

everthing is working so far (that's the good part).

but i measure different downloadrates:
on my machine (behind the bridge) ~70Kbyte/s
on the bridge ~200Kbyte/s

the linux-bridge has to forward ~500 clients and has to shape 
transparently the traffic.

is this difference in downloadrates normal?

my assumption so far:
i have 4 interfaces on the linux bridge.
eth1 and eth2 doing the bridge, so they are heavly used.
eth0 is rarely used, so this may be an explanation.

even if i stop iptables, there is no increase.

i would just appriciate, if someone can confirm this as ususal behavior.

greets
moritz

