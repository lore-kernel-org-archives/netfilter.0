From: Joerg Dorchain <joerg@dorchain.net>
Subject: conntrack_sip messages showing up in 2.6.32
Date: Thu, 10 Dec 2009 16:19:23 +0100
Message-ID: <20091210151923.GT5634@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y+xroYBkGM9OatJL"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
	s=redstar; t=1260458363;
	bh=GXv/2b8LbpdM7a2LHMV+3wBa1YHRuQLzSn5tMZhpnIc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=fQgnJplSpacUMYPBcE861TAxZPGKi1FVcb+QoYBcoU/I9W2/YDbynL9oFEH/OXg34
	 4JQ+aFMbWM7jPHjfQ0jcPqbkx91Edin59obfUOufNsShDhE2tPcRz+Vukb5MrJbPYa
	 /O+04y0BSw0DZaTmY9TCVGmEnHQuh9yJaJUlRO50=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--Y+xroYBkGM9OatJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all,

after upgrading to kernel 2.6.32 I see some new message I did not
see before (i.e. 2.6.31).

I am using just nf_conntrack_sip (options sip_direct_media=0)
in order to have sip and related
rtp connection accepted as related connections, no nat
involved. On a different machine I am running twinkle as a sip
client, registering to an asterisk running on the machine in
question[1].

When twinkle is just idling and renewing its registration once in
a while, I get kernel: nf_ct_sip: dropping packet.. messsages
several times a day.

Do anyone have an idea where this comes from and what can be done
about it?

Bye,

Joerg

[1] The asterisk is doing application level gateway for
connections to the outside world.

--Y+xroYBkGM9OatJL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iHcEARECADcFAkshEXowFIAAAAAAFQAScGthLWFkZHJlc3NAZ251cGcub3Jnam9l
cmdAZG9yY2hhaW4ubmV0AAoJEI2OPuD3c7zgKVEAn1StqPRJLQ4EipeDwL+bCnxA
yF9TAKCI+jTkebhnRDBCPRZH1AhXL0Kc8A==
=OKar
-----END PGP SIGNATURE-----

--Y+xroYBkGM9OatJL--
