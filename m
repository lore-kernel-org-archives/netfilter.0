From: Eric Blake <eblake@redhat.com>
Subject: Re: [libvirt-users] netfilter+libvirt=(smth got broken?)
Date: Wed, 20 Mar 2013 21:18:21 -0600
Message-ID: <514A7BFD.5060401@redhat.com>
References: <5149AFD3.2070108@yandex.ru> <5149BC91.4090502@yandex.ru> <20130321023046.GA4189@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="----enig2GWFRMNSWIWTRJIPNONGD"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130321023046.GA4189@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Nikolai Zhubr <n-a-zhubr@yandex.ru>, libvirt-users@redhat.com, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2GWFRMNSWIWTRJIPNONGD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/20/2013 08:30 PM, Pablo Neira Ayuso wrote:

>>
>> So apparently, netfilter's behaviour was indeed reversed at some
>> point, therefore libvirt stopped working properly.
>=20
> --ctdir was broken and it was fixed in patch:

In other words, the kernel folks made a silent change in ABI.  Eww.

How can we reliably tell which kernels have the old behavior, and which
have the new, so that libvirt knows which sense to use?

> By looking at the changes you made:
>=20
>> --A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
>> ESTABLISHED -m conntrack --ctdir ORIGINAL -j RETURN
>> +-A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
>> ESTABLISHED -m conntrack --ctdir REPLY -j RETURN
>=20
> The first rule looks wrong to me indeed, traffic coming in the
> original direction will initiate the connection to destination port
> TCP/110. Therefore, your change is correct.

Correct for the new kernel interpretation, but we also want to support
use of libvirt with older kernels, preferably with a runtime check so
that a binary compiled on an older kernel will still work after a kernel
upgrade.

>=20
> It's unfortunate nobody noticed this rule was incorrect so far (even
> if it was working).

It's also unfortunate that the kernel folks did a silent ABI change,
without offering any witness of which behavior is in operation.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2GWFRMNSWIWTRJIPNONGD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRSnv9AAoJEKeha0olJ0Nq3lMH+gIByEJB0XoLlGlrAQu8XCpU
pGCSc53synzVqEA0rslgKnlRf859MB2/2RsWP/99qqSHPOZdxu1zAZI5vk8lGsUh
B6RYFPxrW6pNCAm8r4aqpP8fZh4hOywX8HUymuy4FVEYCiC3pGFJ2LC1Z1DLUpEf
ldAmXYvte0m9ZYmNy/lyUSQTi3dt2+2d7PCvwRBOKLH9Y0jzGPvtxwJmp0lPxj0U
oSIgwRqJMXsAZ4himjaeiVygMtqBoLLWDnC3Idr3dXIkdOpYgWD4lGBcxgJQ3Nn2
QALgiceR84NdI4isEBf8d/a66TwHmdnrAOpCZU5ooxoh4zXb7xXLYnaKi0ob4Zk=
=Rw5i
-----END PGP SIGNATURE-----

------enig2GWFRMNSWIWTRJIPNONGD--
