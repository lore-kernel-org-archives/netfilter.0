From: Axel Christiansen <axel@zedx.org>
Subject: Re: sugestion needed for session marking from different default	routres
Date: Wed, 01 Oct 2003 20:30:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F7B1D4E.4090101@zedx.org>
References: <34887.212.202.127.214.1065004876.squirrel@knex.zedx.net> <1065006374.870.59.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065006374.870.59.camel@elendil.intranet.cartel-securite.net>
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
> [...]
>=20
>>Now, ssh from inet on the DSL line works fine. The
>>Pakets get back the right way by the active default
>>route. I also want to ssh in over the other interface,
>>and want the packets back in that line.
>>I am thinking about marking the incoming packets and
>>then finding out about the returning packets some how.
>>If this would work, the routing then can by done by
>>ip rule (routing).
>=20
>=20
> You must have a look to CONNMARK target and connmark match that stands
> in pom extra section :

Great, that will work.

thx, Axel



