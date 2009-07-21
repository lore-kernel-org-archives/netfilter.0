From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: postrouting and mac address
Date: Tue, 21 Jul 2009 15:10:55 +0200
Message-ID: <4A65BE5F.4090007@duet.it>
References: <4A65AF17.70002@duet.it> <c7a3bdd5fcb7f7152ae1a453651aa9d1@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c7a3bdd5fcb7f7152ae1a453651aa9d1@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!
there was a misunderstanding: "filter" I mean "recognize". I don't want 
to drop packets in postrouting, I know it is impossible, but I need to 
recognize in postrouting packet of a certain source (by mac address, not 
by ip).

I don't know when packets source mac address is modified by router.

Thanks,
Fabio
> Hi Fabio,
>
> I don't think you can filter packets in postrouting.
> The only tables available in POSTROUTING are mangle and nat.
>
> To filter packets in a router, I think you have to do it in the FORWARD
> chain.
>
> see: http://jengelh.medozas.de/images/nf-packet-flow.png
>
> Julien
>
>   

