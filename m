From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] Release of iptables-1.3.6
Date: Fri, 29 Sep 2006 08:59:16 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0609290849580.10141@blackhole.kfki.hu>
References: <20060928172109.GN13764@sunbeam.de.gnumonks.org>
	<451C0BBA.9070509@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451C0BBA.9070509@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>

On Thu, 28 Sep 2006, Pascal Hambourg wrote:

> > New features since 1.3.5:
> >
> > - Support multiple matches of the same type within a single rule
>
> Wow. What does this mean exactly ? Does it mean that one can set
> multiple -p, -s, -d, --dport and so on in a single rule ?

No - and as the conditons in a rule are ANDed, it wouldn't make much
sense. But from now on you can set multiple match extensions of the same
type in a single rule, e.g:

.. -m condition --condition foo -m condition --condition bar ...
.. -m set --set servers dst -m set --set services dst ...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

