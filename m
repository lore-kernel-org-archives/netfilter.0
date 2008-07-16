From: "Curtis Wyatt" <zhackwyatt@gmail.com>
Subject: Re: ipq_get_packet returns wrong data_len value
Date: Wed, 16 Jul 2008 08:45:37 -0700
Message-ID: <7915e7b50807160845j3806f5acr392da01f7136f6c8@mail.gmail.com>
References: <7915e7b50807151507m3d1ccadfub7cf1882817c72ca@mail.gmail.com>
	 <20080716062424.GB11639@bayen.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=BtEJ4oVZ/keTcUiL8CFKYVr+2kokz+izO9LftgFqnf4=;
        b=rHs6EzCI9zOD1x511pUWn4kj1hgiT/qV7Cumyh5pLMiSpN2IAS+qeDzViC/bF3RoId
         NG9fVQDXEsw/ohHXm8jwswi9o32sPEYGwm9H+Co5YXgRir4chkznpcxPAYdpDhY5Ylw4
         ZllUhWQl3Rd/EFfQcdtJ/lpwryuj7NvgkBblE=
In-Reply-To: <20080716062424.GB11639@bayen.regit.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, Curtis Wyatt <zhackwyatt@gmail.com>, netfilter@vger.kernel.org

On Tue, Jul 15, 2008 at 11:24 PM, Eric Leblond <eric@inl.fr> wrote:
> Hello,
>
> Please use libnetfilter_queue. ip_queue is deprecated since at least two
> years.
>
> About your problem :
>        ntohl(671088640) = 40
>
> BR,
> --
> Eric Leblond

That did the trick, Thank You.

I wish I could use libnetfilter_queue but I can't find any good
tutorials like you can ip_queue, any good links?
