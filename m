From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 18:43:56 +0100
Message-ID: <45E31C5C.8010707@plouf.fr.eu.org>
References: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>	<45E2F479.7020804@plouf.fr.eu.org>	<1172502565.4265.118.camel@anduril.intranet.cartel-securite.net>	<45E2FE20.90701@plouf.fr.eu.org>
	<1172506681.4265.155.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1172506681.4265.155.camel@anduril.intranet.cartel-securite.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Cedric Blancher a =E9crit :
> Le lundi 26 f=E9vrier 2007 =E0 16:34 +0100, Pascal Hambourg a =E9crit :
>=20
>>Also, wouldn't it be useful to do it in both directions to avoid=20
>>fragmentation if host (b) does not use path MTU discovery ?
>=20
> No, because you don't want to clamp inbound traffic to your MTU, but to
> your peer MTU.

I want to clamp both, so TCP segments length does not exceed 1452 in=20
either direction.

> It's your peer job to advertise correctly its own MSS.

Yes, but the MSS advertised by the peer may not be the best one : if it=20
exceeds the PPP link MTU - 40 (typically 1492 - 40 =3D 1452) and host=20
(b)'s MTU (typically 1500) exceeds the PPP link MTU and host (b) does=20
not use path MTU discovery, then host (b) may send TCP datagrams bigger=20
than the PPP link MTU that the server/router would need to fragment. So=20
IMO it would be better that host (b) always see peers' MSS not bigger=20
than the PPP link MTU - 40.

> Now, if you look more closely, you'll see you clamp MSS against
> destination PMTU. As PMTU from your firewall to your server  is most
> probably ethernet MTU, you will clamp it to 1500.

You mean "from the server/router to host (b)" ?
Yes, you have a point. It's useless.

> So, if your peer
> advertise 1452 as MSS, you will overwrite it to a higher value of 1460
> and break everything.

Actually "clamp" means "decrease if bigger", the MSS is clamped only=20
when it is bigger than PMTU - 40. So it won't break anything. It will=20
just have no effect.

What about :
iptables -t mangle -A FORWARD -o eth1 -p tcp --tcp-flags SYN,RST SYN \
   -m tcpmss --mss 1453: -j TCPMSS --set-mss 1452

