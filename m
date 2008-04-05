From: "Joel Pearson" <joel.pearson@gmail.com>
Subject: Re: iptables equivalent of ssh local port forward.
Date: Sat, 5 Apr 2008 13:04:11 +1100
Message-ID: <bac5fd1b0804041904s7f3b75ar95c78a8e44183a2@mail.gmail.com>
References: <bac5fd1b0804041635g768b214bq38535a328d81bf7e@mail.gmail.com>
	 <alpine.LNX.1.10.0804050205390.26881@fbirervta.pbzchgretzou.qr>
	 <alpine.LNX.1.10.0804050208100.26881@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=BuL5pBLOXh41FNd0VwHfwsfC5tQ297HS5DEl3GMXqP4=;
        b=kA0xa/hXa91aVFHcuNXtvrrfluQW2nL0zjADHgJVjY2pFtfAZgJc4Nk5yLVvqs55T8eWgBq81Lh2qQsW9vG/otWitnVlI+x5WlMgWmdZfqqIEClABNdLDQ1A1Mowwk3NnzjshxB/3mfIsk2iwVvqErxdrZ+C15slJm1UZm1LFHI=
In-Reply-To: <alpine.LNX.1.10.0804050208100.26881@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

On Sat, Apr 5, 2008 at 11:09 AM, Jan Engelhardt <jengelh@computergmbh.de> wrote:
>
>  On Saturday 2008-04-05 02:06, Jan Engelhardt wrote:
>
> > On Saturday 2008-04-05 01:35, Joel Pearson wrote:
> >
> > >
> > >  I can get iptables forwarding to work fine if the source address is
> > >  from the internet, well a different interface anyway.  Using a DNAT
> > >  works fine in these circumstances.  But a DNAT doesn't work to forward
> > >  within the same subnet/interface it seems.
> > >
> > >  Can someone point me in the right direction?
> > >
> >
> > http://jengelh.hopto.org/images/dnat-mistake.png
> >
>
>  Adding an extra SNAT rule of course alleviates this problem,
>  at the cost of seeing 1.3.3.8 instead of 1.3.3.7 in the logs
>  of 1.3.3.9.
>
>  (-t nat -A POSTROUTING -d 1.3.3.9 -m conntrack --ctstate DNAT
>  -j SNAT --to 1.3.3.8)
>

Thanks Jan, that SNAT rule worked great!
