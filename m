From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Status of iptables target support in ipset
Date: Wed, 07 Nov 2012 12:03:13 +0200
Message-ID: <509A31E1.8030703@ngtech.co.il>
References: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?=22Csord=E1s_Csaba_Ifj=2E=22?= <cscsordas@gmail.com>
Cc: netfilter@vger.kernel.org

On 10/26/2012 3:58 PM, Csord=E1s Csaba Ifj. wrote:
> Dear Reader,
>
> I would like to ask when will it possible writing such rules as
> mentioned in $SUBJECT.
>
> For example:
>
> ipset new foo hash:ip
> ipset add foo 192.168.1.1 -t filter -A FORWARD -j LOG ... -t nat -A
> POSTROUTING -j SNAT ... -t mangle -A PREROUTING -j MARK ...
>
>
> Sorry for my bad English.

I wont say it will not give some benefits but it seems to me like a=20
simple bash script can do the same thing.

Eliezer
>
> Regards,
> Csord=E1s Csaba Ifj.


--=20
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
