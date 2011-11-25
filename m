From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: How to drop an idle connection with iptables?
Date: Fri, 25 Nov 2011 06:16:32 -0500
Message-ID: <janteh$3ui$1@dough.gmane.org>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <jal9sa$t42$1@dough.gmane.org> <4ECF299D.9040005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE611585B768FA6A83914A17E"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ECF299D.9040005@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE611585B768FA6A83914A17E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11-11-25 12:37 AM, lu zhongda wrote:
> On 2011-11-24 19:30, Brian J. Murrell wrote:
>>
>> You didn't answer my other question though, which is why do you think
>> you need to be dropping idle, yet still ESTABLISHED sessions (and
>> breaking higher level protocols when you do that)?
> The need to drop idle connection comes from one technical support reque=
st:

Answering my question of "why do you want to do this" with "because
somebody asked" does not really answer the question though.

There is an important reason for me to to ask and you to answer the
question (i.e. with a real-world use-case) and that's because typically
when somebody is proposing to do things that are "strange" or "not as
intended" (and indeed which will result in other things breaking -- like
TCP in this case) it's because they are trying to solve a problem with
the wrong tool.

Can you please provide a real-world use-case as to why you'd want/need
to stop (i.e. break) an open TCP session?

Cheers,
b.


--------------enigE611585B768FA6A83914A17E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk7PeRAACgkQl3EQlGLyuXAZnwCgyAeOegd3Yq9/Qb7h9Tm8lL7q
yMgAn07ALiNaewR/SZtrLmsAIWmYRZws
=AAy5
-----END PGP SIGNATURE-----

--------------enigE611585B768FA6A83914A17E--

