From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 10:12:52 +0100
Message-ID: <4982C494.50505@cetrtapot.si>
References: <4982B7F3.4020603@cetrtapot.si> <200901300949.39955.christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200901300949.39955.christoph.paasch@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Christoph Paasch <christoph.paasch@gmail.com>
Cc: netfilter@vger.kernel.org

Christoph Paasch wrote:
> Hi,
>=20
> On Fri January 30 2009, Hinko Kocevar wrote:
>> Hi all,
>>
>> Is it possible to 'port forward' ICMP requests?
> You can match the protocol on ICMP packets with -p icmp and let the p=
ort-
> specific stuff out of it, as ICMP doesn't uses portnumbers. But the p=
roblem will=20
> be, that your external machine won't be reachable for icmp packets. (=
as every=20
> icmp packets will get forwarded) It may be ennoying if MTU or ping pa=
ckets=20
> doesn't reach anymore your machine. That depends on the usage of your=
 gateway.
>=20

Yes, that is what I was afraid of. I think that gateway should still re=
main
available for ICMP echo-reply from external network.

Thank you!

--=20
Hinko Ko=C4=8Devar, OSS developer
=C4=8CETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar@cetrtapot.si
http    www.cetrtapot.si

