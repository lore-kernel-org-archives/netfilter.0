From: O-Zone <liste@zerozone.it>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 16:58:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201658.59945.liste@zerozone.it>
References: <200405201318.34706.liste@zerozone.it> <200405201637.54395.liste@zerozone.it> <200405201545.32872.Antony@Soft-Solutions.co.uk>
Reply-To: liste@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201545.32872.Antony@Soft-Solutions.co.uk>
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

On Thursday 20 May 2004 16:45, Antony Stone wrote:
> Yes, but that destination address has already been changed by your
> PREROUTING rule, and is now 192.168.0.0/24 - that's the whole point.   If
> the destination address had not been changed (ie: if the client had
> contacted the server's real IP address instead of a pretend one), you
> wouldn't need to change the source address as well.

As you say, the problem was when a server with 192.168.0.x, passing through=
=20
192.168.0.1 (that is the ROUTER), and try to connect to 151.8.47.x (the rea=
l=20
server's PUBLIC IP). This is the desidered flow:

192.168.0.2-->151.8.47.A-->192.168.0.3

So i think that i need additiona rules to MASQ/DNAT connection to 151.8.47.=
x !

Oz

=2D --=20
There is a theory which states that if ever anyone discovers exactly what
the Universe is for and why it is here, it will instantly disappear and be
replaced by something even more bizarre and inexplicable.  There is another
theory which states that this has already happened.
		-- Douglas Adams, "The Hitchhiker's Guide to the Galaxy"
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArMexYuBSFbgkEysRAgoOAKCxjUX/lXCX30GUUaCkQTSHaklXXQCdHS6A
faOLbQvIfdm6e7coMhWm/9w=3D
=3DddMI
=2D----END PGP SIGNATURE-----


