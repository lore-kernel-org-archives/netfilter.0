From: Thomas Lussnig <thomas.lussnig@bewegungsmelder.de>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 18:40:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA9A1EE.4080609@bewegungsmelder.de>
References: <20021013065007.A15824@hamal.ipal.net> <20021013135349.FARY28874.mta06-svc.ntlworld.com@there> <20021013101034.E15824@hamal.ipal.net> <20021013154117.NLFK459.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig4E7E7BCDF43B15755C880C76"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4E7E7BCDF43B15755C880C76
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

>
>
>>Standard routing uses the destination to look up what to do.  This will
>>need to be based on source address.  Apparently the policy routing has th=
is
>>capability, but the documentation for that stuff is rather vague so far.
>>   =20
>>
>
>Yes, I was suggesting that you use policy routing, but I believe that stil=
l=20
>has the same sort of "reject" destination as the standard "route" command,=
 so=20
>you don't need to actually send your unwanted packets on anywhere.
>
Nope, the IP-Route2 command is well explained. AND you can select=20
between more than one filter.
unchreachable or blackhole
unreachable send's an command back (ICMP)
and blackhole redirect the packet to the fast null device *eg*

But to catch bursts and i think whats you talking about there are two=20
other solutions.
- netfilter with limit/psd/recent
- ip/tc with bandwith management based on the syn flag

Cu Thomas Lu=DFnig

p.s. It is not an good idee to drop the syn packets since if there come=20
no connect the sender retry it for some times.
Bether solutions would be sending RST packets that finaly tell the=20
sender that you are not willing to accept connection.
Even if the you wan't to block an FIXED set of IP's permanently for SMTP=20
you can with DNS and view based give them
an wrong (127.0.0.1) DNS solution for the MX.

Cu Thomas Lu=DFnig

--------------enig4E7E7BCDF43B15755C880C76
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE9qaHuBZl9gXHZBTcRAgNOAJ44PCxEmxfxYBenXHr3QiAL052IxACfZd43
wC38/2KpD9J8nrhbYMyhGEw=
=Op8k
-----END PGP SIGNATURE-----

--------------enig4E7E7BCDF43B15755C880C76--


