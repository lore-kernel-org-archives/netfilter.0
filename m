From: Axel Christiansen <axel@zedx.org>
Subject: Re: sugestion needed for session marking from different default	routres
Date: Wed, 01 Oct 2003 20:35:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F7B1E70.1090800@zedx.org>
References: <34887.212.202.127.214.1065004876.squirrel@knex.zedx.net> <1065006675.879.62.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065006675.879.62.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Cedric Blancher schrieb:

> Le mer 01/10/2003 =E0 12:41, Axel Christiansen a =E9crit :
>=20
>>Now, ssh from inet on the DSL line works fine. The
>>Pakets get back the right way by the active default
>>route. I also want to ssh in over the other interface,
>>and want the packets back in that line.
>=20
>=20
> Well, something I missed. Your two interfaces must have different IP ?
> So you can set source based routing, as described as example for
> advanced routing in LARTC[1].

Thats the tning i use now. Can one use "source based routing" also by
protocol and port. I did not had a deeper look in the "ip route"
stuff jet. And i only want selectet sessions, like smtp or ssh
take the alternative route.

G. Axel



