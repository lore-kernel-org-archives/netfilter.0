From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: ipt_REJECT and mark of generated RST packet
Date: Mon, 12 Dec 2016 17:04:37 +0100
Message-ID: <47048c77-7c29-952b-275d-535c0a0673d9@familie-kuntze.de>
References: <CAEGpDuZvMT36+GeWVua69dGE9FXFJYU89FOo57knujFmgY7iyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oqlaScBq5wf07Cj3IOpvDxUNhbod9N0od"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEGpDuZvMT36+GeWVua69dGE9FXFJYU89FOo57knujFmgY7iyw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pau Espin Pedrol <pespin.shar@gmail.com>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oqlaScBq5wf07Cj3IOpvDxUNhbod9N0od
Content-Type: multipart/mixed; boundary="8c04W5l5MUqajaXeTbifTANKbMA6NeeX6";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Pau Espin Pedrol <pespin.shar@gmail.com>, netfilter@vger.kernel.org
Message-ID: <47048c77-7c29-952b-275d-535c0a0673d9@familie-kuntze.de>
Subject: Re: ipt_REJECT and mark of generated RST packet
References: <CAEGpDuZvMT36+GeWVua69dGE9FXFJYU89FOo57knujFmgY7iyw@mail.gmail.com>
In-Reply-To: <CAEGpDuZvMT36+GeWVua69dGE9FXFJYU89FOo57knujFmgY7iyw@mail.gmail.com>

--8c04W5l5MUqajaXeTbifTANKbMA6NeeX6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Pau
On 12.12.2016 12:37, Pau Espin Pedrol wrote:
> Any thoughts on this?

Your whole email is unnecessary, because there is already a setting for i=
t. Look at fwmark_reflect[1]

[1] https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--8c04W5l5MUqajaXeTbifTANKbMA6NeeX6--

--oqlaScBq5wf07Cj3IOpvDxUNhbod9N0od
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEI8q7YCFGBedyeGWSODkpj2PsZlgFAlhOypYXHG5vZWxAZmFt
aWxpZS1rdW50emUuZGUACgkQODkpj2PsZlibSA/+JimfQ76ZSQjZlUMhhVkLb1mP
Ix8woQBQbmT9ujJdywk8vi/4GTLYc9Ijg49BEMjdaCPw61qGNVkskNvjOImsIN2p
qJP477pzJ+mE2pFr1KfnYC3nZRt8AtM0Ikh5VGRv9786g9VE0F4cpgerpTrUFsjA
lVvyu1ozhDgNE74SLZlQFtyKY33K6/fCv/5YvQxs+6iYXVitc46LPEL6augycQ43
vhZm3RDT5oLTl4b2AjqCrMxO52r3tHlyjq0lyhAXXZdsdOzgAjNIUUKq5b4d9Vkj
sB/Ex8MA7TFRWDvsTVajBLKKBSjgke9npuW0uxyEVPBx0ftNP76vvQ2qNJaGzS3y
ceFThoHRrVe+OdfCRr23y2M0dE4v9DAZ1JAVd2ugmETUtsQmYn9l/WHYMrclwc7X
OS8jcNqwCzAL2YdJlRtK9mcZJIPPwiVWhIloLQ38NeZNeBa5gagZCqEwciXdmsKU
+55Mq0Hu40gB7YjWznMbazmkWCTrN3UQOW991EbuulyBilDF/O7RkkGEIfOU2tw5
fqZQ46YnH9zUD4o+EVgCwVBaFOJx9AEJiFijSWOwypvR1tj8YVOLQTb6tIxjsBFe
AN2L+jcCxeKW3tTasV0Bri40El12yMtTy87oHH1nU0FBh0afzSiybmT2jtdSYIjP
EjVQrMKP8S4bQjbIzI4=
=Pbsj
-----END PGP SIGNATURE-----

--oqlaScBq5wf07Cj3IOpvDxUNhbod9N0od--
