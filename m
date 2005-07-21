From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 15:27:04 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<42DF85AE.1000400@gmx.co.uk>
	<Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>
	<Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 21 Jul 2005, Jan Engelhardt wrote:

> >local process -> routing -> OUTPUT chain -> routing -> POSTROUTING chain
> >
> >No problem with policy routing for the locally generated traffic.
>
> This sounds like a total overhead calculating the route twice.

The first one is required to fill out output device for the packet. The
second one is there to give chance to play with routing in OUTPUT.

This is traffic, generated locally, on the firewall.
You should run nothing on your firewall ;-)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

