From: "Anatoly Muliarski" <x86ever@gmail.com>
Subject: Re: How to mark traffic on used bandwidth
Date: Mon, 23 Jun 2008 22:12:31 +0300
Message-ID: <38db14850806231212y4326697cwe0ab96c842aa7749@mail.gmail.com>
References: <38db14850806230123h2c0a1aa4uef8afd8275d07d98@mail.gmail.com>
	 <d39744a20806230335u4c527f53p258437b4bcc8416@mail.gmail.com>
	 <alpine.LNX.1.10.0806231717480.26570@fbirervta.pbzchgretzou.qr>
	 <38db14850806231109p4ef2197cu48082c445fea34ce@mail.gmail.com>
	 <alpine.LNX.1.10.0806232032100.16957@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=OD9k6DlQuI8mnU0KOd8x9L3lOFtCtUy3mfKIGXYsYN8=;
        b=GLhb2Zm6F666/k7WrV06qk49dPJFmXcSsH6uxM6TsoM18usGainlbI+x/lfTq3Mb7H
         BF1O9IxSoG9yqgAuiJbgJCfem8+rjYzkHfUx4LvA0p9RuoVVvz8bHhd/RejGlB7U/bHd
         LxiCEDcb91LIdP8nTXACN/N/zDL0W/LIoLJ8E=
In-Reply-To: <alpine.LNX.1.10.0806232032100.16957@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Thanks again :)
I looked at the sources and understood that it is just the thing!
A couple of questions. What for are two estimators used and what mean
their names?
Why don't use it as -m limit semantics?

2008/6/23, Jan Engelhardt <jengelh@medozas.de>:
> On Monday 2008-06-23 20:09, Anatoly Muliarski wrote:
>
> >Thanks.
> >I've heard about RATEEST but I didn't find any doc on it.
>
> man iptables and iptables -j RATEEST -h, iptables -m rateest -h. It's
> not much but a start.
>
>


-- 
Best regards
Anatoly Muliarski
