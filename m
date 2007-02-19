From: Franck Joncourt <joncourt_franck@yahoo.co.uk>
Subject: Re: Netfilter rule notation and rule parsers
Date: Mon, 19 Feb 2007 20:38:20 +0100
Message-ID: <45D9FCAC.6090607@yahoo.co.uk>
References: <20070219152509.GL19622@nightfall.luchs.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070219152509.GL19622@nightfall.luchs.at>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ren=C3=A9 Pfeiffer wrote:
> Hello, Netfilter List!
>=20

Hi,

> I am aware that there are several rule editors out there (such as
> FWbuilder). I am more interested in a low-level approach having simple
> rules that can be parsed easily and possibly distributed among multiple
> firewall systems.
>=20

I do not think there is another way to work at low level without writing
rules by yourself. The more you write, the more you understand.
This is not my job, and I am far from being an expert, but I should say,
 distibuted rules among multiple systems, is not that simple ; it
depends on your needs. Can a script for a router be useful for a server
? It can be complicated to get a script working on both systems.

Maybe I am mistaken, but this is my point of view.

- --
Franck Joncourt
http://www.debian.org
http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF  9A3C C490 534E 75C0 89FE
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFF2fysxJBTTnXAif4RAttPAJ9p1VGA3hZj+DNSu+i9f2YakFwjtQCdE+JC
J85trawUWu1ICtM86GyPNB0=3D
=3DLW0Y
-----END PGP SIGNATURE-----

=09
=09
	=09
___________________________________________________________=20
All new Yahoo! Mail "The new Interface is stunning in its simplicity and ea=
se of use." - PC Magazine=20
http://uk.docs.yahoo.com/nowyoucan.html


