From: Stephane Bortzmeyer <bortzmeyer@nic.fr>
Subject: Cannot compile connlimit: structure has no member named `proto'
Date: Thu, 11 May 2006 10:51:21 +0200
Message-ID: <20060511085121.GA6833@faramir.nic.fr>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I just patched (with Patch-o-Matic) a 2.6.9 kernel with the connlimit
patch (foudn in patchlets/ in the Subversion repository). Patching was
successful but compilation is not:

  CC [M]  net/ipv4/netfilter/ipt_connlimit.o
net/ipv4/netfilter/ipt_connlimit.c: In function `count_them':
net/ipv4/netfilter/ipt_connlimit.c:68: error: structure has no member named `proto'
net/ipv4/netfilter/ipt_connlimit.c:94: error: structure has no member named `infos'
net/ipv4/netfilter/ipt_connlimit.c:101: error: structure has no member named `infos'
make[3]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

Does it mean that I should patch the Netfilter which is in the kernel as well?


