From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: Where is CONNMARK extension kernel 2.4.32?
Date: Mon, 09 Jan 2006 18:58:41 +0100
Message-ID: <43C2A451.1020509@arcoscom.com>
References: <43C0F61F.4030400@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43C0F61F.4030400@arcoscom.com>
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
To: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Cc: netfilter@lists.netfilter.org

Any help?

Samuel D=EDaz Garc=EDa escribi=F3:

> Hi all.
>=20
> I have troubles with CONNMARK extensions into kernel 2.4.32.
>=20
> The problem I have is that I tried to patch a 2.4.32 kernel with pom-ng=
=20
> and I cant see CONNMARK extension into the pom-ng options and isn't in=20
> kernel config.
>=20
> Perhaps could be that any patch I applied before (IMQ, Layer7filter,=20
> etc...) had broken it. I had compiled kernel, iptables (1.3.4) and many=
=20
> pom-ng patches. And when I test some scripts that uses CONNMARK without=
=20
> success (chain/tarjet error).
> I can view /usr/local/usr/libipt_CONNMARK.so and I suppose that is the=20
> reason why I can view "iptables -j CONNMARK --help" help text, but I=20
> can't see any "/lib/modules/2.4.32/....." *CONNMARK* module and isn't=20
> compiled into the kernel (cat /usr/src/linux/.config | grep "CONNMARK")=
=20
> doesn't show me anythink.
>=20
> Can anybody help me please?
>=20
> Thanks
>=20

--=20
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83

