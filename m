From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Hostname Routing
Date: Sat, 6 Sep 2003 21:29:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309062129.58513.Alistair@nerdnet.ca>
References: <200309062053.43929.hchs@ns.sympatico.ca> <200309062113.53962.Alistair@nerdnet.ca> <200309062216.09798.hchs@ns.sympatico.ca>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309062216.09798.hchs@ns.sympatico.ca>
Content-Disposition: inline
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
To: Cody Harris <hchs@ns.sympatico.ca>, netfilter@lists.netfilter.org


	Apache reverse proxy

=46rom Apache's website .....:
A reverse proxy, by contrast, appears to the client just like an ordinary w=
eb=20
server. No special configuration on the client is necessary. The client mak=
es=20
ordinary requests for content in the name-space of the reverse proxy. The=20
reverse proxy then decides where to send those requests, and returns the=20
content as if it was itself the origin.

A typical usage of a reverse proxy is to provide Internet users access to a=
=20
server that is behind a firewall. Reverse proxies can also be used to balan=
ce=20
load among several back-end servers, or to provide caching for a slower=20
back-end server. In addition, reverse proxies can be used simply to bring=20
several servers into the same URL space.

A reverse proxy is activated using the ProxyPass directive or the [P] flag =
to=20
the RewriteRule directive. It is not necessary to turn ProxyRequests on in=
=20
order to configure a reverse proxy.



On September 6, 2003 09:16 pm, Cody Harris wrote:
> It's 2 different computers. How will that work?
>
> On Saturday 06 September 2003 10:13 pm, you wrote:
> > Not in IPTABLES.
> > 	  Use apache.
> >
> > On September 6, 2003 07:53 pm, Cody Harris wrote:
> > > Hello. I have researched your database on this subject (hostname
> > > routing), but found nothing much. What i want is to take domain.com:*
> > > and deliver that to the local machine (127.0.0.1), but i want
> > > alt.domain.com:* to go to 192.0.0.2. How is this done?
> > >
> > > -Cody

=2D-=20

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
=09
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

