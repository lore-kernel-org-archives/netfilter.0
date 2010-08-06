From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables / ebtables IP address intercept
Date: Fri, 06 Aug 2010 16:07:44 -0500
Message-ID: <4C5C79A0.8060607@riverviewtech.net>
References: <B02D1E8884632086B0CC9CAF@Ximines.local> <4C5849B6.2030002@riverviewtech.net> <9EA7C5060C8C8A2B321AD23C@Ximines.local> <4C587AD5.5060500@riverviewtech.net> <FC97946E765591E436489FAE@nimrod.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <FC97946E765591E436489FAE@nimrod.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/04/10 03:08, Alex Bligh wrote:
> R1 might or might not be connected to BBI, or R1/C1 might be in 1918 
> space

Ok.

> OK - that looks promising. I'd only investigated iptables & ebtables.

*nod*

> Note BBI hangs of BR1 not R1 - I think that makes things easier.

Seeing as how BR1 is a bridge and router, it doesn't make that much 
difference.

> I presume there is a route step here, but C1' is designed to be on 
> the correct interface.

Yes.

The reply traffic will be routed at layer 3, and then at layer 2 will be 
altered from the one layer 3 (that was routed) to the proper layer 3 
(that isn't routed).

> Sure - thanks.

I've done some more thinking and I strongly believe that what needs to 
be done can be, I just don't have a way to test this at the moment.  (I 
will see if I have some time this weekend to throw together a VM.)

> That's actually quite simple, as because BBI is not behind R1, all 
> the non-intercepted traffic is simply bridged.

*nod*



Grant. . . .
