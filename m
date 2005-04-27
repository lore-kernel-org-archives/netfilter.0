From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Connection problems on large high speed connections.
Date: Wed, 27 Apr 2005 09:00:32 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0504270854230.4795@blackhole.kfki.hu>
References: <1114555837.14247.15.camel@zepto.barmen.nu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1114555837.14247.15.camel@zepto.barmen.nu>
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
To: "Stian B. Barmen" <stian@barmen.nu>
Cc: netfilter@lists.netfilter.org

On Wed, 27 Apr 2005, Stian B. Barmen wrote:

> My firewall has started to drop large connections, like downloading a
> >1MB file over FTP or HTTP typically fails. But, it seems that the speed
> needs to be over 4-500 K/s before the error occurs.
[...]
> The only thing I can think of is that I not very long ago upgraded from
> a 2.4 kernel to a 2.6 kernel. The last two kernels I tried was 2.6.11
> and now the 2.6.12-rc3, both produces the same error.

NAT sequence number adjustment is broken since 2.6.11. I believe
the patch was submitted in after 2.6.12-rc3 had been released.

But it's an FTP/IRC/etc data channel related bug. It has nothing to do
with plain HTTP. Do you mean HTTP transfer is also broken or it's just an
FTP transfer initiated by a web client?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

