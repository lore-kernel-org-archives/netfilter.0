From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: Ranges and Single IPs
Date: Wed, 9 Apr 2008 12:17:41 -0700
Message-ID: <d95317090804091217y339b9361vad400ef810c1157b@mail.gmail.com>
References: <d95317090804091138t3f12f5feo51d16968715ede7b@mail.gmail.com>
	 <d95317090804091140l3643357fj79ffe44128202ef6@mail.gmail.com>
	 <alpine.LNX.1.10.0804092113260.17930@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=vvChLJssN166L3bJ/aCuCJ+fIOl0gFxPM+P7VwvKZB4=;
        b=GTgNUe8CNqhp3PVlgCf0P9W1kafZ8sgEC0MYw1rDMZ+Yg+4P26xuCjazYVFxzjvkR+O82iuDNmag8HY5O93JdZh501YWoyoKnaKwn8zSm0l2F7z6oFQ59v6LSn+jybrzQTJ3RAc8f1yoDD47pds4yy48bIE9jM6dQtPS58BclHE=
In-Reply-To: <alpine.LNX.1.10.0804092113260.17930@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

True, but I am looking for a more optimized solution

2008/4/9, Jan Engelhardt <jengelh@computergmbh.de>:
>
>  On Wednesday 2008-04-09 20:40, Gilad Benjamini wrote:
>
>  >I'd like to write a rule for a group. A group can include both single
>  >IP addresses and ranges of addresses.
>  >ipset can do the job with single addresses.
>  >iprange can do the job with ranges
>  >
>  >How can I combine the two ?
>
>
> A range can be modeled upon collections of single addresses.
>  In short, you still use ipset; it will convert a range
>  to a number of single addresses and everything is fine. No?
>
