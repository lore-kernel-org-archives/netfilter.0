From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: DNS and NAT
Date: Mon, 11 Jul 2005 16:25:20 -0500
Message-ID: <42D2E3C0.1030405@gmx.co.uk>
References: <BAY17-F385E7ADF96986B0821571980DC0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY17-F385E7ADF96986B0821571980DC0@phx.gbl>
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
To: netfilter@lists.netfilter.org

Please don't top-post. Thank you.

Suzana Lojic-Skoric wrote:
> OK, thanks I was not sure what is the proper behavior regarding
> iptables and DNS.

The usual situation is that clients are NAT'ed out, like what you're 
describing.

> If answer is not translated then how do I get DNS to work with two way NAT?

What does not work? Two-way NAT is fine. You go on to say you're not 
really talking about two-way NAT:

> My internal network does not understand any of the ip addresses that 
> belong to outside. So if the request for a page that is sent from 
> internal network comes back from outside with an answer (ip address) 
> that is not getting translated then I can't resolve the page since my 
> internal network doesn't understand it and can't route to it.

Clients need to have a default route through the NAT gateway, which does 
SNAT or MASQUERADE. How is it two-way if the clients can't route out?

> Is there a way around this problem? How do I get DNS to work in the type 
> of environment I described?

If you don't want to allow NAT clients out for some reason, you might 
check into running proxy servers, such as squid for HTTP/FTP. Only the 
services you are proxying can be used by internal clients. SOCKS proxy 
servers can handle multiple protocols, but I don't know anything more 
about it than just that fact.

Proxy servers are a good choice in some circumstances; you maintain 
maximum control over what clients can and cannot do (unless users have 
shell access to the proxy server, perhaps.) But proxying is far more 
resource-intensive than NAT.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

