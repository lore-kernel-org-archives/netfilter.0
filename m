From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: university project: distributed firewall (using iptables)
Date: Wed, 27 Oct 2004 11:02:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098889349.2038.104.camel@localhost>
References: <ECOWS04M9d0yPAWIeSN00016177@smtp-out4.blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ECOWS04M9d0yPAWIeSN00016177@smtp-out4.blueyonder.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jolyon Gray <ug82jxg@cs.bham.ac.uk>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Wed, 2004-10-27 at 10:35, Jolyon Gray wrote:
> Hi all,
> 
>  
> 
> I'm currently undertaking a final year project at university. My chosen
> project is to develop a distributed firewall application - I intend to use a
> centralised security policy which is applied to hosts as they enter the LAN
> - using iptables to do the packet filtering.
> 
>  
> 
> Iptables seems pretty straightforward but I'm having trouble with a few
> concepts - I'm probably just missing the mark:). I wish to use java as the
> implementation language - what are people's thoughts on this? I'll probably
> code my own classes to mirror the functionality of iptables - e.g. table,
> chain, target etc. These would subsequently be used to create the rules in
> text form - just a matter of applying them! The user would create the
> central policy using some GUI, specifying which machines are able to talk to
> which server ports etc - the rules for each machine would be created and
> applied via some sort of service. I'll probably use certificates for host
> authentication - if the machine cannot provide the correct credentials the
> central policy server fires out iptables rules to all authd machines to
> block the imposter!
> 
>  
> 
> I'm intending to use a block unless explicitly allowed approach, originally
> I was thinking say if machine x could speak to ftp on server y that I'd
> adjust both x and y's rules to set this up - however now I'm thinking that
> who cares about x, if y accepts ftp connections from x then all good but if
> not then y will block x so no need to tell x:)? Also, if x is not a server
> therefore x would not need to accept any incoming connections just make
> outgoing connections and receive their information therefore I could block
> all incoming connections to x unless they match an outgoing connection. - is
> that a dumb idea;)?
> 
>  
> 
> However I'd like to have some functionality beyond this, for example I'd
> like to have some way of recognising when a user launches an application
> requiring internet access - and update the rules accordingly (if the central
> policy for that user allows it!) - how would you do application level
> blocking using iptables, is this even possible or is Iptables too low level
> for that?. Furthering that I'd like to have individual rules for each user -
> however am I correct in thinking that iptables rules are per machine not per
> user - they affect all users of that machine; does anyone have ideas on a
> solution to allow multiple logon machines to have user level rules?
> 
>  
> 
> Please tell me if I'm crazy trying to create a distributed firewall using
> iptables :)!
> 
>  
> 
> Regards,
> 
> Jolyon Gray

Nope you're not crazy -- I've been working on it for the last two
years.  Then again, maybe you are crazy! :-)

There is a lot of information available to help you with your project. 
You can indeed create classes to mirror iptables but you may want to
consider more generic classes to describe the environment and then
translate the environment into iptables rules.  In this way, your front
end could eventually be used to manage other firewalls besides
iptables.  This is the approach we've taken on ISCS
(http://iscs.sourceforge.net).

The issue of where to enforce the policy decision (x, y or both) is an
interesting one.  I'll briefly share our ISCS approach.  We decided that
the rule sets for complex environments such as compartmentalized
internal networks and sandboxed wireless and mobile networks were
dramatically larger than those required for simple perimeter security. 
Consequently, the traditional, monolithic firewall access control rules
fail to safely scale to meet the needs of such environments.

To meet this need for new, larger and more complex rule sets, we broke
our evaluations into modular rules.  We still need to answer the
question of WHO has ACCESS to WHAT but we do so in a different way.  We
do not answer this question in one rule.  Instead, we first evaluate
WHO, then what ACCESS who has and then to WHAT they have access.

This means that we can choose where to enforce access control - at the
gateway protecting the Accessor, the gateway protecting the Resource or
both.  There are very significant implications of this choice for remote
access users.  Moving the access control decision to the gateway
protecting the accessor allows one to dynamically alter the rule set
based upon WHO as you describe above.  It also allows extended user
authentication to be used throughout the entire WAN from a single
gateway.

This answers another question you raise.  Yes it is possible to use
"out-of-band" user authentication to control access on a user rather
than machine basis.  ISCS does this in some rudimentary ways.  The NuFW
project (http://www.nufw.org) takes this to a much more sophisticated
level.

Obviously, there is much more to be covered than we can or should cover
in a mailing list e-mail.  There is over 500 pages of documentation
about how we handle these issues in the ISCS project alone.

If you'd like to contact me off list, I can point you through some of
those.  You may also wish to contact the NuFW folks off list.  They have
done some outstanding work.  Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


