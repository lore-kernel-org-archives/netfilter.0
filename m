From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: eth0, eth1, eth2 ??
Date: Sat, 29 Jun 2002 16:22:07 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020629152209.RMMB4119.mta06-svc.ntlworld.com@there>
References: <003f01c21f99$d6f0d540$5107d6d1@nebuchadnezza>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <003f01c21f99$d6f0d540$5107d6d1@nebuchadnezza>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: iptables <netfilter@lists.samba.org>

On Saturday 29 June 2002 7:21 pm, Tim wrote:

> Hi everyone,
>
> On my firewall box, as mentioned previously, I have
> three NICs. On PCI slot 1: video card; PCI slot 2: 1st NIC; PCI slot 3: 2nd
> NIC; PCI slot 4: 3rd NIC. Now, eth0 would be the 1st NIC  on slot 2 ? Is
> this correct ? I need to confirm this in order to know which NIC Iam going
> to plug into on the firewall box from the router [location of eth0, eth1,
> eth2], the LAN, and the DMZ and also write rules for the different chains.

You'll have to plug in some cables and find out :-)

The order in which your NICs get allocated as eth0, eth1, eth2 depends mainly 
on what chipset they are (the kernel will initialise chipsets in a certain 
order, so if your NICs have different chipsets this is what will determine 
which gets called eth0, which eth1 etc), alternatively on what order you load 
modular drivers (if that's the way you compiled your kernel), but it also 
depends signiicantly on your motherboard / Bios - generally you will find the 
NICs get initialised in order from one end of the PCI bus towards the other 
(but until you try, you don't know which end it starts from), but even this 
sensible sequencing is not actually guaranteed.

I suggest the way to do it is to allocate an address in your LAN range to 
eth0, and an address in your DMZ range to eth1, ping something on your LAN 
from the firewall, and then just plug each of the three NICs into your LAN 
switch in turn.   Once you've worked out which is eth0, do the same thing for 
eth1 (this will almost certainly be the NIC in the middle), and then you know 
the other one is eth2.

 

Antony.

