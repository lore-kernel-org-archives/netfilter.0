From: George Ross <gdmr@inf.ed.ac.uk>
Subject: Re: Port Redirection with iptables (Log information)
Date: Wed, 17 Dec 2003 16:29:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312171629.hBHGT5Y06730@eden.inf.ed.ac.uk>
References: <20031217154514.19655.qmail@web41105.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_679027713P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: Your message of "Wed, 17 Dec 2003 07:45:14 PST."
             <20031217154514.19655.qmail@web41105.mail.yahoo.com> 
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

--==_Exmh_679027713P
Content-Type: text/plain; charset=us-ascii

> I'm getting a lot of lines that look like:
> Dec 17 09:37:27 redpen kernel: NET: 61 messages
> suppressed.
> Dec 17 09:37:27 redpen kernel: Neighbour table
> overflow.

You may want to review the values of 
/proc/sys/net/ipv4/neigh/default/gc_thresh2 and .../gc_thresh3.
-- 
Dr George D M Ross, School of Informatics, University of Edinburgh
    Kings Buildings, Mayfield Road, Edinburgh, Scotland, EH9 3JZ
Mail: gdmr@dcs.ed.ac.uk   Voice: +44 131 650 5147   Fax: +44 131 667 7209
 PGP: 1024/B74A4F7D  14 E8 B3 00 20 04 68 F8  95 40 CB 36 A4 D4 FA 90



--==_Exmh_679027713P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.6.3 2003/04/04

iD8DBQE/4IRRtnZcK611jMURAnbTAJ9pOJOV5uoDd7kwn7+eIKDMIYNlGwCaAqMO
eZ3SG+LPQQV4Zcj6rQOxv0k=
=LfCU
-----END PGP SIGNATURE-----

--==_Exmh_679027713P--

