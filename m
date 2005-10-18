From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: compiling ip_set_iptree.o
Date: Tue, 18 Oct 2005 08:54:40 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0510180853001.5083@blackhole.kfki.hu>
References: <00e501c5d395$0cb95eb0$0100a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00e501c5d395$0cb95eb0$0100a8c0@newlife>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: netfilter@lists.netfilter.org

On Tue, 18 Oct 2005, Ming-Ching Tiew wrote:

> Compiling ip_set_iptree.o as module get this error :-
>
>  CC [M]  net/ipv4/netfilter/ip_set_iptree.o
> net/ipv4/netfilter/ip_set_iptree.c:123: error: parse error before "flags"
> net/ipv4/netfilter/ip_set_iptree.c:124: warning: function declaration isn't a prototype
> net/ipv4/netfilter/ip_set_iptree.c: In function `__addip':

Could you be a little be more specific? What is the kernel version,
patch-o-matic-ng version (if downloaded from ipset.netfilter.org), ipset
version, gcc version?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

