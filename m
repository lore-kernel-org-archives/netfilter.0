From: Karina <kgs@acabtu.com.mx>
Subject: Re: How to NOT redirect..
Date: Thu, 07 Nov 2002 19:19:24 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DCB111C.E168955C@acabtu.com.mx>
References: <3DCAB394.BE9050AF@acabtu.com.mx> <20021107215631.YSCE3711.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Thank's a lot...

Now my problem is solved, and it was so easy!!

Regards,

Karina


Antony Stone wrote:

> On Thursday 07 November 2002 6:40 pm, Karina G=F3mez Salgado wrote:
>
> > Hi, I'm using iptables for redirect requests to port 80 to port 3128 =
of
> > Squid.
> >
> > But I have a problem, because some of the squid users have trouble
> > accessing certain services through the proxy, i want to this users
> > bypass the proxy when they try to reach certain sites.
> >
> > So How can i deny the redirect ?
> >
> > I've excluded certain users for their source address... making the
> > redirection to the remaining ip addresses.
> >
> > But now i want to send all traffic to squid, all but certain
> > destinations...
> >
> > Is there a way to do that ?
>
> Yes.   Depending on how many destination address you do / don't want to
> redirect, you could use any of the following three methods (there are a=
lmost
> certainly others as well):
>
> 1. Add a "-d a.b.c.d" to your DNAT rule so that only packets matching t=
he
> destination address get DNATted.   You then need one of these rules for=
 each
> destination you want the DNAT to apply to.
>
> 2. Add a "-d ! a.b.c.d" if you want to stop a single destination from b=
eing
> DNATted.   You can only use one of these rules, otherwise two of them i=
n
> combination will have the same effect as not using "-d ! a.b.c.d" at al=
l.
>
> 3. Use your existing DNAT rule in the PREROUTING nat chain, but insert =
some
> rules before it which match a destination address using "-d a.b.c.d" an=
d use
> the target "-j ACCEPT" so that these packets bypass the DNAT rule.
>
> Basically suggestion 1 allows you to apply DNAT to as many destination
> addresses as you like; suggestion 2 allows you to exclude one address o=
r
> address range from being DNATted; and suggestion 3 allows you to exclud=
e as
> many addresses or ranges as you want.
>
> Somewhere in this you should be able to achieve your goal.
>
> Antony.
>
> --
>
> Software development can be quick, high-quality, or low-cost.
>
> The customer gets to pick any two out of three.

--
LSCI Karina G=F3mez Salgado
mailto:kgs@acabtu.com.mx
Systems Administrator & Web Projects Manager

BTU Comunicaci=F3n, S.A. de C.V.



