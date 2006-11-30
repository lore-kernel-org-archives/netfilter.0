From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: asus p5b-vm onboard gigabit card problem
Date: Thu, 30 Nov 2006 22:49:33 +0100
Message-ID: <5f56302b0611301349oa76c733v902447c44f53cb70@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi list!

I have a very weird problem with a core 2 duo machine having an asus
p5b-vm motherboard, 4 GB of RAM and an onboard gigabit network card.
In short, either the BIOS sees 3 GB of RAM and the network card is
working or sees 4 GB of RAM but then the network card is not working.

The goal is very simple, connecting this machine to another one over
Ethernet. Now since there were loads of problems reported about this
motherboard I will carefully document what I've done so far, apologies
if the post will become too long as a result.

First, the amount of RAM the BIOS sees is controlled by a BIOS option
called 'Memory Remapping Feature' if this is enabled the BIOS sees 4
GB, if disabled only 3 GB. Having this option disabled the onboard
card works perfectly but if it is enabled the network card doesn't
work. For what follows I'll assume this option is enabled (because I
need the 4 GB of RAM).

I have compiled and installed the latest driver for the card,
r1000.ko, version 1.05 from 2006/10/25. Connecting the two machines,
assigning proper IP numbers, say 192.168.1.1 and 192.168.1.2, pinging
doesn't work neither way, all packets are lost (network is
unreachable). However when I check the TX and RX fields with ifconfig
it shows that packets do actually get throught since these TX and RX
fields increase by the exact amount that is sent by ping.

In order to debug the thing I enabled packet logging with iptables and
these logs also show that packets do get through from one machine to
the other. However I'm not able to do anything with the packets apart
from seeing them in the logs (ping reports lost packets, our home
grown communication software reports no packets as well).

At the moment we are out of ideas how to proceed and can only state
what we don't understand:

1. How is this possible that if the BIOS option 'Memory Remap Feature'
is disabled and as a result only 3 GB of RAM is visible the network
card works perfectly but with 4 GB of RAM it doesn't?

2. How is this possible that packets actually get through as reported
by iptables logging, but still these packets are not visible to any
networking software (ping, etc)?

I would be grateful for any ideas,
Daniel

PS: we have tried the whole thing with the following 64bit linux
distributions: Suse 10.1, Fedora 6, Mandriva and all of them gave the
exact same result described above.

