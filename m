From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Implications of a permissive FORWARD chain
Date: Wed, 19 Feb 2014 13:12:13 -0500
Message-ID: <201402191312.13229.neal.p.murphy@alum.wpi.edu>
References: <loom.20140218T183628-993@post.gmane.org> <201402182152.38155.neal.p.murphy@alum.wpi.edu> <loom.20140219T152148-367@post.gmane.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20140219T152148-367@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wednesday, February 19, 2014 09:38:46 AM Mark Fox wrote:
> That I understand. In my situation, I have a containerization host that
> runs several containers. The host can do some sanitization of the traffic
> coming from the network, but only so far before it forces creators of new
> containers to add new rules.
> 
> > If you're talking about VMs on a single Linux host talking through a
> > bridge (virtual LAN) on that Linux host, then you can probably use
> > ebtables to control the bridge because, again, the Linux host will not
> > see IP traffic between VMs.
> 
> That was my expectation, but I'm no longer sure that it is the case. I
> haven't checked on whether the host sees communication between the
> containers specifically, but my guess at this point is that it does. I'm
> quite sure that disabling all forwarding completely cuts off the containers
> from the rest of the LAN.

Containers *are* a different beast.
> 
> My understanding was that a bridge was a layer 2 device and netfilter would
> be completely out of the loop on traffic travelling across the bridge. So I
> disabled all forwarding on the container host, but was surprised when that
> cut the containers off.

Depends. Reasonably modern systems have the ebtables pkg available; it is the 
layer 2 version of iptables. Since the host creates and operates the virtual 
bridge and tap devices, it handles all traffic passing to and from containers; 
but I would've expected it to work at layer 2, where bridging normally 
happens. Said differently, I would expect a Linux virtual bridge to behave the 
same as a physical bridge (switch) in that each port's traffic is not visible 
to nodes on another port.

Logically at layer 2, you would:
  - allow all traffic to and from the host's IF (the bridge)
  - allow all traffic to and from the physical NIC(s)
  - block all other traffic (which should include only VM-to-VM traffic)

I've never worked at layer 2 and don't know the nuances; I'm only aware it can 
be done. You've probably just reached the limit of my knowledge.
