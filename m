From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to redirect certain IPs to specific url
Date: Wed, 30 Jun 2004 09:31:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406300931.16812.Antony@Soft-Solutions.co.uk>
References: <a0f69e504063000446f514e22@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e504063000446f514e22@mail.gmail.com>
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

On Wednesday 30 June 2004 8:44 am, Askar Ali Khan wrote:

> hi
> got a very simple question, i want to redirect certain IPs(clients)
> request to a specific URL (ip)?

So long as you keep in mind two things:

1. An IP address is not the same thing as a URL (firstly, a server on one IP 
address may handle many different domains' websites, secondly a big domain 
such as Amazon, Microsoft, Yahoo may resolve to multiple IP addresses, 
thirdly an IP address (even if unique to a domain) cannot specify a path or 
filename which would follow the first / after the domain in a URL).

2. Netfilter works at OSI layers 3/4 (IP addresses and TCP/UDP port numbers), 
whereas HTTP works at layer 7 (URLs, hyperlinks and meaningful content).

Provided both the above are acceptable, and what you want to do is to redirect 
certain source IP addresses when accessing TCP port 80 to a different 
destination address, then you can do this:

iptables -A PREROUTING -t nat -p tcp --dport 80 -s a.b.c.d -j DNAT --to 
w.x.y.z

where a.b.c.d is the IP address of the client you want to redirect and w.x.y.z 
is where you want them redirected to.   If you want to do it only when they 
try to access a specific destination address (so other destinations are not 
redirected), simply add a "-d p.q.r.s" into the rule above, where p.q.r.s is 
the destination address you want them not to be able to reach.

If this is not what you want, and you do indeed need to do stuff at OSI layer 
7, working on HTTP rather than TCP and IP, you should probably look into 
http://www.squid-cache.org

> and also later on how to Flush the specific rule from the the chain as
> -A will append it on the bottom, how  i will delete it ?

Repeat the rule but with -D instead of -A

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


