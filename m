From: Marco Padovan <evcz@evcz.tk>
Subject: Re: iptables hashlimit question
Date: Sat, 09 Jun 2012 21:06:10 +0200
Message-ID: <4FD39EA2.20302@evcz.tk>
References: <CAJygYd1qba-vxbCqtBB2k_XrL4GSz_ysDrDOJ96VSk5uCbo7cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=message-id:date:from:user-agent:mime-version:cc:subject:references
         :in-reply-to:x-enigmail-version:openpgp:content-type
         :content-transfer-encoding;
        bh=7cyr86YrgbyAE12GsqTjTzql58vdh3CNGo9OjcbvQ0E=;
        b=RpSf3ErqkAxxDmzpCZJKhX4n4qfHohoWn1naBkMA50L7KV3Xm3Z4chWQSjzcIRUdR8
         ln4w5Xj4Bfih59g0JoIPVs8DCQG7IMA3vUoVL7ZH9FJ6kIfHuq38gojCCojq+lZRX6nA
         lcemE+6AoS2tKMd9mRGk7rkplSaSveoXsehjU=
In-Reply-To: <CAJygYd1qba-vxbCqtBB2k_XrL4GSz_ysDrDOJ96VSk5uCbo7cQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 
Cc: netfilter@vger.kernel.org

Default burst AFAIK is set to 5 ( #define XT_HASHLIMIT_BURST    5 ) so
in your case the bucket is filled with 105 (100+5) coins AFTER the firs=
t
second is passed... that means that *before* the full second ticks your
bucket will have less then 105 coins....

you should set the burst at least to the same value of the rate
limititing you want to achieve...

high hashlimit-htable-expire values shouldn't affect the rate limiting
*if you are not reaching the table size limits*...
if the table is full and expire is too long you can have problems and
cause the rule to get skipped/fail...


Il 09/06/2012 20:33, Yucong Sun (=E5=8F=B6=E9=9B=A8=E9=A3=9E) ha scritt=
o:
> Hi,
>
> I've been trying to setup hashlimit on a linux (as a l3 gateway) to
> limit the pps per each IP, i have two questions:
>
> 1) for performance reason I have marked all traffic forwared by the
> box to NOTRACK in raw table, would that affect hashlimit in anyway?
>
> 2) (there's only about 200 ips total) I found out when I  use this
> iptables -A FORWARD
>  -m hashlimit --hashlimit-name limit1 \
>  --hashlimit-htable-size 4096 --hashlimit-htable-expire 60000 \
>  --hashlimit-srcmask 32 --hashlimit-mode srcip \
>  --hashlimit-upto 100/sec \
>  -j ACCEPT
>
> it still drops quite a few packets even thought the rate is well unde=
r
> 100/sec, then I found out if I add
>
> --hashlimit-burst 100 , no packets will be dropped anymore (it appear=
s
> to be working correctly), the doucment is very vague on this burst
> param, how much should I set it to if I just want to limit packet at
> 100/sec ?
>
> also does  -hashlimit-htable-expire affect the rate limiting?
>
> Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


