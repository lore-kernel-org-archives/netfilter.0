From: =?UTF-8?B?SmF2aWVyIFByaWV0byBNYXJ0w61uZXo=?= 
	<javier.prieto.ext@juntadeandalucia.es>
Subject: Re: Redirecting ports in a bridge
Date: Fri, 18 Apr 2008 13:41:02 +0200
Message-ID: <480888CE.3080400@juntadeandalucia.es>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>, netfilter@vger.kernel.org

I need the bridge because the appliance is supposed to be totally=20
trasparent to the network, as its main use is logging traffic.

It just has an IP address for administration purposes, but it doesn't=20
really need it. Anyway, I can disable bridging as it's an appliance wit=
h=20
a closed configuration.



Jan Engelhardt escribi=C3=B3:
> On Friday 2008-04-18 12:55, Javier Prieto Mart=C3=ADnez wrote:
>  =20
>>>  =20
>>>      =20
>> You're right. I'll try again:
>>
>> * LAN1 (192.168.1.0/22)
>>
>> [CLIENTS]--- [ROUTER (.7)]
>>
>>
>> * LAN2 (192.168.2.0/22)
>>
>> [ROUTER (.7)] -- [APPLIANCE (.40)] -- SERVERS (.1&.2)
>>
>>    =20
>>> IF you do bridge, then despite cabling being correct, you get
>>> a NAT shortcircuit: jengelh.medozas.de/images/dnat-mistake.png
>>>  =20
>>>      =20
>> That's probably the problem, as far as I've seen with TCPDump. The p=
oint is,
>> how can I fix that shortcut?
>>    =20
>
> You do not seem to need a bridge.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20
