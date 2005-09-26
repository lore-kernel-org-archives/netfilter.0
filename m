From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset memory usage
Date: Mon, 26 Sep 2005 11:28:37 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0509261020310.11331@blackhole.kfki.hu>
References: <4336442D.3090404@free.fr>
	<Pine.LNX.4.58.0509260852230.11331@blackhole.kfki.hu>
	<4337AE94.6020503@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4337AE94.6020503@free.fr>
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

Hi,

On Mon, 26 Sep 2005, tedemo wrote:

> >Check out the real size of the hashes by searching the kernel log:0
> >"rehashing of set <foo> triggered: hashsize grows from <n> to <m>".

> The size for the nethash, reported in the log is arround 20mo the first
> time it I run :
> ipset --restore < ip.sets

When the hash size is about 20 million entries, that alone requires ~80MB
physical memory. If resizing is triggered, at least two times of that
amount of memory is needed temporarily.

> I deleted each set (using ipset -X on each other) and the recreated them,
> the size of the nethash went to 40Mo
>
> A few reloads later its size is 90Mo.

Please write it exactly what you do and what happens. Do you create, fill
up and delete the *same* sets with exactly the *same* content, in a loop?

> NB: The set definition file has been created manualy to avoid hundred
> thousand calls to "ipset -A"
> (i.e. without calling ipset --save). Can this cause troubles ?

No.

What is your kernel and ipset versions?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

