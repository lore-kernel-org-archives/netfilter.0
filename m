From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset memory usage
Date: Mon, 26 Sep 2005 08:54:46 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0509260852230.11331@blackhole.kfki.hu>
References: <4336442D.3090404@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4336442D.3090404@free.fr>
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
To: tedemo <tedemo@free.fr>
Cc: netfilter@lists.netfilter.org

On Sun, 25 Sep 2005, tedemo wrote:

> The ipset modules seems to eat a lot of memory :
> with a test set of  :
> - 150 000 networks in a nethash
> - 10 000 hosts in a iphash
> ipset sometimes fails with out of memory errors :
> "kernel: allocation failed: out of vmalloc space - use vmalloc=<size> to
> increase size"
>
> The VmAllocUsed variable from /proc/meminfo goes from 6Mo to 160Mo after
> loading sets.

Check out the real size of the hashes by searching the kernel log:0
"rehashing of set <foo> triggered: hashsize grows from <n> to <m>".

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

