From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: removing black listed ip
Date: Tue, 20 Apr 2010 10:06:31 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004201004370.21452@obet.zrqbmnf.qr>
References: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>  <alpine.LSU.2.01.1004101910020.32651@obet.zrqbmnf.qr>  <z2hcfeab66d1004101020w685d24b3hc2551381819ced27@mail.gmail.com>  <alpine.LSU.2.01.1004101938350.4171@obet.zrqbmnf.qr> 
 <n2jcfeab66d1004112324t35d8d49cx7eebfcfe88b4f461@mail.gmail.com>  <alpine.LSU.2.01.1004121427530.30496@obet.zrqbmnf.qr> <m2qcfeab66d1004191946g1a566eb8k7886cd56b6aa968c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m2qcfeab66d1004191946g1a566eb8k7886cd56b6aa968c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-04-20 04:46, ratheesh k wrote:
>>>
>>>if =C2=A0number of ip balcklisted ip is more than =C2=A0ip_list_tot =
, old
>>>entries will be replaced by new ip addresses ? . { once list if full=
 ,
>>>what will happen for new black listing }
>>
>> As I see it yes.
>
>suppose one particular ip is blacklisted by accident ...I want to
>remove the ip from black list . How can i do that ?

How do you define accident?

Manually:
 "echo -2a01:198:476::1" >/proc/net/xt_recent/foo

Automatically:
 If you can automatically detect an accident, you can also
 have it removed with -m recent --remove. Or in fact,
 avoid it in the first place.
