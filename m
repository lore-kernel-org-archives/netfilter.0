From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: dummy target?
Date: Fri, 18 Mar 2005 14:46:20 +0100
Message-ID: <423ADBAC.4020406@uplink-verein.ch>
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

i want to use the counters for statistic stuff. i already have a working example. but i want to get 
numbers for pakets, which i acutally have no rule for (e.g. all incoming traffic).
is there a dummy target? like:
$IPTABLES -t mangle -A PREROUTING -m physdev --physdev-in $INET_IF -j DUMMY

dummy target: do nothing, do not terminate, do just increment counters.

cheers
moritz

