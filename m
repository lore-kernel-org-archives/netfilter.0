From: Athanasius <netfilter@miggy.org>
Subject: Re: How to disable ip_contrack_irc when its compiled into the kernel?
Date: Fri, 27 Dec 2002 18:41:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021227184116.GK1878@miggy.org>
References: <1041008143.15849.81.camel@fish-dt.dmz.dynam.ac> <3E0C9B9F.80200@shortcircuit.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCF9ydJxlAJsfRTu"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E0C9B9F.80200@shortcircuit.dyndns.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Users <netfilter@lists.netfilter.org>


--FCF9ydJxlAJsfRTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2002 at 11:27:43AM -0700, Dan Egli wrote:
> Unfortunately, I believe that once a module is compiled into the kernel=
=20
> it's present, end of discussion. And besides. thats not quite what you=20

   Agreed on this.  It's a big incentive to do all/most of the netfilter
stuff as modules.

> want is it? removing ip_conntrack_irc would kill ALL irc abilities, not=
=20
> just DCC. After all, doens't IRC operate on multiple ports, similiar to F=
TP?

   You should be able to actually IRC through the box, as that's a
simple TCP connection one way or the other, assuming other rules allow
it.  The ip_nat_irc and ip_conntrack_irc are to snoop DCC commands to
allow those to work.
   Yes, the client<->server can use any port really, which is why the
irc modules allow you to pass a list of ports to snoop.  Another good
reason to compile them as modules as I don't believe you can specify the
ports option when hard compiled in?  Or is there some runtime option
that could be added with lilo's append statement?

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--FCF9ydJxlAJsfRTu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4MnswACgkQzbc+I5XfxKd8IwCfePoJd4WwbqmdZSbGyd+XcVsv
ozUAn1tClob1LS2IgbbOPJZHuVWdqHrU
=/ERt
-----END PGP SIGNATURE-----

--FCF9ydJxlAJsfRTu--

