From: Athan <netfilter@miggy.org>
Subject: Re: Bye and Packet Counters
Date: Fri, 27 Dec 2002 16:49:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021227164951.GJ1878@miggy.org>
References: <000101c2adbf$d7d5ff80$6c00a8c0@blue>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VIOdPewhitSMo36n"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000101c2adbf$d7d5ff80$6c00a8c0@blue>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--VIOdPewhitSMo36n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2002 at 09:51:33AM -0600, Glover George wrote:
> Now with iptables -t nat -L -v I can get some packet counters, but not
> the complete number.  Even still this would require constant polling
> since before a delete, I could read the packet counters, but if I'm not
> deleteing it, I would constantly have to poll it (the counters are
> presented via a graphical interface, and will be polled every so many
> seconds).  So you see, I can't just go running iptables constantly.

   I don't see how you can get around the need to constantly run
iptables, but if the lack of accurate numbers is the problem then simply
add the -x flag to get the exact byte/packet counts:

	iptables -t nat -nxvL

For doing it without running iptables I you may want to look at:

	http://www.netfilter.org/documentation/FAQ/netfilter-faq-4.html#ss4.1

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--VIOdPewhitSMo36n
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4MhK8ACgkQzbc+I5XfxKdyHwCeMRuuLk41pL99TrS4JtwON/du
GS4AoIvOyXjVn3ZZS3YXltexabMp1ky/
=NOX9
-----END PGP SIGNATURE-----

--VIOdPewhitSMo36n--

