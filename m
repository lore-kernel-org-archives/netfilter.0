From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPSET issue ???
Date: Thu, 31 Mar 2005 13:15:06 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0503311313180.6208@blackhole.kfki.hu>
References: <4249A831.26741.68F66E4C@localhost>
	<424ADD66.23629.6DAE69D5@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <424ADD66.23629.6DAE69D5@localhost>
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
To: Jorge Agrelo <jagrelo@novadevices.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Wed, 30 Mar 2005, Jorge Agrelo wrote:

> Can I define the protocol in portmap set type, I means, Can I do
> that?
>
> ipset -N ports portmap
> ipset -A ports tcp/53
> ipset -A ports udp/53
> ipset -A ports tcp/25
> ipset -A ports tcp/110

No, you have to define two individual sets for the TCP and UDP ports.
It'd be way too expensive to add protocol and port support combined to the
portmap set.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

