From: Buddy wu <ejournal4me@gmail.com>
Subject: con't combile ipt_connlimit
Date: Wed, 26 Oct 2005 17:05:01 +0800
Message-ID: <43a0cdcb0510260205y77d6721ai15f0ec910a7f481@mail.gmail.com>
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

    kernel source:2.6.10
      iptables:1.3.3
      patch-o-matic: 20051025

       when i combile the kernel (patched with patch-o-matic), It
occured some errors:

    CC      net/ipv4/netfilter/ipt_connlimi
t.o
 net/ipv4/netfilter/ipt_connlimit.c: In function `count_them':
 net/ipv4/netfilter/ipt_connlimit.c:68: error: structure has no member
named `proto'
 net/ipv4/netfilter/ipt_connlimit.c:94: error: structure has no member
named `infos'
 net/ipv4/netfilter/ipt_connlimit.c:101: error: structure has no
member named `infos'
 make[3]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
 make[2]: *** [net/ipv4/netfilter] Error 2
 make[1]: *** [net/ipv4] Error 2
 make: *** [net] Error 2

 I want to know how to resolve it

 Thanks a lot

