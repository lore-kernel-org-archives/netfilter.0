From: Nick Taylor <nickt@lightlink.com>
Subject: libctnetlink newby question
Date: Sat, 28 Aug 2004 16:20:00 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0408281607180.21465@adore.lightlink.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a need to delete conntrack entries from userspace.  I have applied
the nfnetlink-ctnetlink patch from p-o-m onto a shiney new 2.4.26 kernel,
and rebuilt.  All is well with the kernel.  I have downloaded libctnetlink
from cvs, and made a few attempts to build the library, but I can't find
documentation on the correct incantation to invoke the compiler.  There's
an m4 script, and a configure.in.  Autoconf generates a configure which
will run until it realizes there's no Makefile.in, so what's the correct
entry point to attempt to compile?  Thanks!

