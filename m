From: Dave Cinege <dcinege-mlists-dated-1116278738.5cb0db@psychosis.com>
Subject: Re: captive web system using DNAT and SNAT
Date: Wed, 11 May 2005 17:25:35 -0400
Message-ID: <200505111725.35687.dcinege-mlists@psychosis.com>
Reply-To: dcinege-mlists@psychosis.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org, "Taylor, Grant" <gtaylor@riverviewtech.net>

On Wednesday 31 December 1969 18:59, netfilter-request@lists.netfilter.org 
wrote:

> Very interesting.  This makes me think that there is a kernel routing
> caching type issue.  I expect that if this is indeed the case there could
> (or should) easily be a way to flush said cache or adjust a garbage
> collection interval.  This might need to be (summarized and) cross posted
> to a kernel developers mailing list to get their thoughts on it.

You just spurred an idea in me:

My appliance works by creating a separate routing table for each gateway 
connection that is online. As hosts are authorized, to a particular gateway 
aside form the predictable firewall rules,  they get a routing rule, to use 
the proper default route for that gateway.  Like this:
  /sbin/ip rule add from %(hostip)s lookup %(gwtablename)s
  /sbin/ip route flush cache

When the host is deauthorized:
  /sbin/ip rule del from %(hostip)s lookup %(gwtablename)s
  /sbin/ip route flush cache

Maybe I need some more 'flush cache' calls around where I make that routing 
table and destory it...if it's not that there's a bug someplace in the cache 
code.
 



