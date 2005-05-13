From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: NAT performance
Date: Fri, 13 May 2005 11:22:08 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0505131038510.2119@blackhole.kfki.hu>
References: <80E06785-6636-4481-ABD1-6C6C28D52629@adelux.fr>
	<4283EEB7.7010207@riverviewtech.net>
	<02A7CEB4-AD81-4D92-BD1A-A2A5EB00AFF9@adelux.fr>
	<Pine.LNX.4.60.0505130423320.5558@darkstar.sysinfo.com>
	<A1364254-5C3D-48E2-A68C-2445EBA486D1@adelux.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A1364254-5C3D-48E2-A68C-2445EBA486D1@adelux.fr>
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
To: Christophe SUIRE <christophe.suire@adelux.fr>
Cc: netfilter@lists.netfilter.org

On Fri, 13 May 2005, Christophe SUIRE wrote:

> This not a problem with the network card, because when i do the test
> with only firewall routing i have a total bandwidth used near to
> 500Mbit/s.
> But when i add an SNAT translation for each network (10) the total
> bandwidth used is near 170Mbit/s.
> So why this important difference without an with NAT ??

NAT *is* expensive. Have a look at the paper on netfilter performance
tests and comparisons at http://people.netfilter.org/kadlec/nftest.pdf

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

