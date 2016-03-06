From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: NTP forwarding
Date: Sun, 06 Mar 2016 22:40:22 +0100
Message-ID: <56DCA3C6.3000101@plouf.fr.eu.org>
References: <56DAEA15.409@gmx.de> <56DC9631.7010702@plouf.fr.eu.org> <56DC9E12.6050705@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56DC9E12.6050705@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tobias Andresen <tobiasarp@gmx.de>
Cc: netfilter <netfilter@vger.kernel.org>

Tobias Andresen a =E9crit :
> Am 06.03.2016 um 21:42 schrieb Pascal Hambourg:
>> Why do you think you need iptables rules ? Isn't plain routing enoug=
h ?
>
> The PCs should only be able use NTP (Port 123). They should not be ab=
le=20
> tohave full access (i.e. internet, ...)

Then you need filtering, not NAT.

> I tried following rule for one PC:
>=20
> iptables -t nat -A PREROUTING -p udp --dport 123 -j DNAT=20
> --to-destination 192.168.31.96:123

What is the purpose of this rule ? It redirects NTP packets to
192.168.31.96. How do you expect that NTP packets eventually reach
62.214.6.29 ?

> iptables -t nat -A POSTROUTING -p udp --dport 123 -j MASQUERADE

Why is this rule needed ? What's between 10.0.0.95 and 62.214.6.29 ?
