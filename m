From: Tobias Andresen <tobiasarp@gmx.de>
Subject: Re: NTP forwarding
Date: Sun, 6 Mar 2016 22:16:02 +0100
Message-ID: <56DC9E12.6050705@gmx.de>
References: <56DAEA15.409@gmx.de> <56DC9631.7010702@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56DC9631.7010702@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>, netfilter@vger.kernel.org

Am 06.03.2016 um 21:42 schrieb Pascal Hambourg:
> Tobias Andresen a =E9crit :
>> i have following network structure:
>>
>>
>>       NTP-Server (62.214.6.29)
>>                 |
>>                 |
>>                 |
>>        (eth0: 10.0.0.95)
>>          Embedded board
>>      (eth1: 192.168.31.95)
>>                 |
>>                 |
>>                 |
>>          Ethernet-Switch
>>           |        |    |
>>           |        |    |
>>          PC1       |   PC3 (192.168.31.98)
>> (192.168.31.96)  |
>>                    |
>>                   PC2
>> (192.168.31.97)
>>
>>
>> The 3 PCs shall be able to connect to the NTP server (62.214.6.29)
>> to update their time but i cannot figure out how to configure the
>> iptables rules
>> on the embedded board to achieve this.
> Why do you think you need iptables rules ? Isn't plain routing enough=
 ?
The PCs should only be able use NTP (Port 123). They should not be able=
=20
tohave full access (i.e. internet, ...)
>
>> I have tried to forward port 123 but it does not work.
> This statement does not contain any useful information. It does not
> describe what you did and what happened.

I tried following rule for one PC:

iptables -t nat -A PREROUTING -p udp --dport 123 -j DNAT=20
--to-destination 192.168.31.96:123
iptables -t nat -A POSTROUTING -p udp --dport 123 -j MASQUERADE

I know this would work only for one client but it was for testing purpo=
ses.




> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

