From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: filter before NAT
Date: Tue, 11 Oct 2011 16:52:55 -0300
Message-ID: <20111011165255.011c284a@pulsar.inexo.com.br>
References: <20111011112453.49d1a3f1@pulsar.inexo.com.br>
	<1318361872.26402.2504.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1318361872.26402.2504.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Tue, 11 Oct 2011 20:37:52 +0100
Andrew Beverley <andy@andybev.com> wrote:

> > 
> > The problem is that the packets are hooked *after* passing SNAT and
> > all the rules can see is the outbound IP. So no redirects to the
> > corresponding flowid occur.
> > 
> > Is it possible to make the filter rule above "see" the packets before
> > they get NATed?
> > 
> 
> How about marking them using an iptables rule before SNAT? The mangle
> table of POSTROUTING sits before the nat table.

I've already thought about that. The problem is the internal NAT side has
a few thousand clients. To generate an unique mask for those and matching
them later is pretty much a headache. I think.

I also thought in IPMARK but I had to patch the kernel AND iptables and
that is something I am not willing to do since it is a production box.

If nobody came with a better solution I'll have to face the "mark" way. 

Thanx anyway.

Cheers

Ethy


> 
> Andy
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \ 
 
PGP key: http://www.inexo.com.br/~ethy/0xC3F222A0.asc
