From: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Subject: Re: newbie question: UDP is stateless ... right?
Date: Sat, 31 Jan 2009 00:04:20 +0300
Message-ID: <06CF31039D064B51ABB8A0AC1E9BA459@Hakkenden>
References: <87fa72960901301050n7d982887waadc1fc090fc96ed@mail.gmail.com> <49835151.8010701@www.knutejohnson.com> <573116CBE1A14366854B66613B492596@Hakkenden> <49835F8C.2040803@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=response"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

Thanks for the explanation. For some reason I thought it was server-rel=
ated,=20
not client.


--------------------------------------------------
=46rom: "Pascal Hambourg" <pascal.mail@plouf.fr.eu.org>
Sent: Friday, January 30, 2009 11:14 PM
To: <netfilter@vger.kernel.org>
Subject: Re: newbie question: UDP is stateless ... right?

> Hello,
>
> Nikolay S. Rybaloff a =E9crit :
>> If you are talking about netbios name resolution via UDP:137, than t=
his=20
>> is a bit more complex. These packets are mostly network-directed=20
>> broadcasts so AFAIK state rule is not created for them and reply pac=
kets=20
>> look like NEW.
>
> Actually the default netfilter UDP conntrack doesn't care about broad=
cast=20
> addresses and will create en entry after the initial netbios request =
to=20
> the broadcast address. But the reply from a different (unicast) addre=
ss=20
> won't match the conntrack entry.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
