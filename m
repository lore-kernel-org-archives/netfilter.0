From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: sugestion needed for session marking from different default
	routres
Date: Wed, 01 Oct 2003 13:11:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065006675.879.62.camel@elendil.intranet.cartel-securite.net>
References: <34887.212.202.127.214.1065004876.squirrel@knex.zedx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34887.212.202.127.214.1065004876.squirrel@knex.zedx.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: axel@zedx.org
Cc: netfilter@lists.netfilter.org

Le mer 01/10/2003 =E0 12:41, Axel Christiansen a =E9crit :
> Now, ssh from inet on the DSL line works fine. The
> Pakets get back the right way by the active default
> route. I also want to ssh in over the other interface,
> and want the packets back in that line.

Well, something I missed. Your two interfaces must have different IP ?
So you can set source based routing, as described as example for
advanced routing in LARTC[1].

[1] : http://lartc.org/

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

