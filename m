From: Ivan Dubrov <wfragg@gmail.com>
Subject: Re: Routing decision after FORWARD
Date: Sat, 30 Jun 2007 14:13:16 +0700
Message-ID: <4686028C.1020007@gmail.com>
References: <4682630E.30406@gmail.com>
	<46854467.7060309@nicaraguaopensource.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig335A6CA78B0278E57F77ADCD"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:references:in-reply-to:x-enigmail-version:content-type;
	b=ixpfby3cBJ77hnhw1rL6VhuS62d1+2CJzP8PH7oEwZckjJjAD7SbuWG/k1jXDdvM6XYMEpvPUlEmV3bUWYBRCtYO6XwIQ4iU+339ac3GpmvSS+Wfb+Quj+UqjWEmsfoaIePz9ZhZV3b+BeBt4MuaUjzbQHPZN/Zoaw6lYEUX8fk=
In-Reply-To: <46854467.7060309@nicaraguaopensource.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig335A6CA78B0278E57F77ADCD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

There are three escenaries:
>
> (1) Packets destined to our machine
> (2) Packets originated inside our machine
> (3) Packets forwarded
>
> The table only have a reference to escenary (1) and the diagram after
> the tables hits all escenaries.
>
> Not all packets traverse all chains, that depends on the escenary.
>
I'm was already told that both are correct. There are two routing
decisions for forwarded packets (as it is drawn on the diagram) and the
second routing decision is mentioned in the table 6-3, step 8. However,
it is not clear, what kind of rules could be applied during the second
routing decision. The same as in first decision? In that case, does that
mean that I can set mark on the packet during the mangle/FORWARD and
route that packet to self in the second routing decision? And it will
traverse the table again, this time through INPUT chains?

Anyway, I've found easier solution for my needs, so these questions are
just for curiosity. :)

--=20
WBR,
Ivan S. Dubrov



--------------enig335A6CA78B0278E57F77ADCD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGhgKOLZ+Fnc2HIX4RAulSAJ9eUOu/qvh4nYf0ajjf/F5q0BV64wCghYB1
idjVTJuRZzD2Hh+rqbwSQrk=
=Kdbj
-----END PGP SIGNATURE-----

--------------enig335A6CA78B0278E57F77ADCD--

