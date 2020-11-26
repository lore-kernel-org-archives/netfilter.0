From: bbmt <bbmt@hotmail.fr>
Subject: mistakes on wiki
Date: Thu, 26 Nov 2020 23:03:57 +0100
Message-ID: <DBBPR07MB7402FA99F0836910743FEB76A3F90@DBBPR07MB7402.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tqMSKzYv7zoLJqUxqxBiT3WAmBPzZmjB6"
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--tqMSKzYv7zoLJqUxqxBiT3WAmBPzZmjB6
Content-Type: multipart/mixed; boundary="qvVotLpEiGtDjYdTCgvpctz45NGRV9yLo";
 protected-headers="v1"
From: bbmt <bbmt@hotmail.fr>
To: netfilter@vger.kernel.org
Message-ID: <9f4e9fce-80db-cef8-bcdf-07ab9b3ab07c@hotmail.fr>
Subject: mistakes on wiki

--qvVotLpEiGtDjYdTCgvpctz45NGRV9yLo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

hi,
sorry for my english.
during my research, i saw two mistake on the wiki.
in this page:=20
https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_metainf=
ormation
the ibridgename and obridgename don't exist. The name is now ibrname and =

obrname.
(http://git.netfilter.org/nftables/commit/?h=3Dv0.9.0&id=3D4787edad132c30=
ae0f6bb00135ae5d970b0ccb74)

On this page:=20
https://wiki.nftables.org/wiki-nftables/index.php/Bridge_filtering
we can read "There is currently no connection tracking available for=20
bridge filtering. "
but with a recent kernel (>5.3 i think) and a recent version of nftable=20
this limit doesnt exist.
For exemple, on the future stable distribution of debian, we can use=20
connection tracking with bridge table.

thanks for the work
Olivier



--qvVotLpEiGtDjYdTCgvpctz45NGRV9yLo--

--tqMSKzYv7zoLJqUxqxBiT3WAmBPzZmjB6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEnJZt7w5Q0OFTcQxJuEOIUiCga/QFAl/AJk0FAwAAAAAACgkQuEOIUiCga/Sj
9Q//TDc/SDi3rrlU/1RVStSMUGUW2RC8XyH+5K0NbjCMWnEwwVH3PJ8VLNiBe6Tc/77CnCM/uzU+
gMwAuSTwxujPVkjGyYkNA0V7+HZjlwzFnBSwIuRfn7FsLabxakTv9dZNXrjLMq29C3VC6RuXe0ES
bPuqPNjaG8lPTh6rvw27RJ+xcWwlfno1BF5Xptged87RrBelE8nYL0TmsKuPOcD+LKi10IlVKVv4
Zhsaii+rCaR0cu/YFsjQitizSZxIXz16Po4iJkaeAx5DwNfFgFvS1/HVrV85z4ao7B91BeH2BzT1
k4X4sflP5VrmsswieNVv/zM1THQHKUNTQTcmV9PBS3ngOpX7rEVvPLnRcBNg+0gO0DgwrPHz53Li
nrbEvVCjKeZKKhd+6lbRZKBurf7O79zwbNA3mCImCFmHgIobmiikQD+ucvEHs6JoHcZr9MqP9aiW
Cmpeb2u5ANRD/8Y83JSWXJneQBQdmyuxcrIlY5bo1Hs5jEWb81/G8cn6Jak2IWAQ4odJR/qfc1gO
CeEPlbLuaxYQERslI+ZhIbmBqU4zb/VwhqTvT63SUZrw2H1hVFdap8svTxGxBzqgrXuKnrX9h/vc
hEf5Qg0pw2JIFEBbWvNYh8jjsLQ54XBnMx3YhM29odpnYiFQxNPs82KSmNHJu+qzsxt7rx0lMoe9
9Dg=
=SN3D
-----END PGP SIGNATURE-----

--tqMSKzYv7zoLJqUxqxBiT3WAmBPzZmjB6--
