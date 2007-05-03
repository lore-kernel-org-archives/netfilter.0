From: Rayed Alrashed <rayed@saudi.net.sa>
Subject: Re: Forking inside netfilter queue
Date: Thu, 03 May 2007 22:20:55 +0300
Message-ID: <463A3617.7050702@saudi.net.sa>
References: <4635EC8E.4090905@saudi.net.sa>
	<002901c78d97$4f60f1c0$0a00080a@rhea>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002901c78d97$4f60f1c0$0a00080a@rhea>
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


> Unless there are a real lot of these addresses that are permitted, and 
> they change rapidly, then I'd expect it would be a better design to 
> get all the valid URIs from the MySQL query on init and store them in 
> a linked list.
I am afraid this not an option, because my final goal is to integrate my 
application with external vendor database using the vendor own API.


> Also, people already do this type of thing with an HTTP proxy like 
> squid before the HTTPd.

I've tested HTTP proxy before, but the overhead is very big, and I 
couldn't get the proxy to handle high loads.

Another problem with proxy servers is using the proxy own IP for 
outgoing request, unfortunately using the same IP for many requests 
trigger many IDSes to block the proxy IP.

What I am trying to do is a light weight HTTP filter, by searching for 
HTTP requests in packet traveling on the wire, with minimal TCP 
reassembly to find HTTP requests spanning more than one packet.

