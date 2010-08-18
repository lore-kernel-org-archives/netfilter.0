From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bridges
Date: Wed, 18 Aug 2010 23:51:27 +0100
Message-ID: <4C6C63EF.7060305@abpni.co.uk>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org


> >>Sorry, I used a bad choice of words - Would ebtables stop the frame reaching
> >>  the remote host (VM in my case) is what I meant to say:)
>
> >No. The two bridges are not connected to another in the first place,
> >so the only way for a packet to come in on br0 and go out on br1 is
> >routing, for which iptables is needed to filter.
>    

But even without iptables, traffic coudn't cross without a router in the 
middle, right?

BTW, my post above wasn't really related to having 2 bridges, but more 
of the "dumb hub" situation.

Cheers
