From: Michelle Konzack <linux4michelle@freenet.de>
Subject: Re: [OT] New router with NIC (4-port HUB) recommandation
Date: Sun, 13 Feb 2005 13:55:19 +0100
Message-ID: <20050213125519.GS16546@freenet.de>
References: <20050213083054.GL16546@freenet.de>
	<420ED55B.19131.35ACE7D@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nbwp0cmFVefRM4Ni"
Content-Disposition: inline
In-Reply-To: <420ED55B.19131.35ACE7D@localhost>
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


--nbwp0cmFVefRM4Ni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 2005-02-13 04:19:39, schrieb Peter E. Fry:

>   Now there's a voice from the past.  OK, a year or two.
>   Hmm.  As Andrew said...  I've heard of applications where folks=20
> need a single MAC and/or IP, so the hub card is nice.  But yours=20
> sounds like four independent links, so a true quad NIC should work as=20
> well.

In theory... But I have only 8 IP's free. If I use a Quad-NIC
I need for times a /30 Network which are effectiv 16 IP's.

Curently I have:

publicnet       /192    192.168.1.0-63
privatenet      /224    192.168.1.64-95
securenet       /240    192.168.1.96-111
cybernet        /248    192.168.1.112-119
wavenet         /128    192.168.1.128-255

So I have only one /248 in 192.168.1.120-127 left

Note:   I must configure it like that, because in the next
        time I will get a whole /24 public iP range.

>   There must be actual drivers for some of the switch chipsets as=20

My Router is running under Debian/WOODY with Kernel 2.4.27

>   I'd personally go for a quad NIC, just because I used a bunch back=20
> in my LRP days.  I'd send you one, but I gave them all away long ago -
        ^^^
  Long time ago for me... it was Version 2.9.4 with Dave C.

> - I'm down to a crusty old Compaq dual TLAN.  (If you were looking=20
> for ATM, FDDI, ATM, DS3, more ATM, an old Alpha, or some other=20
> useless junk, I could help.)  Quad NICs are all over eBay here, but=20
> they don't seem to be as common in Europe.  And the hub NICs are=20
> cheap, and some folks have had success with 'em.

I was searchin eBay for Quad-NIC, but nothing found in France/Germany.
And sellers in UK or the USA do not sell to EU because the Transport
is to expensive.

Best is, if I know some types of "cheap" NICS with 4-port HUB, then
I can search it in <http://www.preisvergleich.de/> but without any
knowledge of types I am lost.=20

I know only the Intel GBit Quad-NIC which I have in Paris in a
P4-Router in 3 X-PCI-Slots (64 Bit and 66 MHz)

>   Best o' luck.
>=20
> Peter E. Fry

Greetings
Michelle

--=20
Linux-User #280138 with the Linux Counter, http://counter.li.org/=20
Michelle Konzack   Apt. 917                  ICQ #328449886
                   50, rue de Soultz         MSM LinuxMichi
0033/3/88452356    67100 Strasbourg/France   IRC #Debian (irc.icq.com)

--nbwp0cmFVefRM4Ni
Content-Type: application/pgp-signature; name="signature.pgp"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCD043C0FPBMSS+BIRAnWkAJwIvdtfmfTOF4r7UBWoCJzqt1ivfgCgr523
gkm6jEg3jrC99v9vF+ipQBY=
=9gqn
-----END PGP SIGNATURE-----

--nbwp0cmFVefRM4Ni--

