From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: problems compiling kernel with patch-o-matic
Date: Tue, 27 Sep 2005 14:12:55 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0509271408590.13597@blackhole.kfki.hu>
References: <1127813736.10807.7.camel@biesas>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1127813736.10807.7.camel@biesas>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Justinas =?iso-8859-2?Q?Bed=BEinskas?= <justasb@patikimi.lt>
Cc: netfilter@lists.netfilter.org

On Tue, 27 Sep 2005, Justinas Bed=BEinskas wrote:

> I patch 2.6.13.2 vanilla kernel with patch-o-matic, and I have these
> errors:
>
> net/built-in.o: In function `init':
> ipt_set.c:(.init.text+0x1c7b): undefined reference to
> `ipt_register_match'
>
> Here is my config (nothing particular, just enabled IP_NF_SET..)
> http://biesas.adminas.net/~digis/config

Either define both IP_NF_MATCH/TARGET_SET and IP_NF_IPTABLES as static in
kernel, or module. Don't mix y/m.

I'll fix the dependecy so that there won't be possible to select
contradicting values.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

