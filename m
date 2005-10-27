From: Buddy wu <ejournal4me@gmail.com>
Subject: connlimit module's problem in patch-o-matic
Date: Thu, 27 Oct 2005 16:58:36 +0800
Message-ID: <43a0cdcb0510270158p57eed463k@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

    sorry to post the problem again

    Kernel : 2.6.10
    patch-o-matioc: patch-o-matic-20051025 or patch-o-matic-20051025
    iptables:1.3.3

    first I user the POM's ./runme command to patch the kernel, then
make menuconfig in linux kernel dir, and select connlimit module.
    when I make the kernel, it found errors when comblie to
ipt_connlimit module. The follow is the error message
-----------------------------------------------------------------
CC      net/ipv4/netfilter/ipt_connlimit.o
net/ipv4/netfilter/ipt_connlimit.c: In function `count_them':
net/ipv4/netfilter/ipt_connlimit.c:68: error: structure has no member
named `proto'
net/ipv4/netfilter/ipt_connlimit.c:94: error: structure has no member
named `infos'
net/ipv4/netfilter/ipt_connlimit.c:101: error: structure has no member
named `infos'
make[3]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2
----------------------------------------------------------
     I want to know where  the problem is. and Is the iptables's
version conflict with the Linux kernel version?
     anybody use connlimit module can tell me what your kernel
version, iptables version and the patch-o-matic's version.
     Thanks anyway

