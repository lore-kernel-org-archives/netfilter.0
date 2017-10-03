From: Will Sewell <me@willsewell.com>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Tue, 3 Oct 2017 13:32:50 +0100
Message-ID: <CAKMCqEJLrtUEXo6xGHs2JMM3Z5dSg2wRfpi4bZNCf7yMtaOn5g@mail.gmail.com>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
 <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org> <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
 <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com>
 <abe1f557-b3f7-1c41-ed15-5db7c7f5b1d0@plouf.fr.eu.org> <CAKMCqEJyaqmH5rnQGcmVYwxw=JxZYJd8gOHq-Wwuc375K+BuPw@mail.gmail.com>
 <62f03124-a3ed-1f17-3477-288c1f48c969@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=willsewell-name.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=t43I1bLc5SZMOLoaSgId3vQbMIubf64IH62CjkFjTFg=;
        b=te7BKaxUD2tIsjdzn+C5qTkzPgWZRVXnB87I1DA5BB/5DBnnrDbsoiB++3SPBLbNzU
         yDUw86IqPkkqUt0CalMs1n2Kemv8Li5pQp49ZkZN7lLLQlD87hpK1Xkucrn3P9bdJ+Re
         pCFHv5JkHxv4MWetKPV/Aijnu33TCL7uzLpDUm0IDcE6euwfd/568sSf+VJzqwrsyk3A
         b+TTWFy4QzDjOWEVtlCbPU47uttO12dxAxiG6TxjRFUJggPLojNnUmyzifiP8f8iGT6L
         o0z79x2I0KoaWCScHiET2MeqdYskt0e/9olkinpKg2n7Yx4MFz+x18u5UM6OIOVUcNEp
         7YOg==
In-Reply-To: <62f03124-a3ed-1f17-3477-288c1f48c969@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> You totally misunderstood me.
> All packets in both direction enter netfilter, and all packets leave
> netfilter unless they are discarded or queued.

Thanks for the example. It looks like my original intuition for what
the "original" and "reply" directions meant was correct (even though I
described it quite imprecisely).

This makes me still unclear on how conntrack figures out that the
original and reply packets are related. e.g. from the information in
the packet entering netfilter in the reply direction, how can it
determine that it is part of the same connection as the packet
entering netfilter in the original direction. I'll try and figure this
out and reply to this thread if I do.
