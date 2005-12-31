From: =?utf-8?B?UmVuw6k=?= Pfeiffer <lynx@luchs.at>
Subject: Re: largescale NAT
Date: Sat, 31 Dec 2005 16:57:26 +0100
Message-ID: <20051231155726.GA2423@agamemnon.luchs.at>
References: <43B16A57.508@fiktiv.szgtikol.kando.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XBg9NAhDNArbJUtw"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <43B16A57.508@fiktiv.szgtikol.kando.hu>
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


--XBg9NAhDNArbJUtw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 27, 2005 at 1722 +0100, DEXTER appeared and said:
> [...]
> So my question is: How to handle this situation? I mean, just 1 NAT
> linux box is able to handle all the 400+ users with the above
> situations? Or we have to do something like CONNLIMIT on source ips? Is
> there possibilities to balance the traffic on 2 or more NAT box?

Just a wild guess, I would try to look at the timeouts in
/proc/sys/net/ipv4/netfilter/ and see if you can reduce some of them. In
addition to that I would increase the IP pool for NAT on the outgoing
interface(s). You don't need two boxes for that, just multiple IP
addresses on the interface.

Best wishes,
Ren=C3=A9.

--=20
  )\._.,--....,'``.      Let GNU/Linux work for you while you take a nap.
 /,   _.. \   _\  (`._ ,. R. Pfeiffer <lynx at luchs.at> + http://web.luchs=
=2Eat/
`._.-(,_..'--(,_..'`-.;.'  - System administration + Consulting + Teaching -


--XBg9NAhDNArbJUtw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDtqpmeMu5lRpXJ7kRAionAKDKZNvYy+VgMadX1WjZC+7iFwNnRwCgrEIZ
InCCnQbm9GQm5/QDYnWEEQU=
=sUq9
-----END PGP SIGNATURE-----

--XBg9NAhDNArbJUtw--

