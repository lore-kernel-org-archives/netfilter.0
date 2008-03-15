From: =?utf-8?Q?C=C3=A9dric?= Krier <cedk@gentoo.org>
Subject: Re: conntrack can't delete more conntrack records
Date: Sat, 15 Mar 2008 16:26:38 +0100
Message-ID: <20080315152638.GJ8863@tetsuo.ced.homedns.org>
References: <slrnftb46h.vkl.petr.pisar@album.ics.muni.cz> <47D67370.6000103@netfilter.org> <slrnftde87.u6d.petr.pisar@album.ics.muni.cz> <47D94D87.8050506@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VIOdPewhitSMo36n"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47D94D87.8050506@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--VIOdPewhitSMo36n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 13/03/08 16:51 +0100, Pablo Neira Ayuso wrote:
> Petr Pisar wrote:
>> On 2008-03-11, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>>> Petr Pisar wrote:
>>>> cc1: warnings being treated as errors
>>>> In file included from=20
>>>> /usr/local/include/libnetfilter_conntrack/libnetfilter_conntrack.h:13,
>>>>                  from ../include/conntrack.h:6,
>>>>                  from conntrack.c:37:
>>>> /usr/local/include/libnfnetlink/libnfnetlink.h:198: warning: declarati=
on=20
>>>> of `index' shadows a global declaration
>>>> <built-in>:0: warning: shadowed declaration is here
>>>> make[1]: *** [conntrack.o] Error 1
>>>>
>>>> (I've met this problem twice.)
>>> Weird. It must be a global declaration of "index" somewhere in the
>>> system,
>> yes, it's index(3).
>>> does the patch attached fix your problem?
>> Partially. Other problem is:
>> make[1]: Entering directory `/tmp/conntrack-tools-0.9.6/src'
>> gcc -DPACKAGE_NAME=3D\"conntrack-tools\"=20
>> -DPACKAGE_TARNAME=3D\"conntrack-tools\" -DPACKAGE_VERSION=3D\"0.9.6\"=20
>> -DPACKAGE_STRING=3D\"conntrack-tools\ 0.9.6\"=20
>> -DPACKAGE_BUGREPORT=3D\"pablo@netfilter.org\" -DPACKAGE=3D\"conntrack-to=
ols\"=20
>> -DVERSION=3D\"0.9.6\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPES_H=3D1=20
>> -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_MEM=
ORY_H=3D1=20
>> -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UN=
ISTD_H=3D1=20
>> -DHAVE_DLFCN_H=3D1 -DYYTEXT_POINTER=3D1 -DHAVE_LINUX_CAPABILITY_H=3D1=20
>> -DHAVE_LIBNFNETLINK=3D1 -DHAVE_LIBNETFILTER_CONNTRACK=3D1 -DHAVE_ARPA_IN=
ET_H=3D1=20
>> -DHAVE_INET_PTON=3D1 -DHAVE_INET_PTON_IPV6=3D1 -I.  -I../include   -std=
=3Dgnu99=20
>> -W -Wall -Werror -Wmissing-prototypes -Wwrite-strings -Wcast-qual=20
>> -Wfloat-equal -Wshadow -Wpointer-arith -Wbad-function-cast -Wsign-compar=
e=20
>> -Waggregate-return -Wmissing-declarations -Wredundant-decls=20
>> -Wnested-externs -Winline -Wstrict-prototypes -Wundef=20
>> -Wno-unused-parameter -g -O2   -MT sync-mode.o -MD -MP -MF=20
>> .deps/sync-mode.Tpo -c -o sync-m
> ode.o sync-mode.c
>> cc1: warnings being treated as errors
>> In file included from sync-mode.c:27:
>> ../include/network.h:64: warning: declaration of `conf' shadows a global=
=20
>> declaration
>> ../include/conntrackd.h:144: warning: shadowed declaration is here
>
> Already applied a patch for that, please get a working copy from SVN whic=
h=20
> includes these fixes. Let me know if it's OK for you.
>

Hi,
I have the same error with the svn version revision 7405 and
with gcc 3.4.6


C=C3=A9dric Krier

--VIOdPewhitSMo36n
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFH2+quXUJWHk6k/zERAsSQAKClLVOYEYJDuxBUi04UtE1lZ7XgQQCfUpT1
5iQMSwYX3YVsTsuM9eGtVMk=
=PsBQ
-----END PGP SIGNATURE-----

--VIOdPewhitSMo36n--
