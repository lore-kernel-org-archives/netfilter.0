From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Maximum number of ports?
Date: Thu, 11 Aug 2005 11:54:07 -0500
Message-ID: <200508111154.07609.rob0@gmx.co.uk>
References: <1123184190.21749.34.camel@ndspc131.p.n-dsi.com>
	<Pine.LNX.4.61.0508050832310.20623@yvahk01.tjqt.qr>
	<1123704837.3708.1.camel@ndspc131.p.n-dsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123704837.3708.1.camel@ndspc131.p.n-dsi.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 2005-August-10 15:13, Peggy Kam wrote:
> What is the maximum number of ports that I can define in the
> iptables? What is the limitation?

Are you asking about the multiport match extension? If so please find 
the following in "man iptables" and post again if you do not understand 
it:

   multiport
       This  module matches a set of source or destination ports.
       Up to 15 ports can be specified.  It can only be used  in
       conjunction with -p tcp or -p udp

That particular limitation only applies to a single multiport command. 
You can have as many of those as you need. Perhaps you're asking about 
the maximum number of rules you can have? I don't know what that limit 
might be (if I was curious I would Google), but I bet it's higher than 
the 64K TCP ports plus the 64K UDP ports.

If you're writing a firewall with that many rules, it is probable that 
you could have done it better and more efficiently using a different 
approach. For instance, default policies of DROP and only ACCEPT the 
port/protocol combinations you need, plus the standard "-m state 
--state RELATED,ESTABLISHED -j ACCEPT" rules.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

