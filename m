From: George Ross <gdmr@inf.ed.ac.uk>
Subject: Re: ARP Reply with wrong MAC
Date: Tue, 14 Dec 2004 11:00:05 +0000
Message-ID: <200412141100.iBEB05up006964@eden.inf.ed.ac.uk>
References: <twig.1103020049.65314@basti79.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1521516020P";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: Your message of "Tue, 14 Dec 2004 10:27:29 GMT."
	<twig.1103020049.65314@basti79.de> 
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
To: Sebastian <netfilter@basti79.de>
Cc: netfilter@lists.netfilter.org

--==_Exmh_-1521516020P
Content-Type: text/plain; charset=us-ascii

> A Linux box (kernel 2.4.24) with 2 ethernet interfaces connected to the same
> physical backbone. eth0 (public IP) and eth1 (10.0.0.1).

It might be easier just to give one of those interfaces two addresses.

> Sometime it ocures that an arp-request for 10.0.0.1 is answered with the
> mac-address of eth0. (proxy_arp on all interfaces is off)
> 
> Did anybody got a same problem and/or a solution?

http://www.austintek.com/LVS/LVS-HOWTO/HOWTO/LVS-HOWTO.arp_problem.html
has a useful discussion of some arp problems.
-- 
Dr George D M Ross, School of Informatics, University of Edinburgh
    Kings Buildings, Mayfield Road, Edinburgh, Scotland, EH9 3JZ
Mail: gdmr@inf.ed.ac.uk   Voice: +44 131 650 5147   Fax: +44 131 667 7209
 PGP: 1024D/AD758CC5  B91E D430 1E0D 5883 EF6A  426C B676 5C2B AD75 8CC5



--==_Exmh_-1521516020P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.3.92 (GNU/Linux)
Comment: Exmh version 2.6.3 2003/04/04

iD8DBQFBvse0tnZcK611jMURAv1wAKCVfBxl0gweaPmGJYRDKG9LAdgTbACgn0eX
GooVlKHW9TAgIz/mboHBMDQ=
=gGf+
-----END PGP SIGNATURE-----

--==_Exmh_-1521516020P--

