From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Saving IPTable rules..oops
Date: Wed, 29 Dec 2004 13:35:57 -0500
Message-ID: <1104345356.1973.32.camel@localhost>
References: <6.1.2.0.0.20041229095858.02518240@corpmail.courtesymortgage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.1.2.0.0.20041229095858.02518240@corpmail.courtesymortgage.com>
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
To: Jason Williams <jwilliams@courtesymortgage.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Wed, 2004-12-29 at 13:03, Jason Williams wrote:
> Morning.
> 
> Well, spent a better part of the night playing with IPTables. Tried out 
> some rules, tweaked this, broke that. Was a lot of fun.
> 
> Anyway, as I am getting ready to make one of my servers go live, I realized 
> something that I completely overlooked. Very important thing I might add.
> 
> Basically, once you put all your rules into IPTables via the command line, 
> how do you save your rules? I saw a command, iptables-save, but that just 
> outputs the rules in a readable format.
> 
> I started thinking and came up with the following:
> 
> 1) Does iptables read the init script in /etc/init.d/ upon bootup of a 
> server/box and use those rules for the system?
> 
> or
> 
> 2) Does it read a plain text file some where an use those rules instead?
> 
> wasn't quite sure and since im going on 22 hours without sleep, im positive 
> I missed it some where.
> 
> With that in mind, was hoping someone could fill in the details.
> 
> IF it is the case the the system reads the iptables init script upon 
> bootup/restart, that means I need to work on my scripting. :)
> 
> Anyways, hoping for a little clarity here.
> 
> Cheers,
> 
> 
> Jason

Oh, two more things.  We always use the iptables-restore in the ISCS
project (http://iscs.sourceforge.net) rather than scripts with iptables
commands because it is enormously faster.  The difference is noticeable
even on small rule sets but if your rule sets start to number in the
thousands, you can spend an hour trying to boot your gateway using
iptables commands.

If you use multiple scripts, remember to use iptables-restore -n.  Just
iptables-restore will overwrite any existing rules.  Take care - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


