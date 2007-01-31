From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables NEW TABLE request. WAS[Re: Catching un-DNAT'ed packets]
Date: Wed, 31 Jan 2007 12:38:43 +0100
Message-ID: <45C07FC3.7060001@plouf.fr.eu.org>
References: <1167054030.16171.10.camel@localhost.localdomain>	<459102EC.50402@plouf.fr.eu.org>	<1169810473.8286.8.camel@localhost.localdomain>	<1170086305.11285.4.camel@localhost.localdomain>	<Pine.LNX.4.61.0701301145530.23321@yvahk01.tjqt.qr>	<Pine.LNX.4.61.0701301901470.13737@yvahk01.tjqt.qr>
	<1170234888.4464.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1170234888.4464.9.camel@localhost.localdomain>
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

Hello

Pokotilenko Kostik a =E9crit :
>>
>>  -t nat -A POSTROUTING -m conntrack --ctstate DNAT --ctorigdst x.x.x.x
>=20
> Just to make sure. This rule will match the packets with canntrack stat=
e
> "DNAT" and whose original (before DNAT) destination address was x.x.x.x=
,
> right?

This is my understanding. However I would recommend not to put such a=20
rule in the nat table because chains in the nat table do not see reply=20
packets.

> If I add -j ULOG to this rule what would be logged packet source addres=
s
> for replay packet (Server->Client)? Original, that client was initially
> connected to, or real, that was set during DNAT?=20

The rule would log the current packet source address as usual, so it=20
won't show the original destination address unless you had put it in the=20
--log-prefix option.

> By the way does -m conntrack --ctstate DNAT --ctorigdst x.x.x.x match
> request or replay packets or packets belonging to connection which was
> originally made to x.x.x.x?

 From my understanding, the latter. "Original" and "reply" usually refer=20
to connection tracking, not individual packets. However I am not sure=20
whether it would match the first packet creating the connection, can=20
anyone confirm ?

