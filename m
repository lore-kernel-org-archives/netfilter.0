From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Hostname Routing --
Date: Sun, 7 Sep 2003 17:30:55 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309071730.55970.Alistair@nerdnet.ca>
References: <200309062053.43929.hchs@ns.sympatico.ca> <200309062129.58513.Alistair@nerdnet.ca> <200309062231.52710.hchs@ns.sympatico.ca>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309062231.52710.hchs@ns.sympatico.ca>
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



	My point is that if you intend to both accept and forward connections 
	of a certain type at your firewall, you must use a proxy of some sort.
	
	If your local firewall is not accepting any connections of a specific type, 
	you can use iptables forwarding to make the connections go 
	where you want, i.e., --dport xxx -j DNAT (to ip of actual host) 
	+ the forward rule to handle passing the prerouting mangled
	DNAT packet through the firewall, however this will still not be
	hostname based., only connection based.
	
	For hostname based routing, again, in any connection type
	you need to use a proxy or some sort of gateway server, 
	that handles the reconnection to the inside servers.

	Look for (protocol) proxy and (protocol) gateway in google.

	I've heard of proxy servers for ftp, but am not personally aware 
	of them, and I believe that squid can do this, although I'm not
	100% sure.... For pop connections I know that there is a method
	of proxying through a gateway server ... although not something
	I've personally put into use.  As far as I know, webmin should be 
	capable of being a proxy for inside webmins (it is after all essentially
	a webserver, with some unusual priviledges.), Alternatively, you could give
	each internal host webmin a different port, and route based on the connection
	to the port, based on the DNAT stuff above. For SMTP, you need 
	to configure your outside server to accept for internal servers and 
	forward to them ... that's presumably what its on the outside for.
	
	I have seen an installation where sql connections were being routed 
	around a firewall, 	but required a separate server that handled 
	connections by SID not hostname, so I'm no help there.... 
	although I was given to understand that the server could also 
	route the conection to the correct DB server based on *originating*
	hostname, not destination hostname.

	The reason putting the alt.domain.com address in /etc/hosts 
	didn't work, is because the packet arrived with your outside address
	on it and there was nothing that looked at the packet and routed it
	based on the hostname in the packet, and the entry in /etc/hosts .. 
	that is what a proxy (for that protocol) could do.

	Of course, to be utterly ridiculous one could write a string match
	for each protocol that could read the initial connection packet, 
	and attempt to parse a hostname out of that packet, and manage
	the connection that way, but that way lies ..... 
	(comes to mind a quote)

	
On September 6, 2003 09:31 pm, Cody Harris wrote:
> Ok, that's apache, how about my webmin, Postfix, CUCIPOP, MySQL and
> proftpd?
>
> On Saturday 06 September 2003 10:29 pm, you wrote:
> > Apache reverse proxy
> >
> > From Apache's website .....:
> > A reverse proxy, by contrast, appears to the client just like an ordinary
> > web server. No special configuration on the client is necessary. The
> > client makes ordinary requests for content in the name-space of the
> > reverse proxy. The reverse proxy then decides where to send those
> > requests, and returns the content as if it was itself the origin.
> >
> > A typical usage of a reverse proxy is to provide Internet users access to
> > a server that is behind a firewall. Reverse proxies can also be used to
> > balance load among several back-end servers, or to provide caching for a
> > slower back-end server. In addition, reverse proxies can be used simply
> > to bring several servers into the same URL space.
> >
> > A reverse proxy is activated using the ProxyPass directive or the [P]
> > flag to the RewriteRule directive. It is not necessary to turn
> > ProxyRequests on in order to configure a reverse proxy.
> >
> > On September 6, 2003 09:16 pm, Cody Harris wrote:
> > > It's 2 different computers. How will that work?
> > >
> > > On Saturday 06 September 2003 10:13 pm, you wrote:
> > > > Not in IPTABLES.
> > > > 	  Use apache.
> > > >
> > > > On September 6, 2003 07:53 pm, Cody Harris wrote:
> > > > > Hello. I have researched your database on this subject (hostname
> > > > > routing), but found nothing much. What i want is to take
> > > > > domain.com:* and deliver that to the local machine (127.0.0.1), but
> > > > > i want alt.domain.com:* to go to 192.0.0.2. How is this done?
> > > > >
> > > > > -Cody

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

