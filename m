From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: A replacement for rp_filter with iptables (config help needed)
Date: Sat, 2 Jul 2005 00:10:29 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507020008330.20481@blackhole.kfki.hu>
References: <42C37413.3010504@networker.co.nz>
	<ab5428f705063022474352682b@mail.gmail.com>
	<1120254920.3544.2.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1120254920.3544.2.camel@localhost>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Fri, 1 Jul 2005, John A. Sullivan III wrote:

> In our default configuration for the ISCS network security management
> project (http://iscs.sourceforge.net), we generate rules to protect
> against spoofing from both the outside and the inside (to ensure we are
> good Internet citizens!).  Although the rules are automatically
> generated, they tend to look something like this:
>
> iptables -t mangle -A PREROUTING -i ! eth1 -s
> 2xx.xx.xxx.224/255.255.255.240 -j DROP

If you support 2.6.x kernels, I'd suggest to use the raw table instead:
thus the unnecessary load on conntrack could be avoided.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

