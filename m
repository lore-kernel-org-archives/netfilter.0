From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: MARK
Date: Tue, 22 Mar 2005 22:59:53 +0100
Message-ID: <42409559.7080001@uplink-verein.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

hi all

i got an problem with the MARK target:

$IPTABLES -t mangle -A PREROUTING -p ICMP -s 0/0 --icmp-type 8 -j MARK --set-mark 1 # ECHO

gives the following error:
iptables: Invalid argument

ipt_MARK is loaded. (and also ipt_mark, just in case ;-) )

i once was running this target without any problems. but i changed to connmark (not my best idea).

so do i have a typo? it seems for me exactly the way as the docu and the source want it to be...
iptables 1.2.11

btw, it runs perfectly with:

$IPTABLES -t mangle -A PREROUTING -p ICMP -s 0/0 --icmp-type 8 -j CONNMARK --set-mark 1 # ECHO

regards (maybe to late or to less coffee)
moritz

