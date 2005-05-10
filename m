From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: squid + clamp-mss-to-pmtu
Date: Tue, 10 May 2005 17:12:58 -0400
Message-ID: <200505101712.58976.Alistair@nerdnet.ca>
References: <1115219353.2802.11.camel@localhost.localdomain>
	<200505050632.38221.Alistair@nerdnet.ca>
	<1115656458.2899.40.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115656458.2899.40.camel@localhost.localdomain>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On May 9, 2005 12:34 pm, jonathan wrote:
> Le jeudi 05 mai 2005 =E0 06:32 -0400, Alistair Tonner a =E9crit :
> > On May 4, 2005 11:09 am, jonathan wrote:
> > > Hi,
> > > I have a problem with squid and iptables.
> > > I have to use "TCPMSS --clamp-mss-to-pmtu" to adapt the mtu with the
>
> ISP
	<< BULK SNIPPAGE FOR BREVITY>>>

> >
> >       You are doing the clamp in both FORWARD and OUTPUT.  This is a
>
> good idea on
>
> > systems that require this function.  However since we don't know the
>
> flow on
	< more snippage >

> scheme of the network :
> clients (win2000 and linux)
> iptables+squid+advanced routing (same machine)
> 2 differents ISPs
>
> >       2) where are the systems initiating the failed connections
> located on that
> > network
> sorry, i don't understand your question ...
	I presume the 'clients' above

> >       3) where is squid on that network?
>
> squid is on the same server than the iptables firewall (between clients
> and the Internet)
>
> >       4) what are you doing to get connections to go through squid?
>
> Squid is configurated as transparent proxy, only the gateway IP address
> is configurated on the clients. (nothing on the browsers)
>
> >       5) what other rules are there?
>
> classical rules are configurated, NAT for the local network... and
> filtering rules for accessing typical ports (DROP INPUT AND FORWARD
> setting by default).
>
> routing configuration makes some marked packets going through ISP1 and
> other marked packet through ISP2.
>
	Okay --  now we're getting somewhere ... 'classical rules' is nice and=20
generic, but I will assume you mean that ESTABLISHED,RELATED are allowed on=
=20
the top of INPUT, OUTPUT, FORWARD chains, and that selective packets are=20
allowed through  ... i.e port 53 udp for DNS, and that port 80 and 443 from=
=20
the internal network to the world is redirected through squid.  This functi=
on=20
could be an issue -- specially if the redirect is in the wrong chain .. (II=
RC=20
should be in mangle PREROUTING and catch *all* traffic on those ports)

Where are you marking packets and under what rules? You mention that some g=
o=20
out isp1 and others out isp2.  Are you marking based on dns/mail/web/ftp/ o=
r=20
are you marking based on destination ip?

	I still think you want to a) dump all rules with=20
	iptables -L -n -v -x --line-numbers=20
	iptables -L -n -v -x --line-numbers -t nat
	iptables -L -n -v -x --line-numbers -t mangle,=20
	b) sanitize them by masking out real IP's
	c) send them here.

	Since you're likely using iproute2 your route tables wouldn't hurt=20
either .. .equally sanitized.



> >       6) what are the tcp_ecn settings on the firewall (I'd suspect
> ecn before
> > anything else since there are so many b0rken firewalls out there that
> don't understand it)

> the tcp_ecn is switch to "0".

> >       7) what is meant by inaccessible? what functions of squid might
> affect this?

> it means that mozilla browser write the state "waiting for..." until the
> timeout. Sometimes, it take a lot of time to display the website writing
> the state " transferring data from ...", and the website appears several
> minutes later or never appears !

	And what is squid saying about these connections?
>
> I've noticed that squid's log display "TCP_NEGATIVE_HIT/404" many times
> ( i suppose it's normal on some websites), but it seems like squid block
> on this "error" message, trying to get a 2xx HTTP return code or
> something like this. Is it possible ?

googled:
	TCP_NEGATIVE_HIT:
	The request was for a negatively-cached object. Negative-caching refers to=
=20
caching certain types of errors, such as "404 Not Found." The amount of tim=
e=20
these errors are cached is controlled with the negative_ttl configuration=20
parameter.

9.21 In the IP cache section, what's the difference between a hit, a negati=
ve=20
hit and a miss?=20
A HIT means that the document was found in the cache. A MISS, that it wasn'=
t=20
found in the cache. A negative hit means that it was found in the cache, bu=
t=20
it doesn't exist.


There are still quite a number of layers at which you might have issues.

	What happens when you drop squid out of the equation completely?
	What happens if you drop the TCPMSS clamps out of iptables?
	What happens if you drop the mark/route combo and use one/both ISPs?

>
> > > Is there a way to make it work?

	Certainly it can be made to work, ... I have here a large hammer, we'll ma=
ke=20
it work! *grin*
> > >
> > > thanks

	Good luck!

	Alistair Tonner

