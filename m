From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Re : IPSET iptree problem
Date: Mon, 27 Aug 2007 18:40:36 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0708271837440.6383@blackhole.kfki.hu>
References: <E1IPe95-0001aO-B9@welnowiec.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1IPe95-0001aO-B9@welnowiec.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: nofast@welnowiec.net
Cc: netfilter@lists.netfilter.org

On Mon, 27 Aug 2007, nofast@welnowiec.net wrote:

> I preformed two tests, one shortly after boot and another few minutes later.
> The results are different.
> I hope this will help you.

It did helped: please give a try to the new version as
http://ipset.netfilter.org/ipset-2.6.23-rc3.patch2.

Please report that it indeed solves the false iptree test results.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary

