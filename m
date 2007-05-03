From: Rayed Alrashed <rayed@saudi.net.sa>
Subject: Re: Forking inside netfilter queue
Date: Thu, 03 May 2007 21:39:48 +0300
Message-ID: <463A2C74.90401@saudi.net.sa>
References: <4635EC8E.4090905@saudi.net.sa>
	<002901c78d97$4f60f1c0$0a00080a@rhea>
	<463A3617.7050702@saudi.net.sa>
	<13098.213.106.233.77.1178214500.squirrel@xeentech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <13098.213.106.233.77.1178214500.squirrel@xeentech.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex <alex@hackgod.org>
Cc: netfilter@lists.netfilter.org

>
> If you were to do this with the queue lib, then you'd ataualy have to
> either let the client establish the connection OR fake that the connection
> was established, before you get the HTTP request is sent to rule on.
>   

Of course! I want my application to be totally transparent from the 
client. The client will use regular browser without any proxy, and I 
won't inspect TCP handshaking packets, only packets that looks like HTTP 
request.

> Also keep in mind that the servers/client might want to do a Keep-alive or
> long lived HTTP session, with multiple HTTP requests. Keeping track of
> that, from an NFNetlink/Queue based interface would be hecktic.
>   
According to my tests and observations, most HTTP requests reside in a 
single packet, for request that span more than one request, I'll start 
tracking the session when I get a packet that looks like the beginning 
of HTTP request, and stop when I get "Host" header.

For example:
3rd Packet: "GET /ver_long_uri\r\n"
It looks like the start of HTTP request, Start tracking.

4th Packet: "Host: ad-ware.domain\r\n\r\n"
I have URI+HOST, Stop tracking.

In this case I won't have to keep track of the whole TCP session only 
what I need to get URI and HOST.

This will allow me to process more packets with minimal session tracking.




