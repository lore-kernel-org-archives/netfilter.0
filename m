From: Alexandros Papadopoulos <apapadop@cmu.edu>
Subject: owner module + patch-o-matic
Date: Sun, 13 Oct 2002 00:19:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210130019.19902.apapadop@cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all. This is a known issue, but I didn't find any answer, hence I'm as=
king.

I'm trying to use the owner module (option --cmd-owner) with my freshly=20
compiled iptables v1.2.7a.

Problem:

[root@localhost ~]# /sbin/iptables -A OUTPUT -m owner --cmd-owner ssh -p =
tcp=20
- -j DROP
iptables v1.2.7a: Unknown arg `--cmd-owner'

So I downloaded patch-o-matic and tried using it, but:

[alex@localhost ~/patch-o-matic]$ ./runme pending KERNEL_DIR=3D/usr/src/l=
inux   =20
Please call ./runme from the patch-o-matic directory!

So I looked up the archives and found the following advice:

>> Download full netfilter cvs tree and run patch-o-matic/runme from ther=
e.
>
>Or just copy isapplied from the iptables directory to the patch-o-matic
>directory and run:
>
>perl -pi -e 's|../userspace/isapplied|./isapplied|g' runme
>
>Is there any reason that this is not already done?

=2E..but I can't find "isapplied" in either of the dirs!

Is CVS the only way out of this? And if it is, is there any page that exp=
lains=20
how to use the netfilter CVS? (never used CVS before)

Thanks

- -A
- --=20
http://www.andrew.cmu.edu/~apapadop/pub_key.asc
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE9qPRHgmAMwQt1gmURAnyuAJkBNpoVUrWJQTDQ5dzf+22iRhmwnwCcCN6R
T55ALtkCUa7J8ctDV72eShI=3D
=3DNW1P
-----END PGP SIGNATURE-----


