From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Blocking Ads.
Date: Tue, 22 Jun 2010 15:28:17 -0500
Message-ID: <4C211CE1.7000400@riverviewtech.net>
References: <868109.94510.qm@web112409.mail.gq1.yahoo.com> <AANLkTimRWJsPH73ASlu7nUY4iuG-ZnB_r7KpMZv64-fd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimRWJsPH73ASlu7nUY4iuG-ZnB_r7KpMZv64-fd@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/22/10 13:41, Curby wrote:
> As far as I know, ad blocking is more commonly performed using DNS, 
> by resolving domain names to 127.0.0.1, or to a server to serve up 
> notices of removed content (e.g. in a business environment, users 
> could request that sites be unblocked).  Is there a reason why you 
> want to block specific IP addresses instead of domains?

Agreed.  Normally this is done via DNS, or (IMHO) better via an 
application layer proxy.

If I was going to DNS poison names where content was served from, I'd 
either provide a place holder, or an HTTP 404 error so that the client 
could gracefully handle the missing (blocked) content.

> Anyway, I suspect that sending back appropriate ICMP error messages 
> instead of DROPing such requests would provide hints to clients that 
> they should give up instead of wait for a reply.

Agreed.  This is why you want to REJECT with an ICMP error message, so 
that clients (that will honer them) get an immediate notification that 
the connection has been blocked.

Not all clients will honor the ICMP rejection message.  But that is a 
client problem, not a flaw introduced by your firewall.  Returning an 
HTTP 404 error would probably be better handled than returning an ICMP 
unreachable message.



Grant. . . .
