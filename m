From: Fajar Priyanto <fajarpri@arinet.org>
Subject: I thought ssh is port #22 ?!!
Date: Thu, 1 Apr 2004 08:32:06 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404010832.10293.fajarpri@arinet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi guys,
I'm not really sure about this. I thought ssh is made in port #22?
When I made a ssh session into my server, /var/log/messages showed this:
Apr  1 09:20:20 server2 sshd[2711]: Accepted password for root from=20
192.168.0.234 port 32873 ssh2

Why did it use port #32873?
Is there something wrong with my ssh or firewall?
TIA,
=2D --=20
=46ajar Priyanto | Reg'd Linux User #327841 | http://linux.arinet.org
08:31:42 up 36 min, Mandrake Linux release 9.2 (FiveStar) for i586=20
public key: https://www.arinet.org/fajar-pub.key
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAa3EYkp5CsIXuxqURAluBAKCNiyg8+KXYDu/JuZghSVMXvfrjMgCdG7O2
Bb4SQcbOiAqALl1o9yQ5H1k=3D
=3D4uUZ
=2D----END PGP SIGNATURE-----


