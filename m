From: David B Harris <eelf@sympatico.ca>
Subject: Re: IP Traffic Accounting
Date: Sat, 22 Jun 2002 10:00:49 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622100049.32188874.eelf@sympatico.ca>
References: <NFBBLDBMIDIOFPBNLEAJCEIOCHAA.yomega@wahooo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 boundary="=.HkJCeUG9+IoPQz"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <NFBBLDBMIDIOFPBNLEAJCEIOCHAA.yomega@wahooo.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

--=.HkJCeUG9+IoPQz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Jun 2002 16:02:06 +0200
"yomega" <yomega@wahooo.net> wrote:
> OK this should work, but i still got a question:
> 
> First i start to realize that my log file will become very big with
> even little outbound traffic. Now the cron is exectued and all the
> data written on the hd is analysed and written on the hd. I'm afraid
> that this will injure the health of the HD. Is there any other maybe
> more "clean" possibility to do that loggin? or have i made some
> mistakes in my thoughts?

I'd suggest you use iptable's byte-counting instead. 'iptables -L -n -v
-x' will list the bytes which have _crossed_ each given rule. (So it
won't just count which packets have matched.)

Probably be a lot faster ;)

P.S.: In production, don't forget to use -Z to zero the counters, so you
aren't counting the same packets twice.

-- 
________________________________________________________________________
\ David B. Harris, Systems administrator   |   http://www.terrabox.com /
/  eelf@sympatico.ca, elf@terrabox.com     |     http://eelf.ddts.net  \
\======================================================================/
/ Clan Barclay motto: Aut agere, aut mori.  (Either action, or death.) \
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--=.HkJCeUG9+IoPQz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9FIMSa4+WOYuKcYwRAncEAJwIunDG3kFIDyEhF7dalyITCzRLTgCeN64n
Hu85XqYMANir+pZZDUDDalc=
=/1f6
-----END PGP SIGNATURE-----

--=.HkJCeUG9+IoPQz--


