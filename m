From: Mark Fox <mark.fox@gmail.com>
Subject: Re: Implications of a permissive FORWARD chain
Date: Wed, 19 Feb 2014 14:38:46 +0000 (UTC)
Message-ID: <loom.20140219T152148-367@post.gmane.org>
References: <loom.20140218T183628-993@post.gmane.org> <201402181710.01163.neal.p.murphy@alum.wpi.edu> <loom.20140219T022735-831@post.gmane.org> <201402182152.38155.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Neal Murphy <neal.p.murphy <at> alum.wpi.edu> writes:

> Oh. On a wired LAN, outside of programming switches to prevent host-to-host 
> comms that pass through the switch (bridge), you can do almost nothing to 
> prevent hosts from talking to each other.

That I understand. In my situation, I have a containerization host that runs
several containers. The host can do some sanitization of the traffic coming
from the network, but only so far before it forces creators of new
containers to add new rules.

> If you're talking about VMs on a single Linux host talking through a bridge 
> (virtual LAN) on that Linux host, then you can probably use ebtables to 
> control the bridge because, again, the Linux host will not see IP traffic 
> between VMs.

That was my expectation, but I'm no longer sure that it is the case. I
haven't checked on whether the host sees communication between the
containers specifically, but my guess at this point is that it does. I'm
quite sure that disabling all forwarding completely cuts off the containers
from the rest of the LAN.

My understanding was that a bridge was a layer 2 device and netfilter would
be completely out of the loop on traffic travelling across the bridge. So I
disabled all forwarding on the container host, but was surprised when that
cut the containers off.

I don't get the impression that this is specific to containers. There is
documentation
(http://docs.fedoraproject.org/en-US/Fedora/13/html/Virtualization_Guide/sect-Virtualization-Network_Configuration-Bridged_networking_with_libvirt.html)
saying that one should do a 'iptables -I FORWARD -m physdev
--physdev-is-bridged -j ACCEPT' to allow traffic between a host and any KVM
guests.

> In short, outside of using a managed switch/bridge, you cannot firewall hosts 
> on a LAN from other hosts on that same LAN.

Agreed in the general case. However, in the case of a VM or container host,
it seems that one can do some fire-walling. On a better implemented network,
there wouldn't be much need, but in my case the network shouldn't be trusted.

