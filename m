From: "John Lister" <john.lister@kickstone.com>
Subject: Re: Checking line status
Date: Wed, 2 Sep 2009 15:42:43 +0100
Message-ID: <24462D0647E440E0A4E0ED3861DCB074@squarepi.com>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net> <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com> <1251895652.23708.37.camel@enterprise.ims-firmen.de> <0DB67FCC2A774AFCA834C6CD4BE5DB12@squarepi.com> <4A9E812E.2060601@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=original"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

>John Lister a =E9crit :
>> I thought local packets went through this chain
>>
>> mangle(OUTPUT) -> nat (OUTPUT) -> OUTPUT -> routing decision -> mang=
le
>> (POSTROUTING) -> nat (POSTROUTING)

>Actually there is an initial decision routing when the packet is creat=
ed
>before the OUTPUT chains, in order to select the output interface and
>source address. Also after "nat (OUTPUT)" it should be "filter (OUTPUT=
)".
Ah, that sort of makes sense... I'd assumed the source address wasn't s=
et=20
until the routing decision later in the list...

I'd shortened it without the filter part as you don't need to specify t=
he=20
table :)

>[...]
>> iptables -t mangle -A OUTPUT -m mark --mark 0 -m state --state
>>     -j MARK --set-mark 111

>Isn't something missing in that rule ?
I'm guessing you mean the statistic bit? It isn't needed as the first w=
ill=20
have set the mark to be non zero, but i guess it should be there for=20
consistency..

>Also, I can see no iptables rule setting mark 222.

cut and paste error, last line should be 222

Thanks

John=20

