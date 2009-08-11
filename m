From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: libnetfilter_queue ---- set_mode function not returning .
Date: Tue, 11 Aug 2009 09:43:06 +0530
Message-ID: <cfeab66d0908102113h143f5f9cv488614c2c52d00fa@mail.gmail.com>
References: <cfeab66d0908100126g54834d7au51f7444d6edcefcb@mail.gmail.com>
	 <1249899383.7133.13.camel@khasse.inl.fr>
	 <cfeab66d0908100357v1b3e6718l3299a390982ac8ca@mail.gmail.com>
	 <1249941368.17184.17.camel@ice-age>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=XBzWguK2jN8ZbMMDfydEJGTVnFq556MrPfuxBy2lXZ8=;
        b=n5bln60tu1HqrS/unSOwj24MyfG+0vAnPB+pODDmHRlxAo21ZllQgkOd6zmFqsc2vi
         CfxZKzO2h1kUh4+9x5yqfC0KbeYJOuNljV7fJKNr2e0Ql4arIZJnl3xvWwJlKu8jSEEv
         Sa0hU5WWO+WRy5nvail8fiFhXwCQbVkqVMIKM=
In-Reply-To: <1249941368.17184.17.camel@ice-age>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

> Your code (after some minor unrelated fix, like cb missing in what you
> send) is correct. It is working correctly on my computer. Further more,
> the logic is the same as the one used in NuFW which is know to work fine
> in most (if not all) setup.

can u send me the working program (after fix u done ) .

> By the way what happen if you only try to get the first bytes :
>
>        if (nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xff) < 0) {
>
>

i will try this . and get back to u ... ..
do u want me to try
    NFQNL_COPY_META,
    NFQNL_COPY_PACKET,
these also ???


Thanks,
ratheesh.
