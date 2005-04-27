From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Connection problems on large high speed connections.
Date: Wed, 27 Apr 2005 15:58:45 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0504271554450.5216@blackhole.kfki.hu>
References: <1114555837.14247.15.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504270854230.4795@blackhole.kfki.hu>
	<1114585852.15246.11.camel@zepto.barmen.nu>
	<1114586414.15242.14.camel@zepto.barmen.nu>
	<1114608987.15240.49.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504271542470.5216@blackhole.kfki.hu>
	<1114609896.15244.54.camel@zepto.barmen.nu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1114609896.15244.54.camel@zepto.barmen.nu>
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

> > Then there were packets flagged as INVALID by conntrack, which are of
> > course not matched by the states above. The reject line however matched
> > them and dutifully generated the RST segment, which tore down the
> > connection.
>
> But what is the reason for the difference in behaviour for -j REJECT vs
> -j RECECT --reject-with tcp-reset? Why does one kill the connection and
> not the other?

A "-j RECECT --reject-with tcp-reset" generates a TCP RST, which always
kills the connection. A "-j RECECT" generates an ICMP error message, which
- depending on the OS which receives the ICMP packet - might terminate a
TCP connection or might not. That is the very reason why "--reject-with
tcp-reset" is required.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

