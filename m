From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: lost interface ID snmp
Date: Thu, 9 Aug 2012 11:56:38 -0300
Message-ID: <CAMTjHrx8pk=mLteG7zi6P84J8HqHUzD+udGBFjA_b=8Th-=ARQ@mail.gmail.com>
References: <CAMTjHryF9p=h6a-n_Gba5E7LkiZpU_EjAOoDV2JxtJ8MGLqBtw@mail.gmail.com>
	<1335150838.9302.9.camel@hakkenden.homenet>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1335150838.9302.9.camel@hakkenden.homenet>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Nikolay S." <nowhere@hakkenden.ath.cx>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Sorry for my return about that issue after a long time but I should
like if it were put an Description on linux interface like in router
cisco for exemplo. that way my software SNMP could read by that
description

thanks.





2012/4/23 Nikolay S. <nowhere@hakkenden.ath.cx>:
> =D0=92 =D0=92=D1=81., 22/04/2012 =D0=B2 23:49 -0300, Usu=C3=A1rio do =
Sistema =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hello, I have a CentOS 5.4 Linux machine and I'm monitoring by snmp =
it
>> interfaces ethernet. but, when the machine  is restart ID number snm=
p
>> that's interfaces are change.
>>
>> for exemplo when the linux machine is with ID 3 on interface eth1 an=
d
>> it is reset so it come up with a different ID for exemplo 2 for eth1=
=2E
>>
>> so I wonder why happen ? it's normal ? it's possible set a ID value
>> for every interface ?
>
> Hello,
> This is perfectly normal, not only for Linux, but for every device,
> supporting SNMP. Interface id's are not persistent not only across
> reboots, but even between interface destruction/creation (i.e., ppp
> interfaces, when ppp reconnects, will have different ids even though
> their names are still ppp0). Id's are assigned sequentially by kernel
> during creation time, which in turn depends on the modules loading or=
der
> and udev's actions. You can not manually assign interface id, as this
> could potentially lead to collisions and inconsistencies.
>
>> if is change the ID number for each interface so stop my monitoring
>> because my snmp software read by interface ID.
>
> That's bad for your software. It should identify interfaces by some
> other means, say, by ifAlias, and check ifAlias<->ID consistency eith=
er
> before each poll or periodically or by detecting events, that lead to=
 ID
> change (reboots)
>
>>
>> thanks
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
