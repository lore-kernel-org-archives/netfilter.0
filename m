From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: mark match
Date: 29 Mar 2003 15:40:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048948827.4792.18.camel@elendil.intranet.cartel-securite.net>
References: <190389138671.20030329152552@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <190389138671.20030329152552@lf.lv>
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
To: Peteris Krumins <newsgroups@lf.lv>
Cc: netfilter@lists.netfilter.org

Le sam 29/03/2003 =E0 14:25, Peteris Krumins a =E9crit :
>  for example, i want to match anything marked from 1 (1b) to
>  127 (1111111b), is it possible to do it using a mask?
>=20
>  nfmark    mask    match
>  1      &  127  =3D  1
>  77     &  127  =3D  77

To be valuable, a mask has to have some low bits to 0. If all mask's
bits are set to 1, than it only matches the masked value... For your
purpose, you have to use 128 (10000000b) as mask :

	1    & 128 =3D 0
	77   & 128 =3D 0
	128  & 128 =3D 128
	129  & 128 =3D 128

So, you match 0, with a 128 mask, which may be, I guess, something like
"-m mark --mark 0/128".

Note that 0 will also match.

It is basicly the same system as netmasks.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

