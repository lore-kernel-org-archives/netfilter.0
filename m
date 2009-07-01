From: =?KOI8-R?Q?=F3=C1=CD=D5=D3=C5=CE=CB=CF_=E1=CE=C4=D2=C5=CA?= 
	<samusenko@msm.ru>
Subject: Re: rate limit by MAC
Date: Wed, 01 Jul 2009 17:19:53 +0400
Message-ID: <4A4B6279.6040504@msm.ru>
References: <4A4B42C6.4060103@msm.ru> <56378e320907010448n2a02fa6cxf9653518f7eff428@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e320907010448n2a02fa6cxf9653518f7eff428@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"; format="flowed"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

Thank you, Richard.
I don't knew about changing MAC on each router.
My question have not sense.
How to fight with IP spoofing? =3D)

Richard Horton wrote:
> 2009/7/1 =F3=C1=CD=D5=D3=C5=CE=CB=CF =E1=CE=C4=D2=C5=CA <samusenko@ms=
m.ru>:
>  =20
>> Hi!
>>
>> Can iptables limit rate by MAC? Think it no.
>>
>> What on Linux can do how i need?
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>    =20
>
> You might be able to...
>
> iptables -A FORWARD -m mac --mac-source <<mac address>> -m limit
> --limit 100/s -j ACCEPT would restrict the given mac address to 100
> packets per second... but depending on how many mac addresses you hav=
e
> it might be too much to enter each rule...
>
> The hashlimit might be better if you can use ip addresses instead of
> mac addresses.
>
> --
> Richard Horton
> Users are like a virus: Each causing a thousand tiny crises until the
> host finally dies.
> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian =
=46orest Cats
> http://www.pbase.com/arimus - My online photogallery
>
>  =20
