From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: Where is "ip_conntrack_expect_free()"?
Date: Sun, 01 Jan 2006 12:10:19 +0100
Message-ID: <43B7B89B.8020800@arcoscom.com>
References: <43B57F41.1010607@arcoscom.com>
	<c4d05cbe0512311345u74bebaaaj9a6f5feff990d2d3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c4d05cbe0512311345u74bebaaaj9a6f5feff990d2d3@mail.gmail.com>
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
To: Moises Silva <moises.silva@gmail.com>
Cc: netfilter@lists.netfilter.org

Is "_put" the correct replacement for "_free" function? Can anyone=20
confirm this?

Regards (&& happy new year)

Moises Silva escribi=F3:

>   Hi Samuel. I was having the exactly same problems 5 minuts ago. After=20
> doing some research in the source code, and patches over the internet, i =

> figured out that the ip_conntrack_expect_free() function has been=20
> replaced for the function ip_conntrack_expect_put(), passing as argument =

> a pointer to the ip_conntrack_expect struct to free.
>   Other point to check is that the function ip_conntrack_expect_alloc()=20
> now receives a pointer to the connection tracking struct in order to=20
> link it through the "master" member automatically. So i tought it was a=20
> good idea to modify the h323 patch i have for kernel 2.6. In a couple of =

> minuts i will upload a patch, because right now im having kernel panics=20
> with SIP conntrack extension as module in the kernel 2.6.14. The patch=20
> seems to fit just fine, no warnings at all, but kernel panics :( hehe,=20
> so its time to look for a solution. Any ideas?
>=20
> Best Rregards
>=20
> - moy < Alternative mail: moy at ivsol dot net >
>=20
> On 12/30/05, *Samuel D=EDaz Garc=EDa* <samueldg@arcoscom.com=20
> <mailto:samueldg@arcoscom.com>> wrote:
>=20
>     Well, I can compile after some workaround, but when "make
>     modules_install" many pom-ng extension can't find
>     "ip_conntrack_expect_free()" function.
>=20
>     I put:
>=20
>     extern void ip_conntrack_expect_free( struct ip_conntrack_expect *
>     exp );
>=20
>     Into ip_conntrack_helper.h header file (after
>     ip_conntrack_expect_alloc() function).
>=20
>     But, I don't know what is the appropiate source (ip_conntrack_core.c I
>     suppose) and I haven't got the neccesary knowledge to implement the
>     "ip_conntrack_expect_free()" function.
>=20
>     Any work-around about it?
>=20
>     KERNEL=3D2.6.14.5 <http://2.6.14.5>
>=20
>     Modules affected by this issue are:
>=20
>     ip_nat_h323.ko
>     ip_nat_mms.ko
>     ip_conntrack_h323.ko
>     ipt_TARPIT.ko
>     ipt_XOR.ko
>     ip_conntrack_mms.ko
>=20
>     And I suppose that modules listed in a previous e-mail should be
>     affected too.
>=20
>     Any help?
>=20
>     If anybody has the "ip_conntrack_expect_free()" function defined in a=
ny
>     source can help, I only had to copy/paste into ip_conntrack_core.c
>     source file.
>=20
>     Thanks
>=20
>     --
>         Samuel D=EDaz Garc=EDa
>          Director Gerente
>     ArcosCom Wireless, S.L.L.
>=20
>     CIF: B11828068
>     c/ Romero Gago, 19
>     Arcos de la Frontera
>     11630 - Cadiz
>=20
>     http://www.arcoscom.com
>=20
>     mailto:samueldg@arcoscom.com <mailto:samueldg@arcoscom.com>
>     msn: samueldg@arcoscom.com <mailto:samueldg@arcoscom.com>
>=20
>     M=F3vil: 651 93 72 48
>     Tlfn.: 956 70 13 15
>     Fax:   956 70 34 83
>=20
>=20
>=20
>=20
>=20
> --=20
> "Su nombre es GNU/Linux, no solamente Linux, mas info en=20
> http://www.gnu.org"

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

