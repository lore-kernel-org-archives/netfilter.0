From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is "no route to host" fake possible?
Date: Fri, 25 Jun 2004 12:19:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406251219.41335.Antony@Soft-Solutions.co.uk>
References: <00c601c45aa1$74751080$3b7819c4@PHAKE>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00c601c45aa1$74751080$3b7819c4@PHAKE>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Friday 25 June 2004 11:44 am, Cilli=E8 Burger wrote:

> >Hello,
> >
> >I know the rules REJECT, DENY or DROP, but is it possible to return to
> >the client the error message "no route to host" ?
> >
> >I saw that it's possible to configure this on CISCO routers, and I wou=
ld
> >lke to know it it's possible?

> yes, it is
>
> # man route
>
> reject      install a blocking route, which will force a  route
>               lookup  to  fail.  This is for example used to mask
>               out networks before using the default route.   This
>               is NOT for firewalling.
>
> route add -host 192.168.1.2 reject
>
> # ping 192.168.1.2
> connect: Network is unreachable
>
> for more info check the route man page

This is fine, so long as you want to return this message for *all* packet=
s=20
addressed to the host.   Doing it with netfilter has the advantage that y=
ou=20
can specify selected sources for this reject to be returned to.

The target:
-j REJECT --reject-with icmp-net-unreachable

should result in the same response as shown above.

Regards,

Antony.

--=20
GIT/E d- s+:--(-) a+ C++++$(---) UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N=
(-)=20
o? w--(---) O !M V+++(--) !PS !PE Y+ PGP+> t- !tv@ b+++ DI++ D--- e+++(*)=
 h++=20
5? !X- !R K--? G-

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


