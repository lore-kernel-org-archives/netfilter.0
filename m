From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: Mon, 9 Dec 2002 15:12:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212091512.10109.roy@karlsbakk.net>
References: <200212091226.23888.roy@karlsbakk.net> <1039436746.25961.15.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039436746.25961.15.camel@tux>
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

On Monday 09 December 2002 13:25, Martin Josefsson wrote:
> On Mon, 2002-12-09 at 12:26, Roy Sigurd Karlsbakk wrote:
> > hi
> >
> > I've kept trying now. many times, to do NAT+MASQ+PPTP, but as soon as=
 I
> > compile 2.4.18 (the only one I've managed to patch-o-matic) and boot =
it,
> > it refuses to -j MASQUERADE. (invalid argument). Are anyone running t=
his?
>
> recompile userspace iptables against that kernel.
>
> And patch-o-matic from cvs works with at least 2.4.19 (2.4.18 and .20
> should work aswell)

then what's this?

In file included from=20
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:64,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:6:2: #err=
or=20
Only in kernel.
In file included from=20
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h:65,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_rsh.h:16:2: #err=
or=20
Only in kernel.
make: *** [extensions/libipt_conntrack_sh.o] Error 1


--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


