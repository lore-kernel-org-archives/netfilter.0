From: Ian Batterbee <ian.batterbee@aut.ac.nz>
Subject: Re: netfilter digest, Vol 1 #570 - 12 msgs
Date: Sun, 02 Feb 2003 13:20:12 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E3C643C.4090008@aut.ac.nz>
References: <20030201232700.1610.60138.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030201232700.1610.60138.Mailman@kashyyyk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org, Robert Vazan <robertvazan@host.sk>

>Date: Sat, 1 Feb 2003 17:00:41 +0100
>To: netfilter@lists.netfilter.org
>Subject: How does squid know original destination?
>From: Robert Vazan <robertvazan@host.sk>
>
>If I forward intranet -> internet connections to a proxy program, how do
>I discover from within my proxy what was original internet destination?
>My manpage for getsockopt says that NAT options aren't documented yet,
>so I guess getsockopt is used for this? If so, where can I find some
>documentation? Programming is one side, but how does this look on
>network? Does it work only locally or is there some TCP option attached 
>to SYN packet? Is the information transmitted by other means, like
>separate connection for accounting data? I know that squid does it, but
>I don't know how. I couldn't find a single resource for programmers on
>netfiler website, maybe it is impossible and I just overestimated squid?

In short, in exactly the same way it would know if you were using squid as a specifically defined proxy, and not as a transparent one.

The HTTP request that your broswer makes looks something like this (I've removed a few lines that aren't relevant here - like Accept-Encoding etc etc):

GET / HTTP/1.1
Host: www.google.co.nz
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.2b) Gecko/20021016
Keep-Alive: 300
Connection: keep-alive

The important line here is the "Host:" line, ie, the browser puts the name of the site it wants to connect to as part of the HTTP request. The actual IP address that your browser sends the request to is largely irrelevant, as long as there is a host there that can service your browser's request.

There is an exception though - the old HTTP version 1.0.  In 1.0, the request is just a single line - ie, the GET line. In this situation, the receiving host must assume that the request is for it. This means that HTTP 1.0 browsers can not to told use a proxy, nor can they be transparently proxied unless the transparent proxy rewrites the request to HTTP/1.1 right before it changes the destination IP, waits and tracks the reply, and and then rewrites the result in HTTP/1.0 before sending it back to the browser... and all that would require far more effort than it deserves.

With HTTP 1.1, the Host is explicitely defined in the request, as are several other things. This allows multiple (virtual) webservers to be runing on the same IP/port address, and for a host receiving the request to act like a cache/proxy without the browser knowing about it.

Normally, a broswer will do a DNS lookup, and send the request to the IP address that the host resolves to. When you tell your browser to use a http proxy, all it changes is the IP address it sends the request to (for the picky types, there is a a slight change to the GET line too). The DNAT process for transparent proxying does the same thing - it just changes the destination IP address. 

Squid needs to be specifically told in the configuration when it is being used in transparent mode - this is due to the change to the GET line I mentioned. You can read the squid documentation at http://www.squid-cache.org/ if you really want that level of detail.

You sound like you're writing your own proxy. What you need to do is parse the HTTP request, and determine the original host from the Host: line. Then do a reverse DNS on that, and that will give you your the IP address you're after. If your program then submit the request to the real webserver, you must make sure the Host line is still intact. If you leave it out, or set it to be the IP address you found, you can end up with the default website when you connect to a server running multiple virtual names on a single ip/port.















