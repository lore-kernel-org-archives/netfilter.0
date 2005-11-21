From: Daniel Sievers <sievers@hilton.rwth-aachen.de>
Subject: conntrack question - what happens after timeout?
Date: Mon, 21 Nov 2005 10:37:25 +0100
Message-ID: <43819555.9030005@hilton.rwth-aachen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,


since recently we have had some problems with the conntrack table
growing too large and thus I experimented with lowering
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established
from 5 days to a couple of hours.

One thing I am still curious about though:
What happens after established connections timeout if packets arrive
which still belong to that connection? Do they get dropped automatically
by netfilter or do I have to set up a rule to accomplish this?

In other words: Is the conntrack code merely about managing a table with
connection states that gets used e.g. in the NAT code and can be used to
query the state of connections in iptables rules or does it perform
stateful inspection itself and (based on that) packet dropping etc. too?

Thanks for your help.
-Daniel


