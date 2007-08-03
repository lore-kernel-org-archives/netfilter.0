From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Iptables rules processing
Date: Fri, 03 Aug 2007 14:43:57 -0400
Message-ID: <1186166637.6697.5.camel@localhost>
References: <20070803161302.GB7815@sid.toystory.lan>
	<46B3566E.1010407@rchq.co.za> <20070803170735.GC7815@sid.toystory.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070803170735.GC7815@sid.toystory.lan>
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
To: Franck Joncourt <franck.joncourt@wanadoo.fr>
Cc: netfilter@lists.netfilter.org

On Fri, 2007-08-03 at 19:07 +0200, Franck Joncourt wrote:
> On Fri, Aug 03, 2007 at 06:23:10PM +0200, Ray Leach wrote:
> >
> >
> > Franck Joncourt wrote:
> >> Hi,
> >>
> >> Assuming we have the next two rules in our ruleset :
> >>
> >> iptables -A INPUT -s 192.168.10.14 -p tcp --dport 80 -j ACCEPT
> >> iptables -A INPUT -s 192.168.10.14 -p tcp --dport 443 -j ACCEPT
> >>
> >> I was wondering whether rules are processed one by one.
> >> In the two rules above, we have to check the source address
> >> 192.168.10.14, so I think this is done for the first one, and then for
> >> the second one. I am not quite sure ; Can anyone confirm that ?
> >>
> >>   
> > Yes, rules are processed one by one until a rule matches the packet.
> >
> > So the first rule above would be matched for traffic coming from 
> > 192.168.10.14 going to port 80 (192.168.10.14 browses a website)
> > The second rule would be matched when 192.168.10.14 tried to browse a 
> > secure website.
> >
> > Since bothe these rules are in the INPUT chain, they will only be matched 
> > when the source ip tried to access those ports on the machine running 
> > iptables.
> >
> 
> I meant, there can't be no such processing  ?
> 
> 1/
> -> ...
> -> match for the source address 192.168.10.14
>     |-> match for destination port 80 -> ACCEPT
>     |-> match for the destination port 443 -> ACCEPT
> -> ...
> 
> 
> According to me, it works this way :
> 
> 2/
> -> ... 
> -> match source address 192.168.10.14 AND destination port 80
>     |-> ACCEPT
> -> match source address 192.168.10.14 AND destination port 443
>     |-> ACCEPT
> ->...
> 
> In the case 1, we check the source address once, and in the second one,
> twice. So the first case would be quicker to process than the second
> one where there is no optimalisation.
> 
> I know what these rules do, but this is just an example, and I know how
> the user chains work as well :p!
> 
Yes, you are correct that user defined chains are a way to optimize
this.  I do not know much about ipsets but I wonder if that would also
help.

We face this constantly on the ISCS network security management project
(http://iscs.sourceforge.net).  We use it to create micro-perimeter
solutions where network access is on an as-needed basis only. Thus we
have to describe every information flow within the organization. The
result can be hundreds of thousands of rules.

To optimize the processing, we break the question of WHO has ACCESS to
WHAT into three separate stages and answer each separate, i.e., WHO are
you, what kind of ACCESS do you have and WHAT are you trying to access.

This gives us two advantages:
1) it dramatically reduces the size of complex rule sets because we only
need one rule for each WHAT, ACCESS and WHAT instead of a separate rule
for each possible combination of WHO, ACCESS and WHAT.
2) It makes traversal of the rule set more efficient.  It is, in effect,
indexed.  Once we know WHO you are, we only need to worry about the
rules that pertain to you.

We have been wondering if ipsets wouldn't further optimize our
processing. If anyone out there with a good understanding of ipsets
would like to give us a hand with this project, please let me know.
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


