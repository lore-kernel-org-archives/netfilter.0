From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Possibility to lock iptables rules.
Date: Thu, 21 Apr 2005 15:53:54 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0504211545550.27079@blackhole.kfki.hu>
References: <1113994155.31280.29.camel@localhost.localdomain>
	<426685FB.4040607@riverviewtech.net> <4266C1E7.8020103@fugmann.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4266C1E7.8020103@fugmann.net>
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
To: Anders Peter Fugmann <afu@fugmann.net>
Cc: netfilter@lists.netfilter.org, "Taylor, Grant" <gtaylor@riverviewtech.net>

On Wed, 20 Apr 2005, Anders Peter Fugmann wrote:

> Well written, and your arguments are truly valid. I still see a
> practical usage though, as it will hold back the big mass of novice
> script kiddies. The lock bit would harden the system, but not make it
> unbreakable (there is no such thing as an unbreakable system, that is
> connected on the net.)

You can use any of the MAC systems of Linux and (when properly configured)
then even root won't be able to change the firewall/network settings of
your machine. Some of such systems in no particular order: SELinux, LIDS,
grsecurity, RSBAC.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

