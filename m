From: "Giacomo" <delleceste@gmail.com>
Subject: checksum tcp
Date: Wed, 14 Sep 2005 20:26:01 +0200
Message-ID: <001a01c5b959$c56dc320$0300a8c0@giacomino>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter lists <netfilter@lists.netfilter.org>

Good morning, i calculate tcp checksum after changing a destination port 
(nat)

For example: A (192.168.0.2) sends ssh to 192.168.0.1 : 222 (B) and packets 
are redirected to 192.168.0.1 : 22

After changing port, i recalculate checksum in prerouting on B.

B responds to A, sending response from port 22, so I change in postrouting 
the source port to 222, the one
A expects from.

Then I recalculate checksum.
In post routing I printk the checksum recalculated by B: it is correct, 
according to the checksum expected
by A (ethereal confirms that).

The fact is that A receives back always the same checksum different from the 
right one.

Why do i read the correct checksum in B postrouting and then A receives a 
bad value?
Has it to do with HW_CHECKSUM?? (and what is that?)

This happens to machine B (amd athlon, realtek 8139, via motherboard), 
towards A
(intel P4, natsemi net card, intel chipset).

If I invert roles, it works!!
(P4 machine responds ok to this kind of redirect).

If  I insert module iptable_nat, it works!!

Without, checksum seems to be set correctly in postrouting skb, but arrives 
wrong and always the same (0x81a5).
Someone changes checksum after postrouting netfilter hook??

the packet flow is

PREROUTING ->(redirect) -> INPUT ->SSH-> OUTPUT->POSTROUTING (de-dport 
translation)

If I redirect port  and IP all works fine (PRE->FWD->POST)

Thanks for any idea of what's going wrong
GIacomo-









