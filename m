From: Athan <netfilter@miggy.org>
Subject: Re: port redirection *without* NAT
Date: Tue, 7 Jan 2003 22:08:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030107220800.GP16581@miggy.org>
References: <20030106141242.C12830@infinity.rhythm.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v+Mbu5iuT/5Blw/K"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030106141242.C12830@infinity.rhythm.cx>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Steve Benson <steve@infinity.rhythm.cx>
Cc: netfilter@lists.netfilter.org


--v+Mbu5iuT/5Blw/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2003 at 02:12:42PM -0500, Steve Benson wrote:
> I'm trying to figure out how (if possible) to do port redirection with
> iptables on my linux router. This router is is not doing NAT, all connect=
ed
> networks have real, public IP addresses. There is tons of information out
> there about doing port redirection with NAT, but I can't find anything for
> without NAT. I just want to make the router take traffic destined for
> address A port x and change the destination address to send it off to
> address B port x instead. A and B are on the same (directly attached
> ethernet) network. I looked into the DNAT and REDIRECT targets, but those
> only seem to work in the nat table.

   Didn't you already ask this and myself and someone else replied with
"yes you want DNAT".

   Client C, router A, server B.

	C:x -> A:y
	DNAT port y -> B:z
	A passes through C:x -> B:z, and remembers this
	B replies from port z to C:x
	A Sees this, remembers and changes it back to A:y -> C:x
	voila, working two way TCP connection.

The other way, given you have all public IPs, is to forget  rewriting,
if you want the packets to be served by B:z then just damned well tell
clients to connect there in the first place, then A just forwards
packets backwards and forwards without changing anything.

   C <---> Internet <---> eth0 A eth1 <----> B

On A:

	iptables -A FORWARD -i eth0 -d B -j ACCEPT
	iptables -A FORWARD -i eth1 -s B -j ACCEPT

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--v+Mbu5iuT/5Blw/K
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4bT8AACgkQzbc+I5XfxKcC8gCcCcj5KN1HKzdFglcTTx+7Ee8/
VxsAoI8QShWXCTlbiYgzZ0xfirmZDbkF
=Li9P
-----END PGP SIGNATURE-----

--v+Mbu5iuT/5Blw/K--

