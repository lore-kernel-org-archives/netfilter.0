From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Problems with the ip_nat_h323
Date: Thu, 25 Aug 2005 09:07:37 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0508250900430.28804@blackhole.kfki.hu>
References: <20050824151926.E73AE5C144@smtp1.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050824151926.E73AE5C144@smtp1.kfki.hu>
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
To: Andrew Cant <acant@logisense.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Wed, 24 Aug 2005, Andrew Cant wrote:

> I am attempting to get the H323 nat module working. Specifically I want to
> pass MGCP VoIP traffic, not H323, but I believe that the H323 module should
> do the job.
>
> I am using a 2.4.28 kernel, with iptables 1.2.9, and patch-o-matic-20031219.
> I am also using the transparent proxy patches(TPROXY), and serveral other
> NAT helpers(ftp, tftp, pptp, proto_gre).

That's a too old kernel and too old pom version. You should use kernel
version 2.6.11 or above and the H.323 helper from a recent pom-ng release.

The helper had been completely rewritten by Max Kellermann for the 2.6
tree - the old version you use works in the most simple cases only.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

