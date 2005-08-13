From: Thilo Schulz <arny@ats.s.bawue.de>
Subject: Re: Blocking Google Earth
Date: Sat, 13 Aug 2005 17:11:15 +0200
Message-ID: <200508131711.17351.arny@ats.s.bawue.de>
References: <20050812201225.CE6DD2128@juno.tc.df.gov.br>
	<200508130431.24772.arny@ats.s.bawue.de>
	<42FE0054.5020204@solutti.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6058946.nMouELStyl";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42FE0054.5020204@solutti.com.br>
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

--nextPart6058946.nMouELStyl
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 13 August 2005 16:14, Leonardo Rodrigues Magalh=E3es wrote:
>     I really dont think it's easy to limit bandwidth usage ONLY for
> Earth Google without making bad experiencies on doing searchs on Google.
> No matter if searches are low-bandwidth. If you get some QoS and band
> limitation on google IPs, be sure that your google earth users will use
> ALL the available bandwidth, thus making google earth as well as google
> serching probably extremely slow.

He only had that problem with one single user. Likewise, he can restrict=20
bandwidth to google only for that one single user too. Like I already said,=
=20
your proxy method can be easily circumvented using something like an SSL=20
proxy after your proxy, whereas QoS can selectively keep a user from unfair=
ly=20
exceeding certain bandwidth. This will not only solve problems with the htt=
p=20
protocol, but also problems with the user using too much bandwidth in=20
general.

=2D-=20
Thilo Schulz

--nextPart6058946.nMouELStyl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBC/g2VZx4hBtWQhl4RAkqAAKCR6w+Sk/67HjDR+bST2DMynXoJtwCgzukh
6uKZvV19Am8scYUBfp06mSM=
=OSBL
-----END PGP SIGNATURE-----

--nextPart6058946.nMouELStyl--

