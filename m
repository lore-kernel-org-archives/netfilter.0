From: Harald Welte <laforge@netfilter.org>
Subject: Re: dhcp weirdness with iptables
Date: Fri, 3 Oct 2003 13:01:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003110131.GH5758@sunbeam.de.gnumonks.org>
References: <20030923140933.GA22498@phys.ethz.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="16x7XjvU1yLFE3y2"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030923140933.GA22498@phys.ethz.ch>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Benoit Steinmetz <besteinm@phys.ethz.ch>
Cc: netfilter@lists.netfilter.org


--16x7XjvU1yLFE3y2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2003 at 04:09:33PM +0200, Benoit Steinmetz wrote:
> it seems that the dhcp packets seem to be unaffected by the firewall, bec=
ause,
> no matter how restrictive i setup the firewall, the udp packets coming fr=
om
> port 67 on the dhcp-server and going to the local port 68 pass
> through. has this something to do with the linux socket filter
> (CONFIG_FILTER in the kernel configuration), which is needed by dhcp
> to work correctly?

The question is: How is the dhcp client implemented?

If the DHCP server opens a PF_PACKET socket (like tcpdump does) than
there is no way iptables can filter those packets. =20

Only if the process uses the normal IP stack (PF_INET sockets), packet
filtering rules apply.

> thanks
> benoit steinmetz.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--16x7XjvU1yLFE3y2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fVcLXaXGVTD0i/8RAqPcAJ9S7Kh+A/f/wJGQkA66E/2G07ni/gCfQByZ
H1a/0xijQLO6NKKFmsfWCic=
=2SXO
-----END PGP SIGNATURE-----

--16x7XjvU1yLFE3y2--

