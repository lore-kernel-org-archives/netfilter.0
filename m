From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Performance isues related to a large number of iptables rules
Date: Thu, 13 Jan 2005 18:31:57 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501131821210.22559-100000@darkstar.sysinfo.com>
References: <41E6FA0E.2060707@intellitree.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E6FA0E.2060707@intellitree.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: henry <info@intellitree.com>
Cc: netfilter@lists.netfilter.org


Conventional firewalling, places rules in a number of places, not just the
firewall, for one, most folks seem to have forgotten the term 'screening
router' these days.  This is the place to put rules that do things like
place anti-spoofing rules, rules for traffic that should always not be
allowed to pass <i.e. filtering out windows related protocols and ports,
etc>.  ingress and egress filters can also be placed here.

There's another problem with large rulesets beisde preformance issues,
they get to be overtly complex and hard to follow and change.  Breaking up
the rules upon a screening router<s>.  Additionally, there's no reason a
site needs merely one firewall, the DMZ can have a seperate firewall for
those servers and services open to the public that should not hit the
internal network <or these systems can have specific host based firewalls
to address their specific needs and services>.  behind the screening
router and or main firewall <which can be a sub-screening router> subnet
or switch specific  firewalls can deal with traffic specific to those
systems housed therein.

Having worked at a few places that managed firewalls for the corporate 500
world, we found that overtly large rulesets tended to turn a firewall into
merely an open routed env...and often was the result of a failure to
properly assess the sites security policy structurally.  In otherwords the
policy was often far too fluid to get a handle on ahd seemed to change
weekly or bi-weekly.

Thanks,

Ron DuFresne

On Thu, 13 Jan 2005, henry wrote:

> I am curious what is the maximum number of iptable rules that can be 
> installed in a config before performance starts to be a problem. I have 
> looked into the possibility of using firewall rules to block "bad" 
> networks, but I have been told by most people that I have asked that 
> this is bad idea.
> 
> Here are my thoughts. If a packet matches the 3rd rule, does it matter 
> if there are 100,000 rules below it? 1,000,000 rules below it? If it 
> doesn't, then does the number of allowable rules really have to do with 
> how intelligently the rules are written, and more specifically, in what 
> order?
> 
> For ban lists, if for example we wanted to allow everyone access to port 
> 80, except a list of bad networks, we would obviously have to put a rule 
> to allow all connections on port 80 bellow our reject rules, otherwise 
> iptbales would never get to the ban rules. So lets say that we have 
> 50,000 rules, 99% of them being reject rules, with a rule to allow port 
> 80 to all hosts at the bottom, and a rule to allow RELATED,ESTABLISHED 
> packets at the top. When a host connects to us on port 80, iptables will 
> have to go though all 50,000 rules (assuming this host doesn't match one 
> of the reject rules) until it gets to the last one and decides to allow 
> the packet. But then, subsequent packets will have a state of 
> ESTABLISHED, and so they will match the first rule. In this case, only 
> the first packet of most sessions will the firewall have to do a lot of 
> work. Does this make any sense?
> 
> It seems to me, that for a reasonably powerful box, processing a large 
> number of rules on what would become a small total percentage of packets 
> shouldn't be a problem. Does anyone know what the real numbers are, and 
> what numbers are feasible and what numbers aren't?
> 

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


