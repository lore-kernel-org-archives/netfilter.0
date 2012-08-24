From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Double stack IPv4&&IPv6 for a firewall
Date: Fri, 24 Aug 2012 10:29:58 -0400
Message-ID: <1345818598.2977.265.camel@denise.theartistscloset.com>
References: <50375A06.6000808@cica.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50375A06.6000808@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org

On Fri, 2012-08-24 at 12:40 +0200, Arturo Borrero wrote:
> Hi there!
> 
> The way is recommended to implement IPv6 in a network while IPv4 is 
> still alive is double stack.
> In a network where all have DNS records, double stack means that each 
> FQDN has an A reg. and an AAAA reg.
> 
> So, deploying a DNS-based firewall takes you to duplicate the ruleset, 
> first for iptables/ip6tables and then for ipset family inet/ipset family 
> inet6
> 
> The question is:
> 
> Do anyone knows a program, framework, script, method or whatever to face 
> this situation?
> 
> I'm talking of an 'abstraction' method that hides the differences 
> between iptables/ip6tables, as long as is using almost always FQDNs with 
> both DNS regs to configure the ruleset.
> 
> Best regards.
> 
> 
Hmm . . . perhaps it has changed but, when I investigated it years ago,
using FQDNs for iptables rules was problematic in that the names were
only resolved at the time the rules were loaded.  If any of the
addresses change, the firewall is completely unaware of the change as it
does not resolve the name on each query.  Is that still the case? - John

