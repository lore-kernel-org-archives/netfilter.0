From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset issue
Date: Tue, 7 Dec 2004 08:22:26 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0412070821290.7834@blackhole.kfki.hu>
References: <294d5daa0412061327651c1648@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <294d5daa0412061327651c1648@mail.gmail.com>
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
To: Mark Moseley <moseleymark@gmail.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Mon, 6 Dec 2004, Mark Moseley wrote:

> I decided to play with ipset (2.0), but I seem to be running into an
> issue with creating rules. I wonder if I'm missing something silly or
> not.
>
> When I issue the command:
>
> ipset -N foo iphash --resize 0   (straight from the Tips page)
>
> I get the error:
>
> ipset v2.0: Error from kernel: Protocol not available

You have to load in at least the ip_set kernel module.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

