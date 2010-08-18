From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridges
Date: Wed, 18 Aug 2010 16:51:04 -0500
Message-ID: <4C6C55C8.5000905@riverviewtech.net>
References: <4C6B10CA.4090604@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6B10CA.4090604@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/17/10 17:44, Jonathan Tripathy wrote:
> When using a single Linux host with lots of bridges, would there ever be 
> a time, even for a few seconds, where traffic would "jump" bridges?

No.  Such should not be possible.

> I know a previous poster mentioned that when adding a host to a bridge, 
> for a few seconds all packets get sent everywhere, however does this 
> only apply to the bridge that the new host was added to, or all bridges 
> in the system?

I believe what the previous poster was alluding to was how a switch / 
bridge goes in to dumb hub mode and forwards frames to unknown 
destinations out all ports until it learns where the destination is. 
This is standard operating procedure for switches / bridges, and is to 
be expected.

I am not aware of any thing specific to bridges that would allow this to 
happen (short of an as of yet unknown bug in the kernel).  The closest 
thing that I can think of that might make it seem like this is happening 
is if someone is sending you some sort of VLAN hopping attack.  And as I 
(mis)understand that, that traffic would have to be with in a layer 2 
network, so they attacker is likely to be close, not across the internet.

> Reason I ask is that I am considering have one bridge for public traffic 
> and one bridge for private, and don't want private traffic to be seen by 
> hosts connected to the public bridge.

I think you should be safe (enough) with this.  In fact, you are 
starting to get in to some more theoretical discussions about what is 
and is not safe to do as far as having both public and private VLAN (or 
bridge) traffic on the same wire (system).  There are a number of people 
(my self included) that think you are safe enough for most 
non-uber-secure situations to go ahead and do what you are wanting to do.



Grant. . . .
