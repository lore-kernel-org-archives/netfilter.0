From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: irc+iptables
Date: Sat, 2 Oct 2004 12:20:59 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410021220.59702.Alistair@nerdnet.ca>
References: <web-460534879@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-460534879@mail01.infosat.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On October 2, 2004 05:03 am, it clown wrote:
> Hi All,
>
> i am having some trouble in getting irc working through
> iptables and squid.When i put a forwarder in my iptables
> rule i can connect to irc but when i want to go through the
> proxy i have no luck.I have loaded the ip_nat_irc and
> tried:
>
> -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT
> --to-ports 3128.
>
> I have made the changes in squid to allown port 6667.
> Port 6667 is allowed OUT.

	Squid itself will not proxy IRC that I'm aware of.  When you say 
	'Forwarder' -- I take it you allow the connection out directly to the 
	IRC server with a rule in the FORWARD chain.  
	
	What (client) are you using to connect to IRC through the proxy?
	And --- for what it's worth why do you believe that Squid will 
	proxy the IRC connection?

	There are web based clients that can run through proxies, 
	however they are completely java based, and the connection
	is from the webserver end to the IRC server.  There is a java 
	applet that someone cooked up that has the initial connection
	from the webserver, but requires that the client can see the 
	internet without filtering as subsequent traffic is from the client 
	to the IRC server, across not well known ports, and this also 	
	has some other issues that make it unwise to use.
	
	Alistair Tonner
	RSO Technical Services, 
	HPUX Support

