From: Cliff Stanford <cliff@may.be>
Subject: Re: NAT problem with iptables
Date: Sun, 07 Oct 2007 22:09:59 +0200
Message-ID: <47093D17.4010206@may.be>
References: <4709153B.8060309@may.be> <470932FC.7090801@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470932FC.7090801@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pascal Hambourg wrote:

> A possible explanation may be the following.
> The remote box sends a continuous stream of UDP packets. The first 
> packet was received before the ruleset was installed but after the 
> conntrack was loaded, so a conntrack entry was created with no NAT, and 
> does not expire because of the continuous stream.

Thank you!  You hit the nail right on the head!

> Clear the conntrack table by any means and see what happens.

I cleared it with conntrack -F and you were absolutely right.  It's now
working as expected.  I knew it had to be my naivety but I couldn't see
what I was doing wrong.

Out of interest, I can't seem to find a syntax that conntrack -D likes;
is there a tutorial for it anywhere or any docs better than the man page?

Thanks again, Pascal, for that speedy and helpful response.

Regards,
Cliff.
- --
Cliff Stanford
Might Limited                           +44 845 0045 666 (Office)
Suite 67, Dorset House                  +44 7973 616 666 (Mobile)
Duke Street, Chelmsford, CM1 1TB
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHCT0XfNTx9pWyKfwRAsvbAJ9701Tsw6S/KiXOFkXiDEjQPYetwwCgnsEO
tdtJvqrbnz9P/SYY3VeSFws=
=GwFc
-----END PGP SIGNATURE-----

