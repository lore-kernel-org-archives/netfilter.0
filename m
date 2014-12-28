From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: Logging for NAT information with ULOG/NFLOG/LOG
Date: Sun, 28 Dec 2014 16:51:18 -0500
Message-ID: <CAPJdpdDB7kPomtJGwG7=ZGMT-KyX1-0YGUp-gLJjtn_yzE6VBQ@mail.gmail.com>
References: <CADtGFv=6U6U8Aosvz=rN-Wv8Bk-Ag=LMCXHLCXU99udTmdnymA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=A8zxqCxBVfK/npzAUsxIJiwiPKo9p1LSyaC3WY2BLSw=;
        b=Y8NLWuc09ca7spU/oINQCdeAsoORWKKw2l+5tphj0KFsBD+BL8v/qTsccxyTqyl8IV
         wQA/raiFyElRueed0FVfDDmI7/ZdCxe48a4cgbBgoHttRPZPMJOBRRwVQuOqw+J7Z9if
         zt0xTdZKmkLPB5qPtBqjQf7NAzDDYEuqSuBB3VdECBCD0rpvrpQaY3EfQtWLnwCwKWBo
         ipXRpwzl7n93bOtVr7xxVLbuPNmZJddEb1ZSJwnJkk+2GXMEnO5XSTVtpD4pnbSacUVT
         K8CRtxWRirqYcF7LwP02nwbqv0p3dJNRzqz5+HN8YfTEYS13P3hoORsG2U31kah2rp4Q
         waZg==
In-Reply-To: <CADtGFv=6U6U8Aosvz=rN-Wv8Bk-Ag=LMCXHLCXU99udTmdnymA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Visage <hvjunk@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

this is something ive been planing to look at for a while but havent
had the time https://metacpan.org/pod/distribution/Net-Netfilter-NetFlow/bin/nfflowd
this converts conntrack data into netflow data then you should be able
to use any compatible netflow collector to d what you need.

On Sat, Dec 27, 2014 at 5:02 PM, Hendrik Visage <hvjunk@gmail.com> wrote:
> Hi there,
>
>
>  I'm in need to track internal NATted/masquaraded IPs bandwidth
> utilization, mapped to which outbound interface was used as I have
> multiple outbound routes/interfaces as well as transparent caching as
> an encore, and I need to account for the bandwidth used by the
> firewall/server too as some service runs on it too.
>
>  What I'm looking for, is something like conntrack -L output, but for
> each packet in each direction with it's input, output interfaces and
> size, preferably logged via ULOG/NFLOG mechanism and not the kernel
> logging method.
>
>  Any advice on how to achieve this?
>
> Thank you
> Hendrik VIsage
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
