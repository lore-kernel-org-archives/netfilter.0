From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: state table not working
Date: Mon, 21 Jun 2004 11:38:12 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406211129530.31871-100000@blackhole.kfki.hu>
References: <1087589791.40d34d9f4907f@securemail.starken.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087589791.40d34d9f4907f@securemail.starken.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Wittenberg <daniel-wittenberg@starken.com>
Cc: netfilter@lists.netfilter.org

On Fri, 18 Jun 2004, Daniel Wittenberg wrote:

> tcpdump I won't be able to get until it fails again, but it's
> 2.4.22-1.2188.nptl (did it with kernel-2.4.22-1.2174.nptl too).

First I'd make sure the server truly responds to the client request
*and* the packet is missed somehow by netfilter. That'd mean to run
tcpdump on the interface facing to the server so that the relevant packets
could be captured.

2.4.22 is pretty old. Is there any patches applied from patch-o-matic?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary




