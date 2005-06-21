From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 15:10:04 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0506211507280.3687@blackhole.kfki.hu>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201159.46123.rob0@gmx.co.uk>
	<49bf7d70506201020643ab165@mail.gmail.com>
	<200506201329.19701.rob0@gmx.co.uk>
	<49bf7d7050620123646910d40@mail.gmail.com>
	<Pine.LNX.4.61.0506211455340.9102@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0506211455340.9102@yvahk01.tjqt.qr>
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
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

On Tue, 21 Jun 2005, Jan Engelhardt wrote:

> >> > using tarpit instead of just dropping the connections.
> >> Whatever. Without connection tracking you might as well use ipchains.
> >the tarpit howto does say to turn connection tracking off.
>
> No, it does not! To quote:
>
>   You probably don't want the conntrack module loaded while you are using
>   TARPIT, or you will be using resources per connection.
>
> Which is not the same as "does not work with conntrack".

The overhead of TARPIT created in conntrack can completely be avoided by
using NOTRACK and TARPIT targets together.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

