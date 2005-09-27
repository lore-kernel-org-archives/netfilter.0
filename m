From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset memory usage
Date: Tue, 27 Sep 2005 08:55:35 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0509270851180.13597@blackhole.kfki.hu>
References: <4336442D.3090404@free.fr>
	<Pine.LNX.4.58.0509260852230.11331@blackhole.kfki.hu>
	<4337AE94.6020503@free.fr>
	<Pine.LNX.4.58.0509261020310.11331@blackhole.kfki.hu>
	<4338B609.60607@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4338B609.60607@free.fr>
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

On Tue, 27 Sep 2005, tedemo wrote:

> >When the hash size is about 20 million entries, that alone requires ~80MB
> >physical memory. If resizing is triggered, at least two times of that
> >amount of memory is needed temporarily.
> >
> The problem was comming from the --probes parameter which was set to 2 !
> Increasing its value to 10, reduced the hashsize up to a factor 100.

Thus you trade memory for speed: lookups in the set will be ten times
slower.

Still I don't get how does it come that the initial hash size was so huge.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

