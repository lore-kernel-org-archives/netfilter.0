From: Mark Vevers <mark@vevers.net>
Subject: Re: Iptables and SNAT
Date: Tue, 17 Feb 2004 10:57:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402171057.08738.mark@vevers.net>
References: <004d01c3f53f$73685cf0$2d64a8c0@pcjka>
Reply-To: mark@vevers.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004d01c3f53f$73685cf0$2d64a8c0@pcjka>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: Jan Kaastrup <jka@protego.dk>, 'netfilter' <netfilter@lists.netfilter.org>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday 17 Feb 2004 10:18 am, Jan Kaastrup wrote:
> Hi list
> After a reboot of my RedHat mashine, the NAT part of Iptables stop
> working.
Is the iptable_nat module loaded? =20
/sbin/lsmod will list the modules and if any modules are not loaded for
the ruleset then you'll either need to modprobe them beforehand or
alter modules.conf to load them when iptables loads (add below ...)

Cheers
Mark
=2D --=20
Mark Vevers.    mark@ifl.net / mark@vevers.net
Principal Internet Engineer, Internet for Learning,
Research Machines Plc. (AS5503)
=2D --
GPG Key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0xB08F3CA3
=46ingerprint: 85BA 30C4 9EC8 1792 4C8C   C31E 58B5 3D1C B08F 3CA3
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAMfOEWLU9HLCPPKMRAu0XAJ9yVLQ0X3x0XNQ84irLTOVdZPrWUACdGr2Y
udGvM/2ukyptia+Vh/+UX6s=3D
=3Dt6Ag
=2D----END PGP SIGNATURE-----


