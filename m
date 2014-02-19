From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Implications of a permissive FORWARD chain
Date: Tue, 18 Feb 2014 21:52:38 -0500
Message-ID: <201402182152.38155.neal.p.murphy@alum.wpi.edu>
References: <loom.20140218T183628-993@post.gmane.org> <201402181710.01163.neal.p.murphy@alum.wpi.edu> <loom.20140219T022735-831@post.gmane.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20140219T022735-831@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tuesday, February 18, 2014 09:34:22 PM Mark Fox wrote:
> Neal Murphy <neal.p.murphy <at> alum.wpi.edu> writes:
> > Perhaps this will help.
> > 
> > [...]
> 
> It does. Especially this:
> >  This allows
> >  almost anyone, almost anywhere, to determine which services are
> >  available on which systems, and to attack them (SQL attacks on RDBMS
> >  servers, SQL injection attacks on web servers, &cet.) or to allow
> >  malware (viruses, trojans, &cet.) to propagate through your private
> >  internetwork of LANs.
> 
> What I think I may have not made clear is that I'm not dealing with LANs
> here. It's a single LAN, with everything thrown onto it. That's what threw
> me for a loop. It's not fire-walling between networks. It's fire-walling to
> and from the same network.
> 
> Perhaps I've made the mistake of spending most of my time thinking about
> protecting hosts on one network from hosts on different networks, but not
> much time thinking about hosts on the same network.
> 
> In any case, it seems pretty obvious that, given the all-eggs-in-one-basket
> state of the network, really tight fire-walling is in order.

Oh. On a wired LAN, outside of programming switches to prevent host-to-host 
comms that pass through the switch (bridge), you can do almost nothing to 
prevent hosts from talking to each other.

If you're talking about VMs on a single Linux host talking through a bridge 
(virtual LAN) on that Linux host, then you can probably use ebtables to 
control the bridge because, again, the Linux host will not see IP traffic 
between VMs.

In short, outside of using a managed switch/bridge, you cannot firewall hosts 
on a LAN from other hosts on that same LAN.
