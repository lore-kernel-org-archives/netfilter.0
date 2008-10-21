From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Multiple MAC addresses for a single NIC using ebtables?
Date: Tue, 21 Oct 2008 10:45:49 -0500
Message-ID: <48FDF92D.4070208@riverviewtech.net>
References: <48FD6087.6050307@liberation.richw.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48FD6087.6050307@liberation.richw.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/20/08 23:54, Rich Wales wrote:
> Since the firewall has only one external NIC, all external traffic 
> uses a single MAC address.  This works -- but for various reasons, I 
> would like to try to configure the box so that each one of my four 
> external IP addresses will have its own separate MAC address.

Ok...

> Does anyone have a ready-made example for how to do this (presumably 
> using "ebtables")?  I've been playing around with ebtables on a test 
> system, but I can't seem to get all the pieces together to make this 
> multi-MAC setup work.

I don't have any ideas per say, at least in so far as to have multiple 
MAC addresses on the external interface.

Of course there is bridging your external and internal interfaces 
together and turning your system in to a bridging router.  A BRouter 
would allow your internal systems to have an external globally routable 
IP address as well as an internal private IP.  The external globally 
routable traffic would be bridged through and any thing else would be 
routed.

As far as assigning multiple MAC addresses to a single interface, I 
don't know if that is possible.  I know that you can change the MAC 
address and do other nefarious things like having multiple VLANs that 
are bridged together, but I think all of them will share the MAC address 
of the common physical interface.

The first thing that comes to mind to have multiple MAC addresses is to 
create some sort of virtual interface that has its own independent MAC 
address.  Then you could bridge the virtual interfaces together.  But 
I'm not sure how this would work.  (UMLs and Xen come to mind...)

Another option would be to do some very nasty things with NATing in 
EBTables to make things that talk to one ""virtual MAC address get NATed 
to / from the real physical MAC address.  Though I'm not sure how to go 
about this either.  In effect any thing that is ARPing for an IP on the 
virtual interface would have to be replied to with a MAC address that is 
NATed in both the ethernet frame and the ARP reply payload (which can be 
done).  Then you would have to have a NAT rule that would DNAT any 
traffic going to the virtual MAC in to the real MAC.  Correspondingly 
any reply traffic from the virtual IP would have to have the MAC address 
SNATed to that of the virtual interface.  (Did I say that this would be 
a mess?)  In theory NATing the ethernet frames should be possible, but 
I'd have to set up a system to test it.  If you want to move forward and 
have some help with this just say the word.

> Thanks for any help or suggestions.

*nod*



Grant. . . .
