From: "Baining Zhu" <baining.zhu@utstar.com>
Subject: About writing my hook function
Date: Wed, 15 Nov 2006 11:02:16 +0800
Message-ID: <B51E5145D3A7DF4E8688CDB825310E3C0191A5D2@SZMAIL11.cn.utstarcom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi, all

I am new to netfilter.

These days I am using netfilter to make kernel module which behaves like =
a gateway. More exactly, this module runs on a machine that has two =
NICs, one connects to internal network and the other connects to a =
router that can access the Internet. The module will inspect (and modify =
if necessary) the packets that come from one NIC, then transfer them to =
another NIC.

I plan to add a hook function to NF_IP_PRE_ROUTING to do this.
Now I have several questions about writing my hook function, as listed =
below:
1. Inside the hook function, how could I know which NIC the packet comes =
from? Through the Destination MAC Address that contained in the struct =
sk_buff? (it cannot work on a broadcast packet whose Destination MAC =
Address is 0xffffffffffff...)
2. For any ARP request, I want to give a reply of my own MAC (ARP =
spoofing), which function should I use for send back an ARP reply? What =
is more, after sending out reply, my hook function should return =
NF_STOLEN?
3. For some TCP/UDP packets, after modifying some fields (for example, =
destination IP or Port number), I want to forward it directly to another =
NIC without passing them to protocol stack and application, how can I =
achieve this? Again, my hook function should return NF_STOLEN?

Thanks in advance.

=A0
Best Regards,
Baining
=A0


