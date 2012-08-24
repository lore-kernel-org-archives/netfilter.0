From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Double stack IPv4&&IPv6 for a firewall
Date: Fri, 24 Aug 2012 16:41:20 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208241640240.16184@frira.zrqbmnf.qr>
References: <50375A06.6000808@cica.es> <1345818598.2977.265.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1345818598.2977.265.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: Arturo Borrero <aborrero@cica.es>, netfilter@vger.kernel.org

On Friday 2012-08-24 16:29, John A. Sullivan III wrote:

>On Fri, 2012-08-24 at 12:40 +0200, Arturo Borrero wrote:
>> Hi there!
>> 
>> The way is recommended to implement IPv6 in a network while IPv4 is 
>> still alive is double stack.
>> In a network where all have DNS records, double stack means that each 
>> FQDN has an A reg. and an AAAA reg.
>> 
>> So, deploying a DNS-based firewall takes you to duplicate the ruleset, 
>> first for iptables/ip6tables and then for ipset family inet/ipset family 
>> inet6
>> 
>> The question is:
>> 
>> Do anyone knows a program, framework, script, method or whatever to face 
>> this situation?
>> 
>> I'm talking of an 'abstraction' method that hides the differences 
>> between iptables/ip6tables, as long as is using almost always FQDNs with 
>> both DNS regs to configure the ruleset.
>> 
>> Best regards.
>> 
>> 
>Hmm . . . perhaps it has changed but, when I investigated it years ago,
>using FQDNs for iptables rules was problematic in that the names were
>only resolved at the time the rules were loaded.  If any of the
>addresses change, the firewall is completely unaware of the change as it
>does not resolve the name on each query.  Is that still the case? - John

Naturally, since DNS lookups will introduce a shitload of latency and 
error potential (like, when DNS itself fails) were it done for every 
packet.

