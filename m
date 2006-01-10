From: "Nicolas Turro" <Nicolas.Turro@inrialpes.fr>
Subject: (no subject)
Date: Tue, 10 Jan 2006 18:13:32 +0100
Message-ID: <20060110181332703.00000002932@rodal>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>



Hi, I am trying to patch my Fedora core 4 kernel/iptable in order to includ=
e the 'random' filter (I am trying to implement =

http://linux.com.lb/wiki/index.pl?node=3DLoad%20Balancing%20Across%20Multip=
le%20Links )


However I encounter some difficulties:

Patch-o-matic works against my kernel source tree, but won't recognize linu=
x-libc-headers as a valid KERNEL_DIR.

 Iptable won't compile against the kernel source tree: I get a bunch of =

#error including kernel header in userspace; use the glibc headers instead!=

(However in this case, make print-extensions finds IPv4:random )

And if I use the unpatched linux-libc-headers, it won't compile libipt_rand=
om.so (make print-extensions only shows: IPv4:recent)


So I don't know how to proceed.
Any tips?

Please respond to me explicitly since I'm not subscribed to this mail list.=
 Thx in advance

N. Turro


