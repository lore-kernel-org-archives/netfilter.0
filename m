From: Vidya Ravipati <ravipati@cs.sunysb.edu>
Subject: how to unblock connections coming from a NAT boxB
Date: Fri, 29 Sep 2006 14:58:38 -0400 (EDT)
Message-ID: <Pine.GSO.4.53.0609291453110.14793@compserv4>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a question regarding how to unblock the incoming connections
from the source NAT box.
If I have source machine behind the NAT , how should I configure my
iptable rules to unblock the connections coming from that particular host
only.
1) How should I specify my rule to unblock only particular host behing the
source NAt only
2)How to unblock the particular host behind the particular NAT box (can
allow the connections from other host behind the same NAt also)

Thanks

Vidya Sagar Ravipati


