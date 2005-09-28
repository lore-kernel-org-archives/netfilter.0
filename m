From: Sheldon Hearn <sheldonh@clue.co.za>
Subject: Re: SNAT for two interfaces not working
Date: Wed, 28 Sep 2005 15:57:24 +0200
Message-ID: <200509281557.24156@axl.clue.co.za>
References: <200509281547.23683@axl.clue.co.za>
	<433A9FE6.4030904@davidcoulson.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1622038.Ol1oB0ZmWP";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433A9FE6.4030904@davidcoulson.net>
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
To: David Coulson <david@davidcoulson.net>
Cc: netfilter@lists.netfilter.org

--nextPart1622038.Ol1oB0ZmWP
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 28 September 2005 15:51, David Coulson wrote:
> Sheldon Hearn wrote:
> > So basically, the SYN+ACK is arriving back at the firewall, but the
> > firewall then ignores it. =A0If I add logging, I see the packet hit
> > PREROUTING, but that's it.
>
> Disable return path filtering on the interfaces.
>
> echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter

Thank you.  Thank you, thank you, thank you.

Grovel.  Grovel, grovel, grovel.

Ciao,
Sheldon.
=2D-=20
Sheldon Hearn
IT Director
Clue Technologies (PTY) Ltd

Web:		http://www.clue.co.za/
Mail:		sheldonh@clue.co.za
Office:		+27-21-434-8034
Mobile:		+27-83-564-3276
Timezone:	SAST (+0200)

--nextPart1622038.Ol1oB0ZmWP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD4DBQBDOqFEpGJX8XSgas0RAgNVAJ9SNxCWl0htPnU29gzGrSPbrRH1rgCXcYV+
DrffTV4xorF7JlijID2nQg==
=0AZU
-----END PGP SIGNATURE-----

--nextPart1622038.Ol1oB0ZmWP--


