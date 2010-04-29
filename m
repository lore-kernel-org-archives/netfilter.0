From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: NAT table bypass for local traffic
Date: Thu, 29 Apr 2010 11:55:18 +0530
Message-ID: <q2xcfeab66d1004282325wbf9a93aduf3a8fc2d82ee90b0@mail.gmail.com>
References: <n2h812495871004281019nb633c037i7dc04336bc47bd59@mail.gmail.com>
	 <h2v7d7f2e8c1004281059l2ad0d411x1e5f17fd6d7e489f@mail.gmail.com>
	 <alpine.LSU.2.01.1004282136590.18231@obet.zrqbmnf.qr>
	 <h2i812495871004281350j23f2bdefhe18b60101fcf5acc@mail.gmail.com>
	 <alpine.DEB.2.00.1004282253090.2332@aurora.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=1ed/XRUWN+M1IDFwveqmaNCHgAzq7StUYgOpOkIrOcM=;
        b=FS03nln9bmi6cdsA/+rUjsZXdLIVbcM1MbpNNOGgoigeHIGwavOI/wjeMmotmmaSQ+
         m5hSKG2OXpT09Y+Wq/V+4Jrb+GEEr/qtUPWlu+AlU+NVyVYUx7T3kHvnXB5tq2kbHfFd
         LguI7qo9HvS7VR7NDeOq3AMh3P1kcDvaprUCg=
In-Reply-To: <alpine.DEB.2.00.1004282253090.2332@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: Bill Prochazka <billprozac@gmail.com>, Jan Engelhardt <jengelh@medozas.de>, Steve Fink <sphink@gmail.com>, netfilter@vger.kernel.org

 >>the outgoing echo-reply matches to it and thus does
> not show up in nat OUTPUT/POSTROUTING.

Does echo reply will show up in nat PREROUTING chain ?

Thanks,
Ratheesh

On Thu, Apr 29, 2010 at 2:25 AM, Sven-Haegar Koch <haegar@sdinet.de> wr=
ote:
> On Wed, 28 Apr 2010, Bill Prochazka wrote:
>
>> A more simple example is that ICMP echo requests
>> go out the nat table's output chain, but ICMP echo replies do not.
>
> The incoming ICMP echo-request (should be visible in PREROUTING) sets=
 up
> a conntrack entry, the outgoing echo-reply matches to it and thus doe=
s
> not show up in nat OUTPUT/POSTROUTING.
>
> c'ya
> sven-haegar
>
> --
> Three may keep a secret, if two of them are dead.
> - Ben F.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
