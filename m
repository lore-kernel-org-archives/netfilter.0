From: adderek <adderek@polbox.com>
Subject: Problem: ISA card & iptables (2.4.26) - disappearing packets
Date: Sat, 17 Jul 2004 09:28:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F8D503.3040608@polbox.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

1. introduction (you can bypass this part).

I had already configured firewall/router (based on debian distribution
is has only a few things in common with debian).

But I wanted to change it to gentoo. And to put an ISA card into my PC.

At first I've configured everything with my old PCI cards.
After everything worked fine I've changed eth0 to ISA card.



2. some basis

After changing my PCI card to ISA card firewall gone down :(

I'm using same script to run my firewall/router.
I have modules 'ne' and 'ne2k-pci' compiled as modules into kernel.
There are 8139too module, too (for my eth2 interface).
It looks like this:

                +------------------------+
                |   FIREWALL / ROUTER    |
                |                        |
                | eth0 (ISA or PCI, BNC) = <--> LAN 2 (BNC) (10.0.0.1)
                |                        |
                | eth1 (PCI, RJ)         = <--> LAN 1 (RJ)  (10.0.1.1)
                |                        |
internet  <--> = eth2 (PCI, RJ)         |
                |                        |
                +------------------------+


In my script there is no MAC rules. I'm doing something like this:
	iptables -t filter -P FORWARD ACCEPT
	iptables -t filter -P INPUT ACCEPT
	iptables -t filter -P OUTPUT ACCEPT
	echo "1" > /proc/sys/net/ip_forward
	iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to $my_IP
After rebooting my system "LAN 1" is connected to the internet, but the
problem is with "LAN 2".
I'll describe two situation:

(a) When network card NE2000 UMC9008 is inserted into pc (it's set up on
the first place so it's eth0). I'm using module 'ne.o'.

(b) When network card NE2000 realtek rtl8139 is inserted into pc and set
up as eth0. I'm using module 'ne2k-pci.o'



3. Problem


In (b) case both networks ("LAN 1" and "LAN 2") are connected to the
internet. After executing on my router
	tcpdump -i eth0 -v -n
and
	ping google.pl
on some machine connected to this internet I'm watching packets going to
10.0.0.1 and google's reply's.
Executing
	iptables -t filter -L -v -n
gives me statistics that are rising up while I'm sending ping's.


In (a) case network "LAN 1" is connected to the internet, while "LAN 2"
is not. After executing on my router
	tcpdump -i eth0 -v -n
and
	ping google.pl
on some machine connected to this internet I'm watching packets going to
10.0.0.1 but no google's reply's (packets are not even forwarded to eth2).
Executing
	iptables -t filter -L -v -n
gives me statistics that are stable. No packets are reciver trough iptables.
However ping 10.0.0.1 gives me replies (but iptables is not 'catching' it.)

Another strange thing:
I can execute
	ping 10.0.0.x
from my router and then I'm reciving replies (no mather if it is PCI or
ISA card installed).



Can somebody tell me what is happening?

Configuration is the same in both cases. Only network cards differ.
Both cards are working fine (cause 'tcpdump' is giving me an output).

My machine's configuration:
My mother board is PC-Chips M577 (VIA MVP3 chipset).
I have 'gentoo-hardened' sources.
I have checked linux-2.4.26 (clean, unpatched), too.


Many thanks for any help
Regards
---
Adderek

