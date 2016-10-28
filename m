From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: NAT with unique egress port
Date: Fri, 28 Oct 2016 03:18:13 +0200
Message-ID: <bfbc83fd-179b-790b-5f78-5213032bee7c@familie-kuntze.de>
References: <CAJxU1QN4c+5KOBgakYAgRXnR3jRh_s72BKyqT3F5g+oReQp3QQ@mail.gmail.com>
 <7118f027-0f54-7878-6d83-f304beed5430@familie-kuntze.de>
 <CAJxU1QP5OK=eScajCLB_=zNxc=2Q1Sc77iVsQnp4Cccs1iTmtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="m490x95qBKisgwOkB4DKP1NcD2ng9rsU0"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJxU1QP5OK=eScajCLB_=zNxc=2Q1Sc77iVsQnp4Cccs1iTmtg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Rui Santos <rsantos@ruisantos.com>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m490x95qBKisgwOkB4DKP1NcD2ng9rsU0
Content-Type: multipart/mixed; boundary="xPj4P704bt6kBXK8TP3gs8J1LfSl5O7EA";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Rui Santos <rsantos@ruisantos.com>
Cc: netfilter@vger.kernel.org
Message-ID: <bfbc83fd-179b-790b-5f78-5213032bee7c@familie-kuntze.de>
Subject: Re: NAT with unique egress port
References: <CAJxU1QN4c+5KOBgakYAgRXnR3jRh_s72BKyqT3F5g+oReQp3QQ@mail.gmail.com>
 <7118f027-0f54-7878-6d83-f304beed5430@familie-kuntze.de>
 <CAJxU1QP5OK=eScajCLB_=zNxc=2Q1Sc77iVsQnp4Cccs1iTmtg@mail.gmail.com>
In-Reply-To: <CAJxU1QP5OK=eScajCLB_=zNxc=2Q1Sc77iVsQnp4Cccs1iTmtg@mail.gmail.com>

--xPj4P704bt6kBXK8TP3gs8J1LfSl5O7EA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28.10.2016 00:41, Rui Santos wrote:
> I believe you may be referring to the --random of the SNAT target.
>=20
> Although that is a solution which I will probably take if there is no
> other, there are actually two issues with it:
> 1) AFAIK, it will randomize all egress ports. I would like to keep the
> default behavior of NAT, by tampering with connections as little as
> possible. On the example I provided, only the connection initiated by
> server2, gets a random egress port. server1 connection egress port
> will be the same as the origin source port.
>=20
> 2) Random does not necessarily mean unique. What will happen if
> client1 and client2, randomly get the same egress port for different
> destination IP's? Will --random consider this valid? If it will, I end
> up with the same issue (although rare, true) of having two clients
> with the same egress port.
>=20
> Is there any way to accomplish this?

I don't know that, sorry. The stuff from that man page is all I know
about this issue.

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--xPj4P704bt6kBXK8TP3gs8J1LfSl5O7EA--

--m490x95qBKisgwOkB4DKP1NcD2ng9rsU0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI0BAEBCAAeBQJYEqdVFxxub2VsQGZhbWlsaWUta3VudHplLmRlAAoJEDg5KY9j
7GZYNuMP/06nyzDSyb+tlRQXdavfg5WCrgTfpaeeE1urXUov0SBixezCB7NqTqaT
31mFS9dST1TT/zzgr3wzqbAcWESWw8C6Nf1R7B6p8Fy1lbZ9ZPYoSHOaJXHN94Rr
ZPlJZokc0///1drj8CWN2914/yWFfvOHG5o3YCvxakJqJqQRNlTtraSgcKLnn4Xe
wIRqPtPOeUmWmCI2UUOHLx8VNlpY5yq3BZJCR3X8gDHlBWQOyB7Q2yAwQVwkA9sM
qIW1NJ6idfX56PqZKbD7wrVfS1Sl/fmWxQFjSPZyMvciLm+3SNwRmdUq5QOs8ulS
y+49ec/EavumZKr4CdTyPUz5H/IchtBu6zHJc7XUVYf/2JyagIAgl1ZPaVK5MLZK
6N4pCCAbZ0Xyz8nBKHLo9HTG+nAdZoa46hXgE/xstidqZUgCuD/8YVuuD7kRovGa
gm4hvwAYPGilOwjfcrca5G0TzHUr05Msq8FneNgMv3zs2S4YTKBl1S0EMJkuy4VK
IaSLZsAl3fn74//DJqW+Gc32Mw/g1BRVtIGdslw/BnjaWgc5d6zgSpK4QBVT/M27
T4LDdvzwf0Q30vuXDVIbALzCiR3KzwsUUyJRUrjDHpzRI3F7JaFoQo96zpbEDp61
ePc3QAK7mm4S3+DxgbMQqS26AADKKlX/hrnGNvjZHWWL+e5NeUVs
=BhiW
-----END PGP SIGNATURE-----

--m490x95qBKisgwOkB4DKP1NcD2ng9rsU0--
