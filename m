From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Re: Make packets go through when NFQUEUE app crashed
Date: Thu, 14 Feb 2013 11:04:20 +0800
Message-ID: <CAJZVxRmKM5Wg+8V3LoZd=p5C0nsCOW1eabK+G7eHsM5h5QoymQ@mail.gmail.com>
References: <x9b89wseb1jvatb87cqei016.1360758215647@email.android.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type:content-transfer-encoding;
        bh=z8TZ3qzesvg1uUrgSbwJqsxSlriU/OiUbI2mQfo0Hb4=;
        b=LnDDZ8a2l8SujKnQS+KaJL0GSys+cKe9efqAKaeK47VwxkBeqfwJjGlXes/wYMoA4d
         vflShhpbV2Hl03i64/XvyAZ67fU6vwxJQR1scr/EMC+R9qm7SIti9ej8v4+lxxsVf7ff
         ShfDovF+oWAreDFu4w5apHtQElXfjoZBX4ujnsO3tXHSXwTErIrs0fT1NvjPZX2sKTPG
         DHimE4VLcK4bl4BEYYc1TSPJaIg8N4ygL7M4A5u3QDACm034UThqZjQLv99edIhp2Way
         bxUYzKmV+h5NV1a3cO5vgggBXyB2pi+dF0LZxcsYgybsBn03OqXY3WHBUzmT/d9gaIFC
         IkjA==
In-Reply-To: <x9b89wseb1jvatb87cqei016.1360758215647@email.android.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Hi Eric,

--queue-bypass wasn't a standard feature I guess?

Is there a patch available? I'm running iptables v1.4.12

On Wed, Feb 13, 2013 at 8:23 PM, Eric Leblond <eric@regit.org> wrote:
> Hello
>
> Can you read the paragraph about queue-bypass in the article I point =
you to and tell me if it seems clear enough ;)
>
> BR
>
> Aaron Lewis <the.warl0ck.1989@gmail.com> a =E9crit :
>
>>Hi,
>>
>>I found that If the app that handles NFQUEUE crashed,
>>all packets goes through that queue got stuck.
>>
>>Is there a way to prevent that from happening?
>>I prefer to let ACCEPT all packets instead of blocking them, possible=
?
>>
>>iptables -I INPUT -p icmp -j NFQUEUE --queue-num 0
>># If no app handles that queue, no packets could go through
>>
>>--
>>Best Regards,
>>Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
>>Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
>>--
>>To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
=46inger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
