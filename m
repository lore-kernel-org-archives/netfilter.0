From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: Wed, 11 Dec 2002 17:09:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212111709.07108.roy@karlsbakk.net>
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

ok.
testing with 2.4.20:

# rm -rf linux-2.4.19 && \
=09tar xzf packed/linux-2.4.19.tar.gz && \
=09cd linux-2.4.19 && \
=09zcat ../packed/patch-2.4.20.gz | patch -p1 && \
=09cd ../netfilter/patch-o-matic && \
=09cvs update -Pd -D now && \
=09./runme pending
=2E..
Testing... ip_conntrack_protocol_destroy.patch NOT APPLIED (6 rejects out=
 of 6=20
hunks)
Testing... remove_no_version.patch NOT APPLIED (4 rejects out of 4 hunks)
Testing... newnat-udp-helper.patch NOT APPLIED (8 rejects out of 8 hunks)
=2E..
# patch -p1 < /usr/src/netfilter/patch-o-matic/extra/pptp-conntrack-nat.p=
atch
patching file include/linux/netfilter_ipv4/ip_conntrack_pptp.h
patching file include/linux/netfilter_ipv4/ip_conntrack_proto_gre.h
patching file include/linux/netfilter_ipv4/ip_conntrack_tuple.h
patching file include/linux/netfilter_ipv4/ip_nat_pptp.h
patching file net/ipv4/netfilter/ip_conntrack_core.c
Hunk #1 succeeded at 144 (offset 4 lines).
Hunk #3 succeeded at 941 with fuzz 2 (offset 75 lines).
Hunk #4 succeeded at 994 (offset 18 lines).
patching file net/ipv4/netfilter/ip_conntrack_pptp.c
patching file net/ipv4/netfilter/ip_conntrack_pptp_priv.h
patching file net/ipv4/netfilter/ip_conntrack_proto_gre.c
patching file net/ipv4/netfilter/ip_nat_core.c
Hunk #1 succeeded at 434 (offset 2 lines).
patching file net/ipv4/netfilter/ip_nat_pptp.c
patching file net/ipv4/netfilter/ip_nat_proto_gre.c
patching file net/ipv4/netfilter/Config.in
Hunk #1 succeeded at 77 (offset 9 lines).
patching file net/ipv4/netfilter/Makefile
Hunk #1 succeeded at 31 with fuzz 2.
#=20

=2E..but it's not there
how do I patch manually?
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


