From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to NOT redirect..
Date: Thu, 7 Nov 2002 21:56:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021107215631.YSCE3711.mta02-svc.ntlworld.com@there>
References: <3DCAB394.BE9050AF@acabtu.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DCAB394.BE9050AF@acabtu.com.mx>
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

On Thursday 07 November 2002 6:40 pm, Karina G=F3mez Salgado wrote:

> Hi, I'm using iptables for redirect requests to port 80 to port 3128 of
> Squid.
>
> But I have a problem, because some of the squid users have trouble
> accessing certain services through the proxy, i want to this users
> bypass the proxy when they try to reach certain sites.
>
> So How can i deny the redirect ?
>
> I've excluded certain users for their source address... making the
> redirection to the remaining ip addresses.
>
> But now i want to send all traffic to squid, all but certain
> destinations...
>
> Is there a way to do that ?

Yes.   Depending on how many destination address you do / don't want to=20
redirect, you could use any of the following three methods (there are almos=
t=20
certainly others as well):

1. Add a "-d a.b.c.d" to your DNAT rule so that only packets matching the=20
destination address get DNATted.   You then need one of these rules for eac=
h=20
destination you want the DNAT to apply to.

2. Add a "-d ! a.b.c.d" if you want to stop a single destination from being=
=20
DNATted.   You can only use one of these rules, otherwise two of them in=20
combination will have the same effect as not using "-d ! a.b.c.d" at all.

3. Use your existing DNAT rule in the PREROUTING nat chain, but insert some=
=20
rules before it which match a destination address using "-d a.b.c.d" and us=
e=20
the target "-j ACCEPT" so that these packets bypass the DNAT rule.

Basically suggestion 1 allows you to apply DNAT to as many destination=20
addresses as you like; suggestion 2 allows you to exclude one address or=20
address range from being DNATted; and suggestion 3 allows you to exclude as=
=20
many addresses or ranges as you want.

Somewhere in this you should be able to achieve your goal.

Antony.

--=20

Software development can be quick, high-quality, or low-cost.

The customer gets to pick any two out of three.

