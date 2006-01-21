From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip forwarding: client has stalling problems
Date: Sat, 21 Jan 2006 17:06:28 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0601211658550.12909@blackhole.kfki.hu>
References: <200601201516.13638.saintiss@gmx.net>
	<Pine.LNX.4.58.0601201840060.12328@blackhole.kfki.hu>
	<200601211431.55350.saintiss@gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601211431.55350.saintiss@gmx.net>
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
To: SainTiss <saintiss@gmx.net>
Cc: netfilter@lists.netfilter.org

On Sat, 21 Jan 2006, SainTiss wrote:

> However, after I did this both on server and client, nothing changed... Also,
> using 2.6.8 on the server doesn't help...

That was a guess based on the available info.

As you are possibly behind an *DSL line, there might be that someone drops
ICMP fragmentation needed packets. Read TCPMSS target in the iptables
manpage and add the appropriate rule(s) to the firewall.

Another possibility is an ECN hole somewhere between you and the
destinations: try disabling TCP ECN on the client and give a try.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

