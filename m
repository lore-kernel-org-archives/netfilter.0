From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Re: Hostname Routing
Date: Sat, 6 Sep 2003 22:31:52 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309062231.52710.hchs@ns.sympatico.ca>
References: <200309062053.43929.hchs@ns.sympatico.ca> <200309062216.09798.hchs@ns.sympatico.ca> <200309062129.58513.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309062129.58513.Alistair@nerdnet.ca>
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
To: Alistair@nerdnet.ca, netfilter@lists.netfilter.org

Ok, that's apache, how about my webmin, Postfix, CUCIPOP, MySQL and proftpd?

On Saturday 06 September 2003 10:29 pm, you wrote:
> Apache reverse proxy
>
> From Apache's website .....:
> A reverse proxy, by contrast, appears to the client just like an ordinary
> web server. No special configuration on the client is necessary. The client
> makes ordinary requests for content in the name-space of the reverse proxy.
> The reverse proxy then decides where to send those requests, and returns
> the content as if it was itself the origin.
>
> A typical usage of a reverse proxy is to provide Internet users access to a
> server that is behind a firewall. Reverse proxies can also be used to
> balance load among several back-end servers, or to provide caching for a
> slower back-end server. In addition, reverse proxies can be used simply to
> bring several servers into the same URL space.
>
> A reverse proxy is activated using the ProxyPass directive or the [P] flag
> to the RewriteRule directive. It is not necessary to turn ProxyRequests on
> in order to configure a reverse proxy.
>
> On September 6, 2003 09:16 pm, Cody Harris wrote:
> > It's 2 different computers. How will that work?
> >
> > On Saturday 06 September 2003 10:13 pm, you wrote:
> > > Not in IPTABLES.
> > > 	  Use apache.
> > >
> > > On September 6, 2003 07:53 pm, Cody Harris wrote:
> > > > Hello. I have researched your database on this subject (hostname
> > > > routing), but found nothing much. What i want is to take domain.com:*
> > > > and deliver that to the local machine (127.0.0.1), but i want
> > > > alt.domain.com:* to go to 192.0.0.2. How is this done?
> > > >
> > > > -Cody


