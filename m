From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Why is --in-interface illegal in POSTROUTING?
Date: Wed, 5 Jul 2017 11:54:36 +0300
Message-ID: <CAEzD07LKJJo57nw7BQ1EoVO-fZxa2ct4FShU7yCGhg_=2mx2jw@mail.gmail.com>
References: <a63f701b-bf6f-8f50-e330-3c7f3b26424b@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=gHvRhFLq5ouvhpqVTZm5UoBm4vZ80U8iXgWouCdQQmI=;
        b=tO2Tf9NAMoJUi70Tt7aUPxyvXnnUOWYkpWW1Ah/XX4h2pumAo6SToaJp0+53i6nEJL
         IELp8OcyJy87Noi4MZ1f8+5kidoACYHiJwh+SKyRS/QxTswt4SJ3UltjlVJu2gj9QuCB
         gut/h0RJ+tiQZjfh3lrmWn8cnqI/3Ss74fv7GP4a4i8aNRYHKQnkWdYdgXz9oHz/khBp
         QVgdsO6g6smeKFxzVPBUMMPmCQo6QbFcIpelSfIEtYpmw8nDwUFGYtvH7zeBtOEywuB5
         f29j0z+Ex6YVI3MZPYrYcPzOQjHecst5LQK/xswVFdLMmBehbIj9Ou5es8WCYyKDvr+r
         Tbqw==
In-Reply-To: <a63f701b-bf6f-8f50-e330-3c7f3b26424b@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert White <rwhite@pobox.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi, Robert.
Through POSTROUTING hook both forwarded packets and local originated
packets pass. Obviously, there isn't input interface information in
local originated packets. I don't know better way to do what you want
than using of marks.

2017-07-04 2:56 GMT+03:00 Robert White <rwhite@pobox.com>:
> Someone just pointed out that --in-interface is not legal in the
> POSTROUTING rules. I can think of several reasons to use this
> information directly at that point (instead of redundant marking ans so
> forth).
>
> Does the in-interface information get lost somehow or is that just an
> arbitrary restriction?
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
