From: "Manish Jain" <manish.jain@globallogic.com>
Subject: query regarding hashlimit using ipset src,dst tuple
Date: Sun, 15 Oct 2006 22:53:18 +0530
Message-ID: <001001c6f07e$9c290f80$0201a8c0@synapse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: 
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

I have a requirement as follows -

Say there are 2 source IPs - src1 and src2, and 2 destination IP - dst1,
dst2.
I need to limit src1->dst1 as well as src2-dst2 communication but want
unlimited src2->dst1 communication.
I have a ipset KNOWN, which contains src1, src2, dst1, dst2

Now i write a rule as follows -
iptables -A INPUT_CHAIN --match hashlimit --hashlimit 1000/s
--hashlimit-mode srcipdstip --hashlimit-name foo -m set --set KNOWN
src,dst -j ACCEPT

But this will limit the src2->dst1 communication as well, which I dont want.

1. Is there a way to add ip1,ip2 as a tuple in a ipset the way we can do for
ip1%port?
2. Is there a mode which can help me do this, using a single iptable rule as
above?
3. Is there a way to specify multiple ipsets in 1 iptable rule?

Thanks & Regards
Manish Jain


