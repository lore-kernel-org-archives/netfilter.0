From: O-Zone <liste@zerozone.it>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 16:37:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201637.54395.liste@zerozone.it>
References: <200405201318.34706.liste@zerozone.it> <200405201454.50355.liste@zerozone.it> <200405201422.00324.Antony@Soft-Solutions.co.uk>
Reply-To: liste@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201422.00324.Antony@Soft-Solutions.co.uk>
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

On Thursday 20 May 2004 15:22, Antony Stone wrote:
> You need to make sure that the reply packets go back through the firewall,
> as well as the forward packets.   The easiest way to do this is by adding=
 a
> SNAT rule so that as far as the destination server is concerned, the
> packets came from the firewall, not the real client, and therefore the
> server sends the replies back to the firewall (which then reverse-NATs th=
em
> and returns the replies to the original client machine).
>
> Therefore in your case something such as:
>
> iptables -A POSTROUTING -t nat -s 192.168.0.0/24 -d 192.168.0.0/24 -j SNAT
> --to 192.168.0.1

But, i think, i need to add other rules because the original connection cam=
e=20
from 192.168.0.x to 151.8.47.x, right ?

Let me know. Thanks a lot !

Oz


=2D --=20
A new supply of round tuits has arrived and are available from Mary.
Anyone who has been putting off work until they got a round tuit now
has no excuse for further procrastination.
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArMLAYuBSFbgkEysRAtYHAJ9dGGKWf4KK3LgTVbe7dnPcWvS6ggCcDKy9
/bErxaNGbSQzlE/sS0HpRmo=3D
=3D+z9F
=2D----END PGP SIGNATURE-----


