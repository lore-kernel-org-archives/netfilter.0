From: "Diego Lacerda" <diegolacerda@gmail.com>
Subject: Re: Question
Date: Mon, 28 Apr 2008 22:51:33 -0300
Message-ID: <cc86d0010804281851i23d6b4w842c24de78231067@mail.gmail.com>
References: <818933700804280201h63ccf323gba1e889c87cc39b4@mail.gmail.com>
	 <alpine.LNX.1.10.0804281211150.20150@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=L5FCUIk1JQaEfcOO5LslmP3pncSFTq6PAUfs674jpl4=;
        b=BfmReKLLVAyMfiUhyOiv3YFWx/477LxYjrLtiQv41N0FpcUll0Dkout2woZx6oJ3+xd6exqmbvtv4hiffwUvpKQANpk1Y+U78e9OiGfgAbKdsGOsaMKoGq4V2wP6sHxLCzIX35FkwZJKiCquJyAaoo7C5svdUhg20sGUsTdjiwU=
In-Reply-To: <alpine.LNX.1.10.0804281211150.20150@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Karim Reda Fakhir <karimreda.fakhir@gmail.com>, netfilter@vger.kernel.org

Yeah,

It's possible, netfilter will change the packet as it passes through
the chains (in the NAT table).

Regards,
Diego Lacerda.

On Mon, Apr 28, 2008 at 7:11 AM, Jan Engelhardt <jengelh@computergmbh.de> wrote:
>
>
> On Monday 2008-04-28 11:01, Karim Reda Fakhir wrote:
>
> >How can i do SNAT and DNAT in same time with iptables , i try to
> >change Ip src and Ip dest .
>
> -t nat -A PREROUTING -j DNAT ...
> -t nat -A POSTROUTING -j SNAT ...
> no?
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
