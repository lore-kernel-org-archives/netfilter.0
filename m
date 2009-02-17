From: Jarek Poplawski <jarkao2@gmail.com>
Subject: Re: problem with IPoA (CLIP),  NAT, and VLANS
Date: Tue, 17 Feb 2009 13:37:07 +0000
Message-ID: <20090217133707.GA6802@ff.dom.local>
References: <20090216232016.GA4803@ami.dom.local> <499AA433.8070308@hiramoto.org> <20090217122052.GB6130@ff.dom.local> <499AB345.3070904@hiramoto.org>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=hldC1K1fyclgViq3VcsJtC4nRxUk8dpbGwEn/H7V5VA=;
        b=OT9CZxvwbcb4HKLjwxC8jt2atORm4GHO+AzaRt7wsJhdxYWTVnrUeWNm5KDjnCgnIe
         0SH9y8SzYc9nC/UQfU4LKzj1O4+ockGcvOwfX9CGFNQ80Dq+9+FChmRV78OKSOwlugyB
         ovGgqG3CfQUe9b9/jSZh9t90vs+N/o+wSP+mo=
Content-Disposition: inline
In-Reply-To: <499AB345.3070904@hiramoto.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karl Hiramoto <karl@hiramoto.org>
Cc: netdev@vger.kernel.org, netfilter@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Feb 17, 2009 at 01:53:25PM +0100, Karl Hiramoto wrote:
> Jarek Poplawski wrote:
> > On Tue, Feb 17, 2009 at 12:49:07PM +0100, Karl Hiramoto wrote:
> > ...
> >   
> >> A side note:  so far the original patch i sent works in all cases i have
> >> tested, but fails with tcpdump.   I suspect its because the skb gets cloned.

Hmm... I would like to make sure: if tcpdump breaks it too, then
we don't need to blame skb_cow_head(), do we? If it's like this then
it looks like the driver's problem with copied/cloned skbs?! (Maybe
because some "private" offset is overwritten?)

Jarek P.
