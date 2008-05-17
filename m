From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: fwmark iptables/ip routing interaction question
Date: Sun, 18 May 2008 01:26:43 +0200
Message-ID: <482F69B3.1050503@plouf.fr.eu.org>
References: <49159.212.190.198.36.1210171014.squirrel@webserver6.intec.ugent.be> <alpine.LNX.1.10.0805071703150.30395@fbirervta.pbzchgretzou.qr> <48271D8B.5030608@alust.homeunix.com> <alpine.LNX.1.10.0805111938210.19952@fbirervta.pbzchgretzou.qr> <482731F8.9030806@alust.homeunix.com> <482DA25D.70703@plouf.fr.eu.org> <482E56C1.2070508@alust.homeunix.com> <482EB827.8010608@plouf.fr.eu.org> <482ED197.8040509@alust.homeunix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482ED197.8040509@alust.homeunix.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Alexei Ustyuzhaninov a =E9crit :
> Pascal Hambourg wrote:
>>
>> You may be able to specify the desired source address for outgoing=20
>> connections if your mail application allows it.
>=20
> No, of course the mail application doesn't bother about source addres=
ses=20
> and IP routing. I believe it operates at different level of ISO model=
=2E

An application can specify the source address to use when making=20
outgoing connections. Common applications such as telnet or ping allow=20
it as an option. The mail software exim allows it too.
