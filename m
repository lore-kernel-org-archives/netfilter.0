From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: SNAT problem
Date: Mon, 13 Sep 2010 11:10:02 +0200
Message-ID: <4C8DEA6A.80904@plouf.fr.eu.org>
References: <4C716DF6.3040602@pisem.net> <4C7192A6.90109@plouf.fr.eu.org> <4C8C9C9C.2010005@pisem.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C8C9C9C.2010005@pisem.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Yevgeny Kosarzhevsky <yevg@pisem.net>
Cc: netfilter@vger.kernel.org

Yevgeny Kosarzhevsky a =E9crit :
> Pascal Hambourg wrote:
>> Yevgeny Kosarzhevsky a =E9crit :
>>   =20
>>> I have two interfaces, let's say ppp0 - x.x.x.x, ppp1 - y.y.y.y ppp=
0 is
>>> a default gateway.
>>> I use some command to change routing to IP z.z.z.z via ppp1:
>>> ip ro ad to z.z.z.z dev ppp1
>>>
>>> I have SNAT rules for both interfaces, however, I notice with tcpdu=
mp
>>> that outgoing packets are still using x.x.x.x instead of y.y.y.y IP=
,
>>> though packets are being sent with the correct interface (ppp1)
>>>
>>> I have shut down ppp0 and removed SNAT rule for it, but outgoing pa=
ckets
>>> are still showing x.x.x.x IP. Even, ip ro fl cache didn't help.
>>>     =20
>> If the packets belong to an existing connection (conntrack-wise) whi=
ch
>> was established before the route change, this behaviour is expected.
>> Changing the source address may break the connection.
>=20
> I have this trouble for new ipsec connections. I change route on my=20
> gateway and then trying to establish ipsec connection. I see on the=20
> gateway with tcpdump that the address of outgoing packets are still=20
> belong to old interface.

Is the new IPSec connection to the same destination address ? If so,
then the connection tracking and NAT system may consider it is the same
connection and uses the same NAT mapping as before.

Did you wait until the old IPSec conntrack entry expires (check in
/proc/net/nf_conntrack) or try to delete it with the conntrack tool ?
