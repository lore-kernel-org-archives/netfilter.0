From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: Wed, 11 Dec 2002 17:01:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212111701.39376.roy@karlsbakk.net>
References: <200212091226.23888.roy@karlsbakk.net> <200212111635.37659.roy@karlsbakk.net> <1039621206.20499.86.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039621206.20499.86.camel@tux>
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

On Wednesday 11 December 2002 16:40, Martin Josefsson wrote:
> On Wed, 2002-12-11 at 16:35, Roy Sigurd Karlsbakk wrote:
> > that's exactly what I'm doing. with kernel 2.4.19 and 2.4.20.
> > doesn't work
> > so.
> > can I just add the required patches manually without going for the wh=
ole
> > bunch?
> > if so - which ones do i need?
>
> You will at least need the newnat patch. (I hope the pptp patch doesn't
> depend on some other patch in there)
> But everything in the pending directory is recommended.
>
> then just apply the pptp patch.
>
> I can't see why this shouldn't work for you.
> You are sure you are using an up to date cvs checkout?

seems like newnat-udp-helper.patch=20
[root@fw linux]# patch -p1 <=20
=2E./netfilter/patch-o-matic/pending/newnat-udp-helper.patch
patching file include/linux/netfilter_ipv4/ip_nat_helper.h
Hunk #1 succeeded at 36 (offset -14 lines).
patching file net/ipv4/netfilter/ip_nat_helper.c
Hunk #1 FAILED at 8.
Hunk #2 succeeded at 18 (offset -7 lines).
Hunk #3 succeeded at 53 (offset -2 lines).
Hunk #4 succeeded at 75 (offset -7 lines).
Hunk #5 succeeded at 174 (offset -2 lines).
Hunk #6 succeeded at 203 with fuzz 2 (offset -7 lines).
1 out of 6 hunks FAILED -- saving rejects to file=20
net/ipv4/netfilter/ip_nat_helper.c.rej
patching file net/ipv4/netfilter/ip_nat_standalone.c
Hunk #1 FAILED at 358.
1 out of 1 hunk FAILED -- saving rejects to file=20
net/ipv4/netfilter/ip_nat_standalone.c.rej

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


