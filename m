From: Alexandros Papadopoulos <apapadop@cmu.edu>
Subject: Re: Is there something wrong with patch-o-matic?
Date: Sun, 24 Nov 2002 12:45:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211241245.24291.apapadop@cmu.edu>
References: <031e01c2930e$41097800$4545450a@drbroyles.com> <038e01c2937d$cece8030$4545450a@drbroyles.com> <04bb01c293df$79be2610$4545450a@drbroyles.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04bb01c293df$79be2610$4545450a@drbroyles.com>
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
To: Brandon Broyles <netfilter@drbroyles.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sunday 24 November 2002 12:32, Brandon Broyles wrote:
<snip>
> I think I may have a clue on where to start.  I was looking at the
> 'isapplied' script that came with patch-o-matic.  In line 32 it
> references a command that doesn't exist for me.  It reads as such...
>
> MISSING_FILES=3D`patch -R -s -f -p1 < $PATCH | grep "No file to patch"
> | wc -l`
>
>
> I have no 'patch' command and there isn't one anywhere under my
> netfilter directory I got from CVS.  I'm not too keen with shell
> scripting, so I'm not sure how the absence of a patch command will
> effect the overall workings of the 'runme' script.
>

No "patch" command on a linux system? It *should* be there, and it=20
*should* be in your path.

If the "which patch" command returns nothing, then this is the problem.=20
Get and install "patch" somewhere in your path (/usr/bin on my system)=20
and you should be set.

- -A
- --=20
http://andrew.cmu.edu/~apapadop/pub_key.asc
3DAD 8435 DB52 F17B 640F  D78C 8260 0CC1 0B75 8265
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE94RA0gmAMwQt1gmURArl/AJ94tAH6UCbWe+LuxXUDz/a78eSKBgCeKd1g
j+et0zsmE1c2qJcaH/UrW28=3D
=3DpB6e
-----END PGP SIGNATURE-----


