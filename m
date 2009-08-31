From: =?ISO-8859-2?Q?Micha=B3_Sewera?= <michal.sewera@gmail.com>
Subject: Re: nf_conntrack -> table full, dropping packet; problem with 
	counting sessions
Date: Mon, 31 Aug 2009 09:52:54 +0200
Message-ID: <875a14c20908310052j28e2adddqf8df3ef3e06332e1@mail.gmail.com>
References: <875a14c20908270413y3849eabdq3f1465288d024943@mail.gmail.com>
	 <1251541347.31688.5.camel@ice-age>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=sqdIOwRRs32uYZdm+NQvrCOb1VfSpN8m6nYgD9coYk0=;
        b=hirjNW+MqOrKsbgGDqoL0ssztIGIaboQXD98WQ4sKrSK82DHqXwfBY6ias1VIZ9VLS
         ZxXgbcbgM+z0rY4HDWVjDqfjnnPLmR6BNFuqfoF7UY++ifcApXuabSP8EGpvRv0yEljL
         O0P042viqbtnbtj46ABgpRxryHoYixiIvq6N8=
In-Reply-To: <1251541347.31688.5.camel@ice-age>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Eric Leblond <eleblond@inl.fr>
Cc: netfilter@vger.kernel.org

Hi,

the kernel version is linux-2.6.20. I've tryed also 2.6.23 - and the sa=
me story.

thanks
m

2009/8/29 Eric Leblond <eleblond@inl.fr>:
> Hi,
>
> Could you please specify your kernel version ?
>
> BR,
>
> Le jeudi 27 ao=C3=BBt 2009 =C3=A0 13:13 +0200, Micha=C5=82 Sewera a =C3=
=A9crit :
>> Hi,
>>
>> I have a strange problem with nf_conntrack:
>>
>> If I will try to generate small amount of TCP sessions, (i.e. 10
>> sessions), then after closing this sessions (on the client side, by
>> closing application) output from:
>> wc /proc/net/ip_conntrack
>> and
>> cat /proc/sys/net/nf_conntrack_count
>>
>> is the same -> so I can see the same amount of sessions tracked by n=
f_conntrack.
>>
>>
>> But during testing the system with i.e. 100 new TCP sessions/sec
>> (terminated to the same server), after closing the sessions output
>> from wc /proc/net/ip_conntrack if correct (near 0), but all this
>> sessions seems to be staying in cat /proc/sys/net/nf_conntrack_count=
=2E
>>
>> After exceeding the condition nf_conntrack_count < nf_conntrack_max,
>> of course I am getting table full, dropping packet info in log.
>>
>> Some workaround is to set max value to very huge number i.e.
>> 1000000000, but after some times eventually I will get the same
>> problem and reebot will be required.
>>
>> So, if anyone from experts here will know anything about the cause o=
f
>> this problem I will be very gratefull,
>>
>> thanks for any support
>>
>> m
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
> --
> Eric Leblond <eleblond@inl.fr>
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
> EdenWall: http://www.edenwall.com/
>
>
