From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Help with multiple IP networks over an ethernet one
Date: Wed, 10 Sep 2008 09:15:40 -0500
Message-ID: <48C7D68C.2070902@riverviewtech.net>
References: <ef6cbd7b0cc8d867f0702b0494896b60.squirrel@www.arcoscom.com>    <48C6EF5B.3030005@riverviewtech.net> <99a0783d528d1709644f5e55f406f469.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <99a0783d528d1709644f5e55f406f469.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/10/08 02:51, ArcosCom Linux User wrote:
> Thanks for the response, I explain a bit more.

*nod*

> The 3 uplinks have 3 public IP addressess (one per uplink), and are 
> "ADSL" links, one public ip per interface.

Ok.

> eth1 and eth2 have, each one, their direct connect to their ADSL 
> gateway.

Ok.

> eth3 (public IP) and eth0 (private IP) share the same ethernet 
> network.

This confirms what I was thinking.  However I ask why they are sharing 
the same ethernet network?  Why is the uplink 3 connection on the same 
ethernet network as your LANs?  Is there as reason that this is the case 
rather than just putting uplink 3 directly on eth3 with out putting it 
across the LANs network segment?

> Physically, this shared ethernet have many wireless bridges (using 
> STP) to link all the buildings we need to link.

Ok.  This should not matter.

> The test I done to see the latences are send 2 pings to the same 
> physical place to diferent defices from the linux box.

Ok...

> One ping from router to adsl gateway (eth3->uplink3 gateway) and, at 
> the same time, one ping from router to a workstation (eth0->LAN).
> 
> Physically the two pings go trought the same physicall path and end 
> in the same switch where the uplink3 gateway and the test workstation 
> are.

So the uplink 3 gateway is on the LAN and on the local side of a WAN link?

> In router:
> 
> a) I MASQUERADE the IP by interface (-j MASQUERADE), because I need 
> to have all ougoing frames control.

Is this the only reason that you have both eth0 and eth3 connected to 
the same ethernet network?

> b) I balance the routers (as described in lartc and use magle to 
> allow the responses from the incomming interface where they arrives.

I believe this should be able to be done independent of the physical 
interface that packets are leaving.

> c) I use tc (using HTB qdiscs) for the QoS (the problem became with 
> QoS disabled too, don't think this were the problem).

Ok.

> Yesterday, I found a local kernel text file called 
> /usr/share/doc/kernel-doc-2.6.18/Documentation/networking/ip-sysctl.txt 
> (internet is not all) where I see a very usefull information about ip 
> parameters and appears that tweaking some of them will solve some 
> problems with ARP, but really I don't know many of these parameters 
> and only appears to be usefull for me some of them: arp_filter, 
> arp_accept, arp_ignore, rp_filter.

With out knowing for sure what the problem is or what is causing it I 
can't say what to adjust.  However I suspect your problem has something 
to do with the fact that (if I recall correctly) Linux will by default 
respond to ARP queries on any interface for an IP that may be bound to a 
different interface.  In short IPs are more or less bound to the box not 
the interface, thus any interface can get you to the box.  There are a 
couple of /proc entries that will adjust the kernel's ARP behavior to 
make it only respond to ARP queries if they are bound to an IP that is 
bound to the interface that it is coming in on, rather if the 
interface's IP is in the subnet pertinent to the ARP query.

I'm just guessing (with out seeing some TCPDumps of traffic) that 
systems on either eth0 or eth3 are needing to ARP for either of the IPs 
of eth0 or eth3 and the wrong interface is replying, or both are 
replying.  If both interfaces are replying at the same time or if they 
are flip flopping back and forth I can see how your layer 2 ethernet 
network / switch would be getting confused as well as devices wanting to 
talk to said IPs.



Grant. . . .
