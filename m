From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: redirect squid to other proxy(windows) hearing in port 80
Date: Fri, 21 Nov 2003 16:43:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311211643.hALGhD725640@onyx.rockstone.co.uk>
References: <20031121132405.56143.qmail@web40812.mail.yahoo.com> <200311211411.hALEBN725115@onyx.rockstone.co.uk> <00b901c3b04b$3d88ff10$6500a8c0@ProxY>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00b901c3b04b$3d88ff10$6500a8c0@ProxY>
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
To: netfilter@lists.netfilter.org

On Friday 21 November 2003 4:19 pm, Guillermo wrote:

> hello!!
> i need help with iptables and proxy squid...
> i have a linux-proxy for tests and it is connected in the internal net
> (LAN), but i need that this squid pass through a win2000 proxy that is
> hearing in port 80 for all request....(view the picture)
>
> computers ----->squid-linux(hear port 3128)---->win2000-proxy(hear port
> 80)----->internet (https-DNS)
>
> mi problem is that apparently the DNS petitions (port 53) not arrives at
> the DNS server.

DNS from which machine/s?   The clients, or the proxy/ies?   (In a proxy 
setup the clients will use DNS because they always do, and the proxy will use 
DNS because it needs to contact the real server).

> how i must setup IPTABLES for redirect this packets DNS (TCP and UDP) at
> the win2000 proxy???

It's not clear to me from the above diagram which computer is running 
netfilter (iptables).   Tell us this and we can suggest how to redirect your 
DNS requests (if indeed that is the problem).

> or i must setup SQUID for this???

Indeed - I would actually recommend that you chain the proxies together using 
the squid configuration file, so that they know how they're interconnected.

> or i must instal a BIND DNS in my Linux box??

That would not be a bad idea at all.   If you're running a caching proxy, it 
can benefit quite a bit from having a (very) local DNS server as well.

> PD: sorry for my english.... i dont speak english very well..

No problem at all.

Antony.

-- 

Windows: just another pane in the glass.

                                                     Please reply to the list;
                                                           please don't CC me.

