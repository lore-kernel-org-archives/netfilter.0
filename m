From: Michael Weinert <weinert@sys2.de>
Subject: Re: no ssh on eth0
Date: Sun, 30 Jul 2006 12:41:25 +0200
Message-ID: <200607301241.29820.weinert@sys2.de>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1915681.qjR3gax4YY";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1154239260.5429.2.camel@nirvana.aurokruti.in>
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

--nextPart1915681.qjR3gax4YY
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Sonntag, 30. Juli 2006 08:01 schrieb varun:

Hello

how about editing the:

/etc/ssh/sshd_config

ListenAddress <your-ip-from-eth1>

I personally wouldn't do this with iptables.

Michael

> Hello,
>
> I a internet server with :
>
> eth0 as WAN and eth1 as LAN.
>
> I want to prevent ssh on eth0.
>
> Howto do it ?
>
> Thanks
>
> Varun

=2D-=20

          SysQuadrat    Systeme mit Sicherheit
    Michael Weinert Stuttgart Filderstadt-Plattenhardt
  Tel.: 0711-9970288 Fax: 5360559 Mobil: 0170-4141273
   http://www.linux-firewall.de  weinert@sys2.de
           KeyServer hkp://pgp.mit.edu

--nextPart1915681.qjR3gax4YY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEzIzZzHH3xZ4BwaURAhMXAKCgwmJ9lWqeXYIkEfFkMSe6PL4TuQCfXdiI
ZQ1KJ/IrXN10pTUbAmQYwMc=
=41hU
-----END PGP SIGNATURE-----

--nextPart1915681.qjR3gax4YY--

