From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: Wed, 11 Dec 2002 17:54:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212111754.46937.roy@karlsbakk.net>
References: <200212091226.23888.roy@karlsbakk.net> <200212111701.39376.roy@karlsbakk.net> <1039624902.20562.91.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039624902.20562.91.camel@tux>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Wednesday 11 December 2002 17:41, Martin Josefsson wrote:
> On Wed, 2002-12-11 at 17:01, Roy Sigurd Karlsbakk wrote:
> > seems like newnat-udp-helper.patch
> > [root@fw linux]# patch -p1 <
> > ../netfilter/patch-o-matic/pending/newnat-udp-helper.patch
> > patching file include/linux/netfilter_ipv4/ip_nat_helper.h
> > Hunk #1 succeeded at 36 (offset -14 lines).
> > patching file net/ipv4/netfilter/ip_nat_helper.c
> > Hunk #1 FAILED at 8.
> > Hunk #2 succeeded at 18 (offset -7 lines).
> > Hunk #3 succeeded at 53 (offset -2 lines).
> > Hunk #4 succeeded at 75 (offset -7 lines).
> > Hunk #5 succeeded at 174 (offset -2 lines).
> > Hunk #6 succeeded at 203 with fuzz 2 (offset -7 lines).
> > 1 out of 6 hunks FAILED -- saving rejects to file
> > net/ipv4/netfilter/ip_nat_helper.c.rej
> > patching file net/ipv4/netfilter/ip_nat_standalone.c
> > Hunk #1 FAILED at 358.
> > 1 out of 1 hunk FAILED -- saving rejects to file
> > net/ipv4/netfilter/ip_nat_standalone.c.rej
>
> This patch applies fine here after applying the other submitted patches
> first.

then what is wrong?????????? The kernels I've tried patching, is download=
ed=20
from kernel.org, and everything else works, except netfilter/p-o-m
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


