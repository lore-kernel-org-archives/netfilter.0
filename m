From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: lost interface ID snmp
Date: Mon, 23 Apr 2012 07:13:58 +0400
Message-ID: <1335150838.9302.9.camel@hakkenden.homenet>
References: <CAMTjHryF9p=h6a-n_Gba5E7LkiZpU_EjAOoDV2JxtJ8MGLqBtw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHryF9p=h6a-n_Gba5E7LkiZpU_EjAOoDV2JxtJ8MGLqBtw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

=D0=92 =D0=92=D1=81., 22/04/2012 =D0=B2 23:49 -0300, Usu=C3=A1rio do Si=
stema =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hello, I have a CentOS 5.4 Linux machine and I'm monitoring by snmp i=
t
> interfaces ethernet. but, when the machine  is restart ID number snmp
> that's interfaces are change.
>=20
> for exemplo when the linux machine is with ID 3 on interface eth1 and
> it is reset so it come up with a different ID for exemplo 2 for eth1.
>=20
> so I wonder why happen ? it's normal ? it's possible set a ID value
> for every interface ?

Hello,
This is perfectly normal, not only for Linux, but for every device,
supporting SNMP. Interface id's are not persistent not only across
reboots, but even between interface destruction/creation (i.e., ppp
interfaces, when ppp reconnects, will have different ids even though
their names are still ppp0). Id's are assigned sequentially by kernel
during creation time, which in turn depends on the modules loading orde=
r
and udev's actions. You can not manually assign interface id, as this
could potentially lead to collisions and inconsistencies.

> if is change the ID number for each interface so stop my monitoring
> because my snmp software read by interface ID.

That's bad for your software. It should identify interfaces by some
other means, say, by ifAlias, and check ifAlias<->ID consistency either
before each poll or periodically or by detecting events, that lead to I=
D
change (reboots)

>=20
> thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


