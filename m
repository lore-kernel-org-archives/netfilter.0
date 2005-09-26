From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset memory usage
Date: Mon, 26 Sep 2005 13:16:49 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0509261312120.11331@blackhole.kfki.hu>
References: <4336442D.3090404@free.fr>
	<Pine.LNX.4.58.0509260852230.11331@blackhole.kfki.hu>
	<4337AE94.6020503@free.fr>
	<Pine.LNX.4.58.0509261020310.11331@blackhole.kfki.hu>
	<4337D590.1000909@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4337D590.1000909@free.fr>
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

On Mon, 26 Sep 2005, tedemo wrote:

> >Please write it exactly what you do and what happens. Do you create, fill
> >up and delete the *same* sets with exactly the *same* content, in a loop?
> >
> Yes I execute those commands in a loop on the same set (a nethash of 150
> 000 entries).
>
> the commands in the loop are :
> ipset -X neth
> ipset --restore < ip.sets
>
> The obtained results are :
> iteration 1: neth size 25856860    VmallocUsed 108004 kB
> iteration 2: neth size 25856860    VmallocUsed 108004 kB
> iteration 3: neth size 38785290    VmallocUsed 158168 kB
> iteration 6: neth size 25856860    VmallocUsed 108004 kB
> iteration 9: neth size 58177935    VmallocUsed 235844 kB
>
> This seems a lot for 0.15 million entries.
> Are the 230Mo of Vmalloc'ed memory really used by the kernel ?

25-58 million hash entries isn't really needed to store 150.000 IP
addresses/netblocks!

How do you create the set neth in ip.sets? What is the exact command?

Coul you send me the file ip.sets in private for testings?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

