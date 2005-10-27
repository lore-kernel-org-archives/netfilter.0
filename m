From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPset_iptree with timeouts on Fedora Core 4
Date: Thu, 27 Oct 2005 21:34:10 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0510272129210.2649@blackhole.kfki.hu>
References: <436041CF.7090009@tfc.cz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <436041CF.7090009@tfc.cz>
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
To: Radek Hladik <rhladik@tfc.cz>
Cc: netfilter@lists.netfilter.org

On Thu, 27 Oct 2005, Radek Hladik wrote:

> I tried:
> ipset -N testip iptree
> ipset -A testip 1.2.3.4%30
> The second command produced this error in system log:
>
> Oct 27 02:42:58 radek kernel: Debug: sleeping function called from
> invalid context at mm/slab.c:2126

Sigh. It seems I was capable to commit all possible stupid mistakes in
iptree. Your fix is correct, expect a new release tomorrow.

> But iptree still had not members removed after specified timeout. I have
> "discovered" (after reading the source code)  that the iptree set need
> to have set the default timeout value (with --timeout option). Is this
> true or am I doing something wrong?

That is a feature. Originally iptree did not support the timeout of the
entries. In order to keep backward compatibility, the default (i.e no
timeout) is preserved.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

