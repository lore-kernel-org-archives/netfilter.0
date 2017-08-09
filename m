From: aeris <aeris@imirhil.fr>
Subject: Re: LXC and netfilter log
Date: Wed, 09 Aug 2017 10:18:15 +0200
Message-ID: <4473138.mygUO6KMHR@lappy>
References: <2002586.aotkqkl0s5@home> <20170805000038.76w6id6hb6bl43ep@unicorn.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4653087.dKYozFIojs"; micalg="pgp-sha512"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imirhil.fr; s=mail;
        t=1502266717; bh=zON8K28yjggg/QO7ttnoi92W8ylNZPFTThxuk6slGzM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SoXobbI0EurXlmo0ZTmYzTbjk/yGUG4GZwdRwyMkP/77Z6neRYw9DBPen7WSwGSv1
         HLBiZ27UHuy5uFEivWBljMKPoEYAim/NhnZLRxqGj/eTW1w0++GoF+k4TySyVvtyKR
         IddYMSt626BwES5v1LQNwD0PL1oGJLQgYQqnINwM=
In-Reply-To: <20170805000038.76w6id6hb6bl43ep@unicorn.suse.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Michal Kubecek <mkubecek@suse.cz>
Cc: netfilter@vger.kernel.org, lxc-users@lists.linuxcontainers.org

--nextPart4653087.dKYozFIojs
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

> Logging from network namespaces other than init has been disabled since
> kernel 3.10 in order to prevent host kernel log flooding from inside
> a container.
>=20
> If you have kernel >=3D 4.11 or one with commit 2851940ffee3 ("netfilter:
> allow logging from non-init namespaces") backported, you can enable
> netfilter logging from other network namespaces by
>=20
>   echo 1 >/proc/sys/net/netfilter/nf_log_all_netns
>=20
> (the command must be issued from init_net).
>=20
> > I try to install ulogd2 on my container too, no more luck.
>=20
> Logging via NFLOG target and ulogd2 should work even without the sysctl
> mentioned above, IIRC.

Hi,

Thanks for the reply.

I try with a 4.11 kernel, logs are OK.
Will retry with nflog+ulogd2 too, I surely miss a point during my setup tes=
t.

Regards,
=2D-=20
Aeris
Individual crypto-terrorist group self-radicalized on the digital Internet
https://imirhil.fr/

Protect your privacy, encrypt your communications
GPG : EFB74277 ECE4E222
OTR : 5769616D 2D3DAC72
https://caf=C3=A9-vie-priv=C3=A9e.fr/
--nextPart4653087.dKYozFIojs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEalTe3JvUhc/1wIPnIBavAgp8NmgFAlmKxUcACgkQIBavAgp8
Nmj6rw/7BC43a1OR3mcetq6Mw5UcQDl++5nePXkUU6ITlc9OOXSCrBePPblXAAM+
OqsvtYwY2Onjt+OouU0m1h3+poiQaC6YfoTKdN0E6pHvZbo+SZsatdQQTDzRFj4O
YBbcZpMXf5/f8YQ0vejp4LwmfVVVNJP7i9ZNZhs0JwAbNP6vdX+FtB8lpcBDGfXT
dv+ysQ86Iw6Kj4mQPRcPeY3wuF9uhzUFsCFRE0VaBSVuPsH3krkVTMhuyXhoEeW8
Mh/a6enJmaD25eDrVERbewSPkyZIwxamFgzxhQFqfPYdsY5w+Ku/7Gl2Zs3dKeE3
h1828rU3/9XUx9ZBXoVSIs7Qv1fBIBc0pCdm/mB3tVmvFmWu5KUmuQpBjI61tDrr
TLEDo+Lte08jsHv89Gh/bm41w0GU7ah1GC14beOhG0bLCzfxt5sghLEz40Tdrc8k
GDxLT97iyTKT6F9lt9f23ZQx4VJvOoVDH7Lt7+v6Ydoz0FA1SuGZ7TQbh9F8G75w
y1H/WjCaEiVaNosiExNgV8E72PURrTC3lWBF+qV8yX3LkIfAdtGd7rJkgRKATHrO
F55+Hub1WtQYqVTHH4KRlV++pa5aMuinTXFggNIZpzNUgYhQVLa5hmRiHR1nPbrl
/OMDnwOAoVbKTMuBOdpA3GPTbM7p4RNsSG+LHssBmnVQhtbgc9o=
=kfWy
-----END PGP SIGNATURE-----

--nextPart4653087.dKYozFIojs--

