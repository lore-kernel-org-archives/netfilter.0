From: Jacob Helwig <jhelwig@cs.purdue.edu>
Subject: Patch-o-Matic problems
Date: Wed, 6 Nov 2002 19:55:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021107005515.GB490@Parkmoor.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ok, so here's the deal.  I tried following the directions found at
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-2.html
but things fell apart when it go to the part where it says:
"While in the `userspace/' directory,
let's run p-o-m :

# make patch-o-matic".
Make just tells me that there is no "patch-o-matic" target. So, next I tried
running patch-o-matic using the runme script, and all it ever spits back at
me is "ERROR: Invalid option" (calling it using "./runme pending").  I've set
the KERNEL_DIR environment variable to /usr/src/linux, which is where my
kernel sources are, and I tried downloading Patch-o-Matic from CVS first, then
the patch-o-matic-20020825.tar.bz2 from FTP, and both give me the same thing.
I'm sure there's something simple I'm missing, but I can't seem to find it.
Any help is greatly appreciated.

Thanks,
Jacob

-- 
-----BEGIN GEEK CODE-----
Version: 3.12
GCS/MU d- s+:- a-- C++++>$ UL+++ P++++ L+++>++++ !E
W+++ N++ K? W--- M-- PS+ PE Y+ PGP++(+++) t+ 5+ X+
R(+) tv b++(+++) DI++ D++(+++) G(++) e* h* r++>+++ y?
------END GEEK CODE------

