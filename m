From: Susan Hinrichs <shinrich@network-geographics.com>
Subject: Re: nfqueue vs. tproxy
Date: Thu, 08 Dec 2011 04:49:11 -0600
Message-ID: <1323341353.17564.207.camel@kiki>
References: <201112080025.pB80PGIe091691@medusa.blackops.org>
	 <1323308622.17564.190.camel@kiki>
	 <alpine.LNX.2.01.1112080512510.15734@frira.zrqbmnf.qr>
Reply-To: shinrich@network-geographics.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1112080512510.15734@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: msk@cloudmark.com, netfilter@vger.kernel.org

On Thu, 2011-12-08 at 05:21 +0100, Jan Engelhardt wrote:
> On Thursday 2011-12-08 02:43, Susan Hinrichs wrote:
> 
> >You could do that, but the second recipient of the code would lose the
> >original destination address and port information.
> 
> Um, no.
> The second recipient of the packet (code? no.) is either
> 
> (a) intentionally the same as the original destination, therefore the 
> daddr-dport tuple is already known (obviously)
> 
> (b) intentionally not the same as the original destination, i.e. not 
> meant to know the original daddr-dport tuple.
> 
> And if you need, you can add extra bytes into the stream to tell the new 
> peer (in case of (b)) the original address within the stream, provided 
> the protocol can carry that information. If the protocol does not allow 
> for it, it is not going to be interesting for the recipient anyway.
> 
> Oh and don't top-post.
> 
> >On Wed, 2011-12-07 at 16:25 -0800, msk@cloudmark.com wrote:
> >> I've been reading up on tproxy and nfqueue.  Just to confirm my understanding
> >> of the two:
> >> 
> >> Could one write a layer of code that uses the nfq_*() functions to basically
> >> implement what tproxy can do by simply adjusting the destination information
> >> and checksum, and then returning NF_REPEAT verdicts for each?
> >> 
> >> Thanks,
> >> -MSK

Thanks for the clarification.  I see now.  And sorry for the breach of
etiquette.


