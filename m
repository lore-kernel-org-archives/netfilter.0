From: "Anatoly Muliarski" <x86ever@gmail.com>
Subject: Re: How to mark traffic on used bandwidth
Date: Mon, 23 Jun 2008 21:51:03 +0300
Message-ID: <38db14850806231151p1c5e9b22rd0b852b19816a63c@mail.gmail.com>
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
        bh=TT0VpiVMNiVc1CxRMH9EaDScb65QEso1IbPQ+VViGrA=;
        b=OfNhnID+j1j/rlgkRherjR9i9VlMbbEZYll4WDyfm8QRw61Tnf2eLq3BY2IsMQpAE0
         OIbj53kbFTN5tHShxEhSyNS5XJGdPXqvP1LcRiZ+lE7CgO323hDsXzPKTSm3URb78lFY
         eG/LV0hXef/0y+KPGoVUucu6hP6ev0Jfu1jQI=
In-Reply-To: <alpine.LNX.1.10.0806232032100.16957@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

I've looked at it but I didn't fully understand the idea. What means
the estimator?
Nevertheless thanks for the hint, I'll search through the maillist and
look in the sources.

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
