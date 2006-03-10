From: Micah Anderson <micah@riseup.net>
Subject: Counting elements of an ipset
Date: Fri, 10 Mar 2006 19:12:44 +0000 (UTC)
Message-ID: <slrne13jtk.cv0.micah@pond.riseup.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I'm using ipsets and it appears as if ipsets do not have counters for
packet matching, you can only count packets that match an entire set.

For example, if I do:

iptables -v -n -x -m set -L input --set accounting src,dst 

it only prints the packet counts of the ipsets, not the specific ip
addresses in the sets. Is there a way I can get iptables to tell me
the packets of a particular IP in an ipset?

I can create an ipmap ipset for each individual IP that I want to
count, and then count each of those set's packet counts, but do I gain
anything by doing this (ie. does using ipsets save me any memory or
CPU in this scenario?)

Thanks,
micah


