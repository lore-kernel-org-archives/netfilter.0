From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Using Netfilter with high bandwidth
Date: Sat, 1 Sep 2012 00:39:08 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1209010028550.27474@frira.zrqbmnf.qr>
References: <56bebadff4785d716c997d7aba22b9dd@linuxwall.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56bebadff4785d716c997d7aba22b9dd@linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter <netfilter@vger.kernel.org>, brouer@redhat.com

On Friday 2012-08-31 21:38, Julien Vehent wrote:

> Hi All,
>
> At work, we're building a new office, and we are considering building our own
> edge firewalls instead of giving bucket loads of money to the big guys. We're a
> Linux shop, so it makes sense to build those new firewall/vpn boxes using
> Linux. But we are concerned about performances and complexity. I make a simple
> diagram of what we want below. We would have a point to point WAN connection
> between the two networks, and then an uplink on each side.
>
> So I figured I would ask the Netfilter heavy users:
> * How much traffic can we expect to route to a decently configured Firewall ?
> Can we target 10GBPS with good NICs/CPUs and proper kernel tuning, or is that
> completely out of range ?
> * If I recall correctly, some ISPs are using Linux/Netfilter boxes on their
> network. Do we know the limits of such systems ?
> * Can we consider conntrack and conntrack synchronization between master and
> slave ?
> * What type of network cards will handle 1GBPS and 10GBPS (eventually) ? Any
> recommendation on the hardware ?

Those with multiqueue. Intel is known to have some offerings, check 
there (I don't have the chip numbers at hand).

> * We are considering starting with a base ubuntu setup and then tuning the
> kernel/system to fit our needs. Some distros are more network oriented than
> others, is there anything that would stand out for our setup ?

openSUSE is the only known one to offer the complete Netfilter package 
spectrum.
