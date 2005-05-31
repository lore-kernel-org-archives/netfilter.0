From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Firewall with only one eth0 device: possible?
Date: Tue, 31 May 2005 12:53:37 -0500
Message-ID: <429CA4A1.1030905@riverviewtech.net>
References: <429C93B2.7040001@gmx.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429C93B2.7040001@gmx.ch>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I have an embedded system running uclinux with just one ethernet device
> and wonder whether or not I can build a firewall in combination with a
> switch (VLAN support, not WLAN).
> 
> How I thought it could work is the following:
> 
> Configure the eth0 device with an ip and network mask.
> Configure the eth0:0 alias device with an ip and network mask different
> from eth0.
> Use a switch with VLAN support.
> Connect the eth0 linux device to port B of the switch; switch port A
> will then be one side of the firewall and port C the other side.
> Configure the switch (VLAN) in a manner so all the incoming traffic on
> switch port A will be routed to port B and all the incoming traffic on
> port B will be routed to port C and back to port A.
> Finally everything that enters port C will be routed to port B.

You are close to what you need, but not quite there.  Rather than looking at aliased interfaces you need to add support for 802.1q VLAN tagging in the kernel and install VLAN tools (vconfig) on the router.  Once you have done that you will end up creating a VLAN tagged interface named eth0.1 (presuming the VLAN ID is 1) and eth0.2.  Note the "." (period) not the ":" (colon) as this denotes the difference between an alias and a VLAN interface.  You will then bring up your eth0 (raw) interface with out an IP address via "ifconfig eth0 0.0.0.0".  After your raw ethernet interface is up you will need to create your VLAN interfaces via (if memory and reference serves as it's been 6+ months...):

vconfig add eth0 1
vconfig add eth0 2

Now you will be able to assign IPs as you wish to eth0.1 and eth0.2 as you normally would, you can also firewall across two different devices as you normally would.  All you need to do on the managed switch is establish an 802.1q trunk on the switch port ("B" in your statement) connected to the server / router.  Establish a VLAN with a VID (VLAN ID) of 1 between ports "A" and "B" and a VLAN with a VID of 2 between ports "B" and "C".

> The question about all this is: Will the traffic be filtered between
> eth0 and eth0:0 as if there were two physical devices eth0 and eth1?

If you do what I have suggested things should work for you.  I have dome something very similar to this on a router at one of my client's.  I say similar because there were two (internal) LANs and 8 (no that is not a typo) cable modems that had to be connected to.  I did all of this with two ports on the router connected to a layer 2 managed switch, one was connected via a VLAN trunk to the various cable modems and the other was connected via a VLAN trunk to the two LANs.  In hind site I would have rather hooked all of the cable modems and LANs to one VLAN trunk and established the other as a backup either by STP or bonding.  STP would have worked with a 30 second down time for STP to realize what's going on, where as I think bonding would have taken over much quicker.

> Thanks for any remarks on that.

No problem.

> PS.: I know, this is an unusual way to build a firewall, but I simply
> can not change the hardware. For everyone who thinks, it is insecure
> because of none existing  physical separation: please forgive me.

You will have a pseudo physical, all be it via logical VLAN tags, separation so this should be a non issue.

As usual any comments or question are welcome.



Grant. . . .

