From: tedemo <tedemo@free.fr>
Subject: Re: ipset memory usage
Date: Mon, 26 Sep 2005 13:03:44 +0200
Message-ID: <4337D590.1000909@free.fr>
References: <4336442D.3090404@free.fr>
	<Pine.LNX.4.58.0509260852230.11331@blackhole.kfki.hu>
	<4337AE94.6020503@free.fr>
	<Pine.LNX.4.58.0509261020310.11331@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0509261020310.11331@blackhole.kfki.hu>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Jozsef Kadlecsik a =E9crit :

>Please write it exactly what you do and what happens. Do you create, fil=
l
>up and delete the *same* sets with exactly the *same* content, in a loop=
?
>
> =20
>
Yes I execute those commands in a loop on the same set (a nethash of 150=20
000 entries).

the commands in the loop are :
ipset -X neth
ipset --restore < ip.sets

The obtained results are :
iteration 1: neth size 25856860    VmallocUsed 108004 kB
iteration 2: neth size 25856860    VmallocUsed 108004 kB
iteration 3: neth size 38785290    VmallocUsed 158168 kB
iteration 6: neth size 25856860    VmallocUsed 108004 kB
iteration 9: neth size 58177935    VmallocUsed 235844 kB

This seems a lot for 0.15 million entries.
Are the 230Mo of Vmalloc'ed memory really used by the kernel ?

>What is your kernel and ipset versions?
>
> =20
>
ipset v2.2.2 Protocol version 2
iptables v1.3.2
Linux 2.6.13 i686




