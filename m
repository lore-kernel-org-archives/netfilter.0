From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: get byte count per rule and ip address
Date: Sat, 15 Jan 2011 15:41:46 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101151541160.27274@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

Don't strip the Cc list.

On Saturday 2011-01-15 15:20, Mamadou Tour=C3=A9 wrote:
>
>>> On 16/01/11 01:09, Mamadou Tour=C3=A9 wrote:
>>>> Hi, all
>>>> i've these rule :
>>>> r1 : iptables =C2=A0-t mangle =C2=A0-A POSTROUTING =C2=A0 =C2=A0 -=
m layer7 --l7proto =C2=A0bgp
>>>> -j MARK --set-mark 1
>>>> r2 : iptables =C2=A0-t mangle =C2=A0-A POSTROUTING =C2=A0 =C2=A0 -=
m layer7 --l7proto =C2=A0biff
>>>> =C2=A0-j MARK --set-mark 2
>>>>
>>>> for both r1 and r2 I'd like to get the byte count of packets that =
have
>>>> match rules.
>>>> also i'd like to get byte count of packets according to the IP add=
ress.
>>>> I need your help plz.
>>>
>>> -v shows the packet counters and extra details.
>>> =C2=A0iptables -v -L POSTROUTING
>>
>> Better use iptables-save -c for that.
>
>OK.
>but how do I get packet count for an IP address.
>thet problem is that I don't know exactly the IP that passthrough the =
box.
>regards.

Use something like xt_ACCOUNT.
