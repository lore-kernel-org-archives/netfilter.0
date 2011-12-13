From: Andrew Beverley <andy@andybev.com>
Subject: Re: prio + policing filter on ingress?
Date: Tue, 13 Dec 2011 21:51:41 +0000
Message-ID: <1323813101.1995.116.camel@andybev-desktop>
References: <op.v6dujdvsx1lyi3@debiandesk2.net>
	 <1323800724.1995.58.camel@andybev-desktop>
	 <op.v6f2p4edx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1323813103;
	bh=oSKQaE5jglbEYPdohQC0MSKgnsNwRRTj/b/b14Q1sZs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=vaSk33DyTrQV4jeFrrgQfClnbBHJVPV5kBitatnWGGBzqZlk7E4mewEr721fEtEde
	 G/4ksrpp9l/Dr2Up7Anf25hNWxMfhVZu7Qz2TRa7GpX8RvZuBdI+f0jmukyhIgNxQv
	 pgzkgLihsxfNBmifdqCimWpjgSBz1nu4W+gTDEQg=
In-Reply-To: <op.v6f2p4edx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 2011-12-13 at 14:19 -0600, Lloyd Standish wrote:
> On Tue, 13 Dec 2011 12:25:24 -0600, Andrew Beverley <andy@andybev.com> wrote:
> 
> > Interesting case, which I think you've made a good start at. I don't
> > have the textbook answer for you, but a couple of thoughts (I don't know
> > whether these will necessarily work):
> > - Could you do the policing by attaching an ingress qdisc to eth0 (in
> > addition to the above rules)?
> 
> That's what I did at first (still untested).  I have a policing qdisc
>  on ingress of each of the outward-facing interfaces, and I put a prio
>  qdisc with filters as in my example on egress of the inward-facing
>  (LAN) interface.  But I have my doubts this will work, since the
>  policing qdiscs should pretty much eliminate any inbound queue in the
>  router, right?

Yeah, good point, I hadn't thought of that.

> 
> I should explain the goal here.  There are 5 outward-facing interfaces,
>  and the router load-balances over them using ip and "nexthop via". 

Ah, I remember.

>  Each interface is currently only 5 Mgit, policed to 4 Mbit with
>  ingress qdiscs, to keep the upstream provider from queuing, to improve
>  latency.  This is for a small ISP (about 70 customers) belonging to a
>  friend.  Internet is distributed via a wireless LAN to customers. The
>  customers' radios do the bandwidth-limiting.  A typical download speed
>  is 500Kbit.
> 
> Now, my friend wants to be able to make personal use of the UNUSED
>  bandwidth without infringing on his customers' paid bandwidth.  So I
>  got the idea of putting all traffic to his IP (192.168.0.5 in my
>  example) into band 3 of a prio qdisc.

For you to do *exactly* what you describe, I think you'd have to use the
prio qdisc. And as you have found, it's quite limited. You could attach
a TBF qdisc to each leaf class to rate limit, but as you have already
alluded, this would not give an overall rate limit.

> 
> It seems to me that for this to work, a way has to be found for the
>  policer to drop over-bandwidth packets bound for my friend's IP before
>  it drops customers packets.  Would that enable customers to get their
>  full download bandwidth, while giving access to EXTRA bandwidth to my
>  friend?  I'm not even sure this would work in theory.

I think the only way you could do this is by using a single classful
qdisc for everything. You could try HTB with a suitable prio parameter
for your friend's class. Although it won't starve the class completely,
in my experience it will give it very little bandwidth if higher
priority classes have packets queued.

> 
> > - Could you set up another IFB device (that receives the same traffic)
> > with a policer attached to it?
> 
> I'm not sure what you mean.  Can 2 ifb devices on the same interface
>  receive the same traffic?

I did mean that. I don't know if it's even possible, but it probably
wouldn't work anyway for your reasons outlined above.

> I think the only way to do this may be to do bandwidth-limiting in the
>  router (rather than in the radio) with HTB classes for each customer,
>  with CEIL = total bandwidth for my ISP's personal IP.  Policing would
>  remain on ingress of each outward-facing interface.

See above. I reckon that's your only option. You could also check out
HFSC, but that's even more complicated...

Andy



