From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT, Is it possible to find the original destination?
Date: Mon, 1 Nov 2004 11:10:41 -0500
Message-ID: <20041101161041.GA18269@bender.817west.com>
References: <1099323026.41865692986d5@email.ixwebhosting.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1099323026.41865692986d5@email.ixwebhosting.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Nov 01, 2004 at 09:30:26AM -0600, lumberjack@lumberjackvillage.com wrote:
> iptables 1.2.9 on SuSE 9.1
> 
> I am using iptables redirection to send things inbound to port 80 to 
> localhost:8080:
> 
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to 8080
> 
> Is there any way that my application can look in the table and see the real 
> destination?  I've seen several things in patch-o-matic that do things with 
> conntrack but there doesn't seem to be any command, /proc or /dev entry 
> available to query "i have a connection from host foo, iptables, who was foo 
> really wanting to speak too?".

well, in the case of you example port (80), if you're talking about an
HTTP request, the original destination of the request is preserved in the
"Host: " header.  this is how transparent proxying works.

in the general case, i don't suppose there's anything stopping you from
performing a lookup against /proc/net/ip_conntrack within your app to
find the original dst ip (although it's been pointed out here recently
that lookups against /proc/net/ip_conntrack are a bad idea--check the
archives).

-j

--
"If something is to hard to do, then it's not worth doing."
        --The Simpsons

