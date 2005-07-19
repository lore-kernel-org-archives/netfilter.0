From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPset ports question.
Date: Tue, 19 Jul 2005 10:42:55 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507191037060.22686@blackhole.kfki.hu>
References: <42DBF833.9020505@kitchenandassociates.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DBF833.9020505@kitchenandassociates.com>
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
To: Rob Carlson <rcarlson@kitchenandassociates.com>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hi Rob,

On Mon, 18 Jul 2005, Rob Carlson wrote:

> Is there a way to bind an IPSet hash to a port,
> and if so, what is the syntax?

The syntax is the same in all cases:

ipset -B <setname> <elem> -b <name of set to bind elem from setname>

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

