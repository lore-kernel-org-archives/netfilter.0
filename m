From: Alexandros Papadopoulos <apapadop@cmu.edu>
Subject: Re: non-standard FTP ports and connection tracking
Date: Mon, 9 Dec 2002 18:05:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212091805.06266.apapadop@cmu.edu>
References: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A414C@olga.chs.chalmers.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A414C@olga.chs.chalmers.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Kim Leandersson <kim.leandersson@chs.chalmers.se>, netfilter@lists.netfilter.org
Cc: Rob Sterenborg <rsterenborg@xs4all.nl>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 09 December 2002 17:01, Kim Leandersson wrote:
> Put the line:
> ip_conntrack_ftp ports=3D2121
> In your modules.autoload, when it should work fine for you.

Thank you for the prompt answers.

I changed my module-loading commands in the iptables script to:

/sbin/modprobe ip_conntrack_ftp ports=3D2121

and it works like a charm.

Caveat: One needs to first remove the module completely (/sbin/rmmod),=20
and then reload it with the new parameter.

Thanks again!

- -A
- --=20
http://andrew.cmu.edu/~apapadop/pub_key.asc
3DAD 8435 DB52 F17B 640F  D78C 8260 0CC1 0B75 8265
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE99SGigmAMwQt1gmURAvtbAJ4pOHnqLPQP6IALPcGYoXO0s/1GuwCeM/sX
Tcd1x/gE468uFCofUPHKrOM=3D
=3DAv8y
-----END PGP SIGNATURE-----


