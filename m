From: Jae-Young Kim <jaykim@cs.purdue.edu>
Subject: maximum number of packets NF_STOLEN by netfilter
Date: Thu, 1 May 2003 20:06:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030502010623.GA11447@punch.cs.purdue.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



Hi, I'm developing a kernel module using netfilter to enforce intentional
delay on every packet outgoing.

My algorithm is simple; if a packet's destination IP and TCP/UDP port
numbers are matched, my LOCAL_OUT hook module steals the packet and
returns NF_STOLEN, and then keeps the sk_buff pointer for some delay
time and then release the packet via ip_send().

I'm currently debugging the module in UDP sendto() function.

My problem is that the maximum number of packets that can be sustained
by my kernel module is only about 50. The strange thing is that
if the number of held packets reaches to the number, the sendto() 
function is blocked and no more packet comes into LOCAL_OUT hook.
Only when the number is decreased, the blocking is released.

It is quite sure that the Linux UDP stack blocks the sendto() function.
Is there any limitation of number of allocated sk_buffs in UDP stack?
If that kind of thing exist, how can I check it and how can I increase
the maximum number?

I'm using Linux kernel 2.4.17 with the netfilter. Any comments will be
welcomed. Thanks in advance.

- Jay

