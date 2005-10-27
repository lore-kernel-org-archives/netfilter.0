From: Daniel Ivanov <sertys@supportivo.org>
Subject: Netfilter IPT_RETURN & IPT_CONTINUE
Date: Thu, 27 Oct 2005 08:22:23 +0300
Message-ID: <4360640F.8080205@supportivo.org>
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

In a simple hook , when i return IPT_RETURN after the userspace 
processing it does not have the effect or a RETURN jump for example. It 
says to the kernel : DROP THIS PACKET.
If i pass continue : i continue traversing the chain. The simple effect 
that i want to achieve is to just accept the packet and stop traversing 
the current chain. Is that possible? I'm rather new to nf hooking and 
that's why i ask.

