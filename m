From: Tobias Andresen <tobiasarp@gmx.de>
Subject: Re: NTP forwarding
Date: Mon, 7 Mar 2016 08:24:56 +0100
Message-ID: <56DD2CC8.1030902@gmx.de>
References: <56DAEA15.409@gmx.de> <56DC9631.7010702@plouf.fr.eu.org>
 <56DC9E12.6050705@gmx.de> <56DCA3C6.3000101@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56DCA3C6.3000101@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter <netfilter@vger.kernel.org>

Am 06.03.2016 um 22:40 schrieb Pascal Hambourg:
> Tobias Andresen a =E9crit :
>> Am 06.03.2016 um 21:42 schrieb Pascal Hambourg:
>>> Why do you think you need iptables rules ? Isn't plain routing enou=
gh ?
>> The PCs should only be able use NTP (Port 123). They should not be a=
ble
>> tohave full access (i.e. internet, ...)
> Then you need filtering, not NAT.
>
>> I tried following rule for one PC:
>>
>> iptables -t nat -A PREROUTING -p udp --dport 123 -j DNAT
>> --to-destination 192.168.31.96:123
> What is the purpose of this rule ? It redirects NTP packets to
> 192.168.31.96. How do you expect that NTP packets eventually reach
> 62.214.6.29 ?
>
>> iptables -t nat -A POSTROUTING -p udp --dport 123 -j MASQUERADE
> Why is this rule needed ? What's between 10.0.0.95 and 62.214.6.29 ?
This is the internet connection.

I cannot achieve this by using iptables or why would you prefer plain=20
routing?
I thought i have to use iptables because the ntp server (62.214.6.29)=20
does not know who is behind 10.0.0.95
and the embedded device has to change the source and destination addres=
s...





