From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: Mon, 9 Dec 2002 15:58:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212091558.22457.roy@karlsbakk.net>
References: <200212091226.23888.roy@karlsbakk.net> <200212091512.10109.roy@karlsbakk.net> <1039444945.28074.43.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039444945.28074.43.camel@tux>
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

On Monday 09 December 2002 15:42, Martin Josefsson wrote:
> On Mon, 2002-12-09 at 15:12, Roy Sigurd Karlsbakk wrote:
> > > And patch-o-matic from cvs works with at least 2.4.19 (2.4.18 and .=
20
> > > should work aswell)
> >
> > then what's this?
> >
> > In file included from
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:64,
> >                  from extensions/libipt_conntrack.c:12:
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:6:2:
> > #error Only in kernel.
> > In file included from
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:65,
> >                  from extensions/libipt_conntrack.c:12:
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_rsh.h:16:2:
> > #error Only in kernel.
> > make: *** [extensions/libipt_conntrack_sh.o] Error 1
>
> You said "the only one I've managed to patch-o-matic" which means the
> only one you've managed to patch. What you are saying now is that you
> indeed did manage to patch your kernel. Please use more accurate wordin=
g
> in reports like these.

the only one I have been able to patch up with the patch-o-matic pptp pat=
ch,=20
was 2.4.18.

> And you are NOT using patch-o-matic from cvs, I know this because these
> problems were fixed some time ago (and doublechecking the files I see
> that they were indeed fixed). The error you are seeing is _impossible_
> with patch-o-matic from cvs (the #error lines doesn't even exist)

I've tried all the ones I can find.
When trying to apply the pptp-conntrack-nat.patch, I get errors applying =
it.=20
Do I need to hand patch this thing? I've tried with 2.4.{18,19,20}

roy



Testing... pptp-conntrack-nat.patch NOT APPLIED ( 8 missing files)
The extra/pptp-conntrack-nat patch:
   Author: Harald Welte <laforge@gnumonks.org>
   Status: Beta

   This adds CONFIG_IP_NF_PPTP:
   Connection tracking and NAT support for PPTP.

   Note that this code currently has limitations
   - can only NAT connections from PNS to PAC
   - doesnt' support multiple calls within one session

-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch extra/pptp-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
   Placed new Makefile line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
TEST FAILED: patch NOT applied.


--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


