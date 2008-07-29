From: Eric Leblond <eric@inl.fr>
Subject: Re: your mail
Date: Tue, 29 Jul 2008 09:11:30 +0200
Message-ID: <20080729071130.GA5383@bayen.regit.org>
References: <009301c8ef85$a7389050$f5a9b0f0$@com> <20080728141409.GC27519@khasse.inl.fr> <5226fb870807280721kaa95f6esc6955cc87da42c18@mail.gmail.com> <20080728144341.GD27519@khasse.inl.fr> <5226fb870807280833x5eccb178jf8fc16740396b33b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5226fb870807280833x5eccb178jf8fc16740396b33b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: David Boulding <davidboulding@gmail.com>
Cc: netfilter@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Monday, 2008 July 28 at 11:33:24 -0400, David Boulding wrote:
> I've never heard of NFLOG or ULOG, is there any documentation under
> netfilter on how to use it? How would I get the data that I want (to
> sniff) using NFLOG/ULOG?

For ULOG, you can have a look at ulogd or ulogd2 code.
	http://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Dulogd2.git;a=3Dblob;f=3Din=
put/packet/ulogd_inppkt_ULOG.c;h=3Dc00d9bf8a965be7f961738892e19191efcf8f691=
;hb=3D0b789ea9bf810497845456e9b83bff8c5ae5ca23
By the way, as ulogd2 uses a plugin mechanism, you may be able to build
what you want by coding an ulogd2 plugin. It can provide you a way to
code something independant from low level (NFLOG or ULOG can be used as
input without changing your plugin).

A mini doc about ulogd2 hacking is available here:
	http://home.regit.org/?page_id=3D90

For NFLOG, you need to use latest git for kernel and libnetfilter_log.

The following functions are available:

- nflog_get_hwtype: to fetch hardware type (and thus give the parser to
  use)
- nflog_get_msg_packet_hwhdrlen: to get hardware header len
- nflog_get_msg_packet_hwhdr: get hardware datas

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIjsKinxA7CdMWjzIRAofmAJ9mi4P5SRkPugu8wADwtmB2LlHmigCfWjNn
E77TPzKV3LStdfYgpFCobVA=
=ruvK
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
