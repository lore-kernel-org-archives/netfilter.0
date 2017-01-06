From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Iptables Reject with TCP Reset
Date: Sat, 7 Jan 2017 00:40:42 +0100
Message-ID: <387c6020-81c2-a5ab-7ba0-27ae8240d11b@familie-kuntze.de>
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
 <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <20170106182623.75d3451d@playground>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7s7qa5s0hAw8lLivxgMx08MU0p58i4QIl"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170106182623.75d3451d@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7s7qa5s0hAw8lLivxgMx08MU0p58i4QIl
Content-Type: multipart/mixed; boundary="eBpuA4P58oF6FSqq4dq5GHG1tAC9UBKoG";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <387c6020-81c2-a5ab-7ba0-27ae8240d11b@familie-kuntze.de>
Subject: Re: Iptables Reject with TCP Reset
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
 <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <20170106182623.75d3451d@playground>
In-Reply-To: <20170106182623.75d3451d@playground>

--eBpuA4P58oF6FSqq4dq5GHG1tAC9UBKoG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07.01.2017 00:26, Neal P. Murphy wrote:
> Dumb question: can you reset a TCP conn that isn't ESTABLISHED? I don't=
 think a TCP reset applies to the first SYN packet.
Yes, you can and have to. It's specified as such. It does.


>   -A timedaction -p tcp -m state --state ESTABLISHED -j REJECT --reject=
-with tcp-reset
>   -A timedaction -j REJECT --reject-with icmp-admin-prohibited
You should reject all TCP packets, not just the ones that belong to an es=
tablished connection.

> and further packets in that direction are rejected with ICMP 'admin pro=
hibited' packets.
That's invalid behaviour. See above.

>  All other conns, including each reset direction of TCP conns, are reje=
cted via ICMP.
See above.

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--eBpuA4P58oF6FSqq4dq5GHG1tAC9UBKoG--

--7s7qa5s0hAw8lLivxgMx08MU0p58i4QIl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEI8q7YCFGBedyeGWSODkpj2PsZlgFAlhwKvoXHG5vZWxAZmFt
aWxpZS1rdW50emUuZGUACgkQODkpj2PsZlhTqw/+ObUpwwSUvOpl378YxVSO0N1i
38V9h4U0VQUcIIKSuO6ucf8R1BIMG5T6UqPGo7MBq/iHBHVkgcOJQPaR3OS6ttnH
1fQ1L7GhPFp+alMtfLjMwb9YjSuJXa0W4QVfw9veBdPNTSsA2qu3etj3ecuU+WVj
LtkYvIMFyHU4iyxi8rQeFSrqRFRGQdL2Eiou3aNoMr2p0qSrRC1rmesRTfr6cXUx
V/BkaSsVoAVeaqlxQtid4rRSHaI5/v6e1sKeTzHw02ZMRp85IdN++LR6b98f+iKc
C6lqeRqvV1oRUUnOhhdc92GsUNgNtNpkPc+/w6zzY2CcHLVo1f0Jx7aVnUQe+5O+
vmerF8hbOxMPgFYTfLbI5waRQscfib+/ljZoYRKATrholb/6VmK/WLXRzyNXe+93
T8U71jSEXubS3PXikBe5aIlwAkPCOfAw0Pe9u0YIwxQTdKzh9Jexh1mRfVPdCbdw
4Zk4NBWEfDxFTyNeS0XPcgiUnCoVNfu//iKySMMeWrW3Pn5XF2fGMuMF7LMB+0qe
ujH9VPq6K3T6abfxxN/kLz0mtyR4LD7pcJYg+Jcs9cp8ptAV92jnMeBGyGUqkjTL
G8I+ZLJB13qjcHQXEJ90amoU5oX81kNeDfCx7umFKSRZOkUgb85eWQJhKex4IWAu
L7t1jtj+5yG/P0E9I8Y=
=Kehn
-----END PGP SIGNATURE-----

--7s7qa5s0hAw8lLivxgMx08MU0p58i4QIl--
