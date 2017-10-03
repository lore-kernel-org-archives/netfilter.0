From: Will Sewell <me@willsewell.com>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Tue, 3 Oct 2017 14:23:25 +0100
Message-ID: <CAKMCqEJ4urXwNcwcQQ6y6_ogyhU7GDX_pQM=tusZOpHNvHoETQ@mail.gmail.com>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
 <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org> <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
 <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com>
 <abe1f557-b3f7-1c41-ed15-5db7c7f5b1d0@plouf.fr.eu.org> <CAKMCqEJyaqmH5rnQGcmVYwxw=JxZYJd8gOHq-Wwuc375K+BuPw@mail.gmail.com>
 <62f03124-a3ed-1f17-3477-288c1f48c969@plouf.fr.eu.org> <CAKMCqEJLrtUEXo6xGHs2JMM3Z5dSg2wRfpi4bZNCf7yMtaOn5g@mail.gmail.com>
 <64d6734e-ca72-3788-42d4-afe495b3f372@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=willsewell-name.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=eadSuc5ANWk15XJ1KR3uaSn4krSg/xsGxwLAkEC11oQ=;
        b=zPbCkGVMT+JejlWdMXUb6JmTq3J6eLlGrqET/ytisEDvqiEd/09HMaY44eM3qUu3VR
         W2DcwUjJYMUFZtGbgG3NSr9KhO7L+7WYbVRnEWkfUv1rj2cq/hlkZs//IAFVbX8FaXre
         UtC1576/U5CzUQYmykVRrcnlttGMrcuI/ZJEDfA2bR9g7KgyqTawbGbVkQg9KonhbYaI
         fe3YiuxNj79aYmQoSuOyvKN2LspdLRR0ugp/WibXsWBB3nzCW8UgzsMmDiInxuhTlytu
         n57SQ2lhyAe0O9LzN9WtkCD5Lr+Mp/+mD4by4R7x3wtdhlIaj4Fttfs9pqOcnYTWGeyO
         rjww==
In-Reply-To: <64d6734e-ca72-3788-42d4-afe495b3f372@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> Quite simple. After conntrack has seen the first original packet leave, it
> knows what a reply packet should look like when it enters.
> Roughly, a packet entering netfilter in the reply direction is the reverse
> of a packet leaving netfilter in the original direction.

Ah, so are you saying conntrack can simply switch the source
information with the destination information of a original direction
packet leaving netfilter to get the source/destination information of
a packet that is entering netfilter from the reply direction? That
makes sense if so!
