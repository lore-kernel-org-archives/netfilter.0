From: Thilo Schulz <arny@ats.s.bawue.de>
Subject: Re: ToS and Windows
Date: Sun, 25 Jul 2004 11:35:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407251135.30281.arny@ats.s.bawue.de>
References: <1090735278.4548.10.camel@rivendell.home.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090735278.4548.10.camel@rivendell.home.local>
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

On Sunday 25 July 2004 08:01, Florin Andrei wrote:
> I'm using "-j TOS --set-tos" with apparently good results. I manage to
> control the ToS on the packets sent by a Linux box to a couple Windows
> boxes.
> The problem is that the packets sent back by the Windows machines do not
> have ToS set. How do i set ToS on Windows?
> One of the Win systems is Win2K, the other is WinXP.

I don't know whether this is possible at all under windows.
Though you can set the TOS bits on the linux computer using iptables and th=
e=20
mangle table.

=2D --=20
Thilo Schulz

My public PGP key is available at http://home.bawue.de/~arny/public_key.asc
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBA37fZx4hBtWQhl4RAg9XAKDZjURfS7WyfjdUmJlMSkYqhF15NQCgw0L/
xSYNex0tDDqBDycDfC6lCYQ=3D
=3DlnVD
=2D----END PGP SIGNATURE-----

