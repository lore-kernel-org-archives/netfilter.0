From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: setting up network sharing
Date: 16 Oct 2004 19:52:30 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097940681.19564.5.camel@nostromo.bgsecm.com>
References: <29c1c2ca23d24.416ffa4a@usc.edu>
	<20041016000324.GA9058@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041016000324.GA9058@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El s=C3=A1b, 16 de 10 de 2004 a las 02:03, Jason Opperisano escribi=C3=B3=
:

> first off--that is an *_ANCIENT_* version of iptables...1.2.8/1.2.9 is
> the oldest version i still see in use regularly, as SuSE and RH are
> keeping them around...however--the current version is 1.2.11...
>=20
> anyways--it sounds like you compiled a custom kernel w/o MASQUERADE
> support.  does your kernel config have the following set:
>=20
>   CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
>=20
> the 'm' would be for a modular kernel, a non-modular kernel would have
> it set to 'y'
>=20
> if you do have that set in your kernel, and your kernel is modular,
> check the output of:
>=20
>   lsmod | grep ipt_MASQUERADE
>=20
> and if you don't see any output, try loading it with:
>=20
>   modprobe ipt_MASQUERADE
>=20
> the module in question should be located at:
>=20
> /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o
>=20
> HTH...
>=20
> -j

Or maybe he doesn't have the support in the userspace iptables
tool.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


