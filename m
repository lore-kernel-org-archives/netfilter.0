From: Leonid Veytser <veytser@cs.bu.edu>
Subject: Changing iph->daddr at NF_IP_PRE_ROUTING hook
Date: Fri, 7 Nov 2003 18:38:43 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.20.0311071828040.14674-100000@csa.bu.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am using Netfilter with libipq to create an overlay routing application
at the user space. So, basically I take a packet and according to some
rules I may encapsulate this packet with another IP header so that it
would go through another node. This attached header has this machine's
saddr, decapsulator's daddr, and IPPROTO_IPIP protocol. When the
decapsulator recieves a packet, which it listens for at NF_IP_PRE_ROUTING
hook, the packet is destined to decapsulator's machine. But, the
decapsulator strips the packet of the first header and now the packet is
original packet the encapsulator had before encapsulating it(with a
different daddr). When I check in my kernel module, the sk_buff structure
contains corrent iph information, but this packet gets lost somewhere (in
particular it doesn't show up at NF_FORWARD hook).

So, I tried to make a simple case and just send a packet from one machine
to another, and the second machine upon reciving the packet at
NF_IP_PRE_ROUTING would change the daddr to a third machine's
address. Again, the packet gets lost after pre routing hook.

Can anyone help me with this? In particular, is there anything in kernel
networking infrastructure that would not allow packets originally destined
to local machines to have the daddr changed to a different machine and be
forwarded there? 

Thanks.


