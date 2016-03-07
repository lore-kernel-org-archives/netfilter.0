From: Tobias Andresen <tobiasarp@gmx.de>
Subject: Re: NTP forwarding
Date: Mon, 7 Mar 2016 08:26:04 +0100
Message-ID: <56DD2D0C.3000603@gmx.de>
References: <56DAEA15.409@gmx.de> <56DC9631.7010702@plouf.fr.eu.org>
 <56DC9E12.6050705@gmx.de> <56DCFA47.2080809@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56DCFA47.2080809@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Remzi_AKY=c3=9cZ?= <linuxliste@gmail.com>, Pascal Hambourg <pascal@plouf.fr.eu.org>, netfilter@vger.kernel.org

Am 07.03.2016 um 04:49 schrieb Remzi AKY=C3=9CZ:
> Hi,
>
> I am thinking this is enough f for you.
>
> At Embedded board :
>
> iptables  -A FORWARD -p udp --dport 123  -s 192.168.31.96/30 -j ACCEP=
T
>
> iptables  -A FORWARD   -s 192.168.31.96/30 -j DROP
>
> iptables -t nat -A POSTROUTING -p udp --dport 123 -j MASQUERADE
>
> sysctl -w net.ipv6.conf.all.forwarding=3D1
>
> After that please check your all ip tables rules like as;
>
> iptables-save
>
> iptables -L   -vnx --line-numbers
>
> iptables -L -t nat  -vnx --line-numbers
  Thanks for your help but it seems not to work.


> 03/06/2016 11:16 PM tarihinde Tobias Andresen yazd=C4=B1:
>> Am 06.03.2016 um 21:42 schrieb Pascal Hambourg:
>>> Tobias Andresen a =C3=A9crit :
>>>> i have following network structure:
>>>>
>>>>
>>>>        NTP-Server (62.214.6.29)
>>>>                  |
>>>>                  |
>>>>                  |
>>>>         (eth0: 10.0.0.95)
>>>>           Embedded board
>>>>       (eth1: 192.168.31.95)
>>>>                  |
>>>>                  |
>>>>                  |
>>>>           Ethernet-Switch
>>>>            |        |    |
>>>>            |        |    |
>>>>           PC1       |   PC3 (192.168.31.98)
>>>> (192.168.31.96)  |
>>>>                     |
>>>>                    PC2
>>>> (192.168.31.97)
>>>>
>>>>
>>>> The 3 PCs shall be able to connect to the NTP server (62.214.6.29)
>>>> to update their time but i cannot figure out how to configure the
>>>> iptables rules
>>>> on the embedded board to achieve this.
>>> Why do you think you need iptables rules ? Isn't plain routing enou=
gh ?
>> The PCs should only be able use NTP (Port 123). They should not be
>> able tohave full access (i.e. internet, ...)
>>>> I have tried to forward port 123 but it does not work.
>>> This statement does not contain any useful information. It does not
>>> describe what you did and what happened.
>> I tried following rule for one PC:
>>
>> iptables -t nat -A PREROUTING -p udp --dport 123 -j DNAT
>> --to-destination 192.168.31.96:123
>> iptables -t nat -A POSTROUTING -p udp --dport 123 -j MASQUERADE
>>
>> I know this would work only for one client but it was for testing
>> purposes.
>>
>>
>>
>>
>>> --=20
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

