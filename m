From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Using MARK and TOS to route traffic through different interfaces
 to the same destination
Date: Fri, 12 Dec 2008 11:33:43 +0100
Message-ID: <49423E07.6050806@plouf.fr.eu.org>
References: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>	 <1228998831.22977.9.camel@enterprise.ims-firmen.de>	 <49410A7C.6010501@plouf.fr.eu.org> <145d4e1a0812110515j30341cc0s438505a5e3785f74@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0812110515j30341cc0s438505a5e3785f74@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Javier G=E1lvez Guerrero a =E9crit :
>>
>>>> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60301 -j MARK --s=
et-mark 1
>>>> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60302 -j MARK --s=
et-mark 2
>>
>> These rules match the destination port. Replace --dport with --sport=
 to
>> match the source port.
>=20
> Sorry, 60301 and 60302 are both destination port. I made a mistake
> when explaining it. I need to route packets depending on the
> DESTINATION port.

Did you check that the iptables rules actually match packets ? Are the=20
associated counters shown by iptables -vL or iptables-save -c increment=
ing ?
