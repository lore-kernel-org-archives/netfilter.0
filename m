From: Roberto Ferrari <rferrari@mbigroup.it>
Subject: Re: match n packets every m
Date: Fri, 21 Oct 2005 12:39:42 +0200
Message-ID: <4358C56E.3050804@mbigroup.it>
References: <4357B648.90700@mbigroup.it>
	<Pine.LNX.4.61.0510201837400.27782@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510201837400.27782@filer.marasystems.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Henrik Nordstrom wrote:
[...]
> 
> The simplest and most sane would probably be to extend nth with what you
> want.
> 

Thank you very much for the help, it seems that we reached the same
conclusion. :-)
Do you have idea of where I should modify the nth code?
Do you think it could be safe to modify also the limit of 100  to the
"--every", making it grow to 1000 or 2000?
Txs,

Roberto Ferrari.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDWMVu0xokq8z7B1ARAoSpAKCKm60mwojc4qe29BnJp+mCEmZcOwCdHOti
0UFW4yj00haZ0rj6Q7FuTXs=
=Av+C
-----END PGP SIGNATURE-----

