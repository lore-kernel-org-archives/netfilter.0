From: Philip Craig <philipc@snapgear.com>
Subject: Re: pptp-conntrack-nat and kernel 2.6.7
Date: Fri, 06 Aug 2004 10:58:42 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4112D7C2.8000105@snapgear.com>
References: <94F30CDB27E39547A10F4E71E9AF114B2DEE8A@dlb-dc02.intern-eviatec.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <94F30CDB27E39547A10F4E71E9AF114B2DEE8A@dlb-dc02.intern-eviatec.de>
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
To: =?ISO-8859-1?Q?Ehrhardt_Ren=E9?= <r.ehrhardt@eviatec.de>
Cc: netfilter@lists.netfilter.org

Ehrhardt Ren=E9 wrote:
> i=B4m running a debian sarge beta 4 box with iptables 1.2.10, I have to=
 install the pptp-conntrack-nat patch.=20
>=20
> I have the newest CVS build of pom

You should be using pomng, not pom (which is no longer maintained).

> Testing... pptp-conntrack-nat.patch NOT APPLIED (1 missing files) The e=
xtra/pptp-conntrack-nat patch:
>=20
>    Author: Harald Welte <laforge@netfilter.org>
>=20
>    Status: Beta
>=20
> ...
>=20
> ...
>=20
> ...
>=20
> Testing patch extra/pptp-conntrack-nat.patch...
>=20
> Warning - no help text file could be found in either /usr/src/linux/net=
/ipv4/netfilter/Config.help
>=20
> or /usr/src/linux/Documentation/Configure.help
>=20
> grep: /usr/src/linux/net/ipv4/netfilter/Config.in: Datei oder Verzeichn=
is nicht gefunden Could not find place to slot in Config.in line
>=20
> =20
>=20
> What does this mean??=20

It means that the patch is trying to apply to the 2.4.x style config
files, but you are using a 2.6.x kernel which does not have these.

> Is there any way to get this thing working?

Unfortunately no.  Noone has ported the pptp patch to 2.6.x yet.

--=20
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


