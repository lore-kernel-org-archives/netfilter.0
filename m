From: Emanoil Kotsev <emanuel@abc.at>
Subject: Re: H323
Date: Sun, 20 Jul 2003 11:13:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307201113.25976.emanuel@abc.at>
References: <BAY1-F1173FIkPr1aTL00016940@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-F1173FIkPr1aTL00016940@hotmail.com>
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
To: gold gold <mr_gold55@hotmail.com>, netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

In general it is not so hard to apply and activate the H.323 patch.
you have to
1) download iptables, download POM(patch-o-matic) for the proper version of=
=20
iptables i think
2) have the kernel source of course=20
3) untar&unzip everything (I have done this in /usr/src)
than
4) I do a backup of my compiled kernel directory and than start making all =
the=20
rest to avoid recompiling everything=20
5) apply the patches (there is info how to do this in POM itself and you do=
n't=20
need to apply patches that you won't use and know - try first only the H.32=
3=20
patch)
6) reconfigure your kernel and enable H.323 (networking options =3D> ip=20
netfilter configuration)
7) (re)make your new kernel
8) change into iptables dir and make "make KERNEL_DIR=3D ... " path to your=
=20
kernel=20
make install
9) enable your kernel (ex. make install, make modules_install - change lilo=
,=20
grub, boot, make initrd or anything you use)
IMPORTANT TIP
10) Be sure to have a rescue floppy or entry in the bootloader for the old=
=20
kernel to be able to boot your old configuration in case of failure
=2D --------------
If it's just you staying behind a firewall and useing  netmeeting and you h=
ave=20
rights to manage the firewall, you can forward the ports (1720 and few=20
others) to your windows machine (google tells you how)

best regards and good luck

On Saturday 19 July 2003 09:08, gold gold wrote:
> Hello everybody,
>
>
>
>      I've already asked this question before, but here it is again:
>
>
>
> How do I enable my masqueraded Windows machine to use MSN's audio/video
> conversation? I've been told to load the "H323" module and do some
> "patch-o-matic stuff" (??), but I don't really know alot about these
> stuff... could someone please give me detailed step-by-step instructions =
on
> how to do that? I would really appreciate this. Thanks a lot.
>
> _________________________________________________________________
> The new MSN 8: smart spam protection and 2 months FREE*
> http://join.msn.com/?page=3Dfeatures/junkmail

=2D --=20
//----------------------
||
|| Emanoil Kotsev      =20
||
|| tel. 0043 1 9253175
||
\\--- penguin friendly--
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/Gl0xMdng4VCsE9oRAsEiAJ0d3yV9oMkvPW681sqQrZfX6pcSbwCgvFfQ
KEw1uuBn/Y4HSb3AY5A5+kQ=3D
=3DI0tH
=2D----END PGP SIGNATURE-----


