From: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Subject: Re: mask 10 -> 29
Date: Wed, 15 Apr 2009 21:06:55 +0400
Message-ID: <9B8BF8CA2B1E41E293257EDDEA92EFEA@nowherePC>
References: <49E6044F.5070305@lab.vectoris.fr> <49E60D5F.9070806@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49E60D5F.9070806@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=response"
To: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Cc: netfilter@vger.kernel.org

Yeah, that is exactly why no one use decimals for network subdivision.

192.168.0.10-192.168.0.30 can not be matched with a single VLSM express=
ion.=20
The exact match would be a set:

192.168.0.10/31
192.168.0.12/30
192.168.0.16/29
192.168.0.24/30
192.168.0.28/31



--------------------------------------------------
=46rom: "G=E1sp=E1r Lajos" <swifty@freemail.hu>
Sent: Wednesday, April 15, 2009 8:37 PM
To: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Cc: <netfilter@vger.kernel.org>
Subject: Re: mask 10 -> 29

> Hi,
>
> Mihamina Rakotomandimby (R12y) =EDrta:
>> Hi,
>> I have this kind of shell script in order to set something on a bunc=
h of=20
>> IP addresses:
>>
>> for ACCEPTED_MACHINE in \
>>     192.168.0.10 \
> ...
>>    192.168.0.29
>> do
>> $IPTABLES [...]
>> done
>>
>>
>> How could I use a mask such as 192.168.0.0/NN to exactly match the l=
ist?
>> Thank you.
>>
> Use ipcalc!
>
> The closest subnet is:
>
> ipcalc 192.168.0.10/27
> Address:   192.168.0.10         11000000.10101000.00000000.000 01010
> Netmask:   255.255.255.224 =3D 27 11111111.11111111.11111111.111 0000=
0
> Wildcard:  0.0.0.31             00000000.00000000.00000000.000 11111
> =3D>
> Network:   192.168.0.0/27       11000000.10101000.00000000.000 00000
> HostMin:   192.168.0.1          11000000.10101000.00000000.000 00001
> HostMax:   192.168.0.30         11000000.10101000.00000000.000 11110
> Broadcast: 192.168.0.31         11000000.10101000.00000000.000 11111
> Hosts/Net: 30                    Class C, Private Internet
>
> Check HosMin and HostMax!
>
> Swifty
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
