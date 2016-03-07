From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: NTP forwarding
Date: Mon, 07 Mar 2016 20:33:02 +0100
Message-ID: <56DDD76E.3090705@plouf.fr.eu.org>
References: <56DAEA15.409@gmx.de> <56DC9631.7010702@plouf.fr.eu.org> <56DC9E12.6050705@gmx.de> <56DCA3C6.3000101@plouf.fr.eu.org> <56DD2CC8.1030902@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56DD2CC8.1030902@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tobias Andresen <tobiasarp@gmx.de>
Cc: netfilter <netfilter@vger.kernel.org>

Tobias Andresen a =E9crit :
> Am 06.03.2016 um 22:40 schrieb Pascal Hambourg:
>>
>>> iptables -t nat -A POSTROUTING -p udp --dport 123 -j MASQUERADE
>>
>> Why is this rule needed ? What's between 10.0.0.95 and 62.214.6.29 ?
>
> This is the internet connection.

But I suppose it is not a simple wire. 10.0.0.95 is a private address
and 62.214.6.29 is a public IP address, so there must be some sort of
NAT router between them. Am I correct ?

> I cannot achieve this by using iptables or why would you prefer plain=
=20
> routing?

Because the action of carrying packets from the source to the
destination is done by routing.

> I thought i have to use iptables because the ntp server (62.214.6.29)=
=20
> does not know who is behind 10.0.0.95
> and the embedded device has to change the source and destination addr=
ess...

Why ? IIUC 62.214.6.29 is a public address on the internet and 10.0.0.9=
5
is a private address on your LAN, so the NTP server does not know about
10.0.0.95 either. The job of changing private addresses must be
performed by some other device connected to the same network as eth0.
Only that device needs to know about your private addresses.
