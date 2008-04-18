From: =?ISO-8859-1?Q?Javier_Prieto_Mart=EDnez?= 
	<javier.prieto.ext@juntadeandalucia.es>
Subject: Re: Redirecting ports in a bridge
Date: Fri, 18 Apr 2008 14:34:42 +0200
Message-ID: <48089562.6010908@juntadeandalucia.es>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es> <9376B7D1C2D4834285B48542AECC46F113FADC@faraday.rad.nd.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9376B7D1C2D4834285B48542AECC46F113FADC@faraday.rad.nd.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Marc Cozzi <cozzi@hertz.rad.nd.edu>
Cc: netfilter@vger.kernel.org

I'm using tcpdump for testing, but my appliance has it's own Java clien=
t=20
for that purpose.


Marc Cozzi escribi=F3:
> Jan,
>
> Can I ask what you are using for traffic logging
> on your bridge? I am in need of fairly decent accounting
> software for all traffic passing through the bridge.
> HTTP, P2P, SSH etc. Bytes, time, IP# and so forth.
>
> Regards,
>
>   --marc
>
>
>  =20
>> -----Original Message-----
>> From: netfilter-owner@vger.kernel.org=20
>> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Javier=20
>> Prieto Mart=EDnez
>> Sent: Friday, April 18, 2008 7:41 AM
>> To: Jan Engelhardt; netfilter@vger.kernel.org
>> Subject: Re: Redirecting ports in a bridge
>>
>> I need the bridge because the appliance is supposed to be=20
>> totally trasparent to the network, as its main use is logging traffi=
c.
>>
>> It just has an IP address for administration purposes, but it=20
>> doesn't really need it. Anyway, I can disable bridging as=20
>> it's an appliance with a closed configuration.
>>
>>
>>
>> Jan Engelhardt escribi=F3:
>>    =20
>>> On Friday 2008-04-18 12:55, Javier Prieto Mart=EDnez wrote:
>>>  =20
>>>      =20
>>>>>  =20
>>>>>      =20
>>>>>          =20
>>>> You're right. I'll try again:
>>>>
>>>> * LAN1 (192.168.1.0/22)
>>>>
>>>> [CLIENTS]--- [ROUTER (.7)]
>>>>
>>>>
>>>> * LAN2 (192.168.2.0/22)
>>>>
>>>> [ROUTER (.7)] -- [APPLIANCE (.40)] -- SERVERS (.1&.2)
>>>>
>>>>    =20
>>>>        =20
>>>>> IF you do bridge, then despite cabling being correct, you=20
>>>>>          =20
>> get a NAT=20
>>    =20
>>>>> shortcircuit: jengelh.medozas.de/images/dnat-mistake.png
>>>>>  =20
>>>>>      =20
>>>>>          =20
>>>> That's probably the problem, as far as I've seen with TCPDump. The=
=20
>>>> point is, how can I fix that shortcut?
>>>>    =20
>>>>        =20
>>> You do not seem to need a bridge.
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe=20
>>>      =20
>> netfilter"=20
>>    =20
>>> in the body of a message to majordomo@vger.kernel.org More=20
>>>      =20
>> majordomo=20
>>    =20
>>> info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>  =20
>>>      =20
>> --
>> To unsubscribe from this list: send the line "unsubscribe=20
>> netfilter" in the body of a message to=20
>> majordomo@vger.kernel.org More majordomo info at =20
>> http://vger.kernel.org/majordomo-info.html
>>
>>    =20
>
>  =20
