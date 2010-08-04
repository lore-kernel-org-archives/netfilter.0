From: Alex Bligh <alex@alex.org.uk>
Subject: Re: iptables / ebtables IP address intercept
Date: Wed, 04 Aug 2010 09:08:49 +0100
Message-ID: <FC97946E765591E436489FAE@nimrod.local>
References: <B02D1E8884632086B0CC9CAF@Ximines.local>
 <4C5849B6.2030002@riverviewtech.net>
 <9EA7C5060C8C8A2B321AD23C@Ximines.local>
 <4C587AD5.5060500@riverviewtech.net>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C587AD5.5060500@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>
Cc: Alex Bligh <alex@alex.org.uk>

Grant,

--On 3 August 2010 15:23:49 -0500 Grant Taylor <gtaylor@riverviewtech.net> 
wrote:

>
>> Note it's intercepting traffic to Server X (somewhere behind R1), not
>> traffic to S1.
>
> OK.
>
> Either way, B1 is intercepting traffic and re-routing it elsewhere.
>
> Are you saying that the new destination of the traffic is also out R1?
>
> I.e. the following topology?
>
> {S1}--- BBI ---(R1)---[B1]---{C1}
>
> Where BBI is the BigBadInternet

No:


(R1)----[B1]----{C1}
          |
          |
         (R2)
          |
         BBI
          |
         {S1}

R1 might or might not be connected to BBI, or R1/C1 might be in 1918
space

>>> R2 needs to get traffic between multiple layer 3 networks.
>>
>> Not quite sure what that means as that's what a router does by
>> definition!
>
> Sorry.  Re-reading what I wrote, I see that I wasn't as clear as I needed
> to be.
>
> I was thinking that a device that was not in one (or both) of the layer 3
> networks would need to alter the layer 3 traffic so end systems could
> communicate.
>
> More specifically, using a layer 2 device to alter the layer 3 IP
> addresses, and possibly the layer 2 MAC addresses.  (This is where the
> IPTables' Bridge NetFilter option comes in to play.)

OK - that looks promising. I'd only investigated iptables & ebtables.

>> You are on the right track, but sadly how to get this working with
>> iptables still eludes me.
>
> Now the fun begins.  (Now we are getting in to something that I haven't
> messed with in a very long time.)
>
> {S1}--- BBI ---(R1)---[BR1]---{C1}

Note BBI hangs of BR1 not R1 - I think that makes things easier.

> Here's my idea is to bridge the r1 and c1 interfaces together in to the
> br1 bridge and route modified packets.  The key being the "modified
> packets".
>
> It is (or was last time I needed to do it years ago) to use IPTables'
> Bridge NetFilter option to allow IPTables (a layer 3 toolbox) to operate
> on bridged (a layer 2 operation) packets before they entered the logical
> bridge interface (as seen by the routing code).  Thus we could modify
> packets that came in to the bridge's the physical c1 interface before
> they went out the bridge's logical br1 interface on up to the routing
> code.  (Here in lies the magic.)  -  We use IPTables' Bridge NetFilter
> option to NAT the unknown layer 3 IP addresses in to a known IP address
> for routing to work with.  Conceptually it would function like this:
>
>   - Bridge / EBTables* receives / intercepts the IP packet.
>        C1 -> S1
>   - Bridge NetFilter code modifies the IP packet.
>        C1' -> S1
>   - IPTables DNATs/SNATs the packet.
>        BR1 -> S1
>   - Kernel sends the packet out to S1.
>        BR1 -> S1
>
> Similarly the reply traffic would take the reverse process.
>
>   - Kernel receives the IP packet.
>        S1 -> BR1
>   - IPTables unSNATs / unDNATs the IP packet.
>        S1 -> C1'

I presume there is a route step here, but C1' is designed to be on the
correct interface.

>   - Bridge NetFilter code unmodifies the IP packet.
>        S1 -> C1
>   - Bridge sends the IP packet out to C1.
>        S1 -> C1
>
> I will need to do some more thinking on how to utilize IPTables's Bridge
> NetFilter code / rules to do what is needed to be done.  Give me a bit
> and I'll re-reply.

Sure - thanks.

>> I know it's possible to do programmatically as I have knocked up some
>> raw socket stuff which is working in userspace, which does all the
>> NAT steps and MAC manipulation by hand (that was fun). I'd just
>> rather not do it that way.
>
> I don't think you are going to need to do it progromatically.
>
> As I'm brushing up on kernel options, you may want to consider the raw
> table so that you can use the NOTRACK targets so that you don't consume
> resources tracking all the packets that aren't being intercepted.

That's actually quite simple, as because BBI is not behind R1, all the
non-intercepted traffic is simply bridged.

-- 
Alex Bligh
