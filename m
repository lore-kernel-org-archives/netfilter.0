From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: packets traverse on proxy/firewall
Date: Tue, 11 Jan 2005 07:28:32 +0100
Message-ID: <20050111062911.5C4678EDCEB@smtp.sterenborg.info>
References: <a0f69e5050110213739cef613@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5050110213739cef613@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: 'netfilter' <netfilter@lists.netfilter.org>

netfilter-bounces@lists.netfilter.org wrote:
> hello masters im configuring firewal + proxy/cache server "squid" both
> on the same machine for our client. I gota few question regarding
> traverse of packet in this scenrio
> Proxy is transparent (interception)
> 
> 1) packets (port 80 requests) from client will traverse INPUT chain
> not FORWARD chain right? 

Yes, if :
- you do not allow a NATed connection from the clients (otherwise
clients that are not configured correctly will bypass Squid and use the
FORWARD chain),
- the client is configured to use the proxy or if 
- you redirect http traffic to port 80 to Squid in which case you don't
need to configure the client.

> 2) squid will fetch the content on behalf of the clients packet leave
> cache/firewall machine via OUTPUT chain right?

Yes.

> 3) which chains packets will travers when response coming back from
> Internet that is Internet ----> Cache --->Clients

(Not looking at connection states as you'd normally accept related and
established connections :)

Client asks http page from a webserver : it makes a connection to Squid
(INPUT).
Squid receives the request, decides to fetch the page and makes a
connection to the webserver (OUTPUT).
The webserver sends the requested page back to Squid (INPUT).
Squid sends the page back to the client (OUTPUT).

> Default policies for INPUT, OUTPUT , FORWAD will be DROP in which
> chains i have to do filtering in either case i-e
> Clients ----->Firewal/cache-----Internet and
> Internet --->Firewall/cache----->Clients


Gr,
Rob


