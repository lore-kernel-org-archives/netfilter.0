From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: Wed, 11 Dec 2002 16:56:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212111656.18653.roy@karlsbakk.net>
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

# rm -rf linux-2.4.19 && tar xzf packed/linux-2.4.19.tar.gz && \
=09cd netfilter/patch-o-matic && cvs update -Pd -D now && \
=09./runme pending && ./runme extra

Testing... ahesp-static.patch NOT APPLIED (1 rejects out of 1 hunks)
Testing... conntrack+nat-helper-unregister.patch NOT APPLIED (6 rejects o=
ut of=20
6 hunks)
Testing... ip6tables-exthdr-bug.patch.ipv6 NOT APPLIED (6 rejects out of =
6=20
hunks)
etc
etc
etc

what am I doing wrong?
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


