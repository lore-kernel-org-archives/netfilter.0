From: "Srinivasa Hebbar" <sshebbar@yahoo.com>
Subject: FORWARDING and NAT chains
Date: Thu, 29 Jan 2004 19:32:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c3e670$a4bd2250$3d40000a@wisdom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: shebbar@india.tejasnetworks.com

Hello,

I believe that the NAT PREROUTING and POSTROUTING will 
always takes place for all the incoming/outgoing packets
irrespective of whether the packet is destined to the node or not.

I have a situvation that if the dest. IP address of the packet is
for the local node, then apply NAT rule, otherwise it should simply
forward the packet according to the routing table.

How can I achive the above?

Any help is very much appreciated.

Regards,
S. Hebbar.

