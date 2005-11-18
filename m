From: /dev/rob0 <rob0@gmx.co.uk>
Subject: script v. ruleset (was: Re: Help for this project)
Date: Fri, 18 Nov 2005 10:03:00 -0600
Message-ID: <200511181003.01077.rob0@gmx.co.uk>
References: <001201c5e9ad$7ca43f00$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001201c5e9ad$7ca43f00$0101000a@sterenborg.info>
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

On Tuesday 2005-November-15 00:26, Rob Sterenborg wrote:
> > And to go a bit further, I should say that I am moving away from
> > scripts, in favour of iptables-save(8)/iptables-restore(8)
> > rulesets. The initial ruleset can be developed by means of a script
> > or editor, and I find that the rules files are much easier to
> > maintain.
>
> I think that's a matter of opinion.

Of course it is, and is stated as such. It is an opinion which grew 
after writing many scripts. I once had, and at some sites still do 
have, monster scripts that make the OP's effort look trivial. 
Functions, nested loops, arrays, even nested arrays which are 
supposedly not possible in bash! (I cheated, using alternate $IFS on 
the internal arrays, the ones which were contained in other arrays.)

I'm pretty good with bash. I am on a first-name basis with the Advanced 
Bash Scripting Guide, and even with the dreaded "man bash". :) I paid 
my shell scripting dues, so to speak, and I did it in making firewalls.

I feel pretty confident that my latest firewalls, trivial to maintain 
and to adjust using rules files, would be a nightmare to script. I have 
complex port forwards which are allowed from some addresses but not 
from others, and some which differ per external interface (at sites 
with multiple external interfaces.) I have conditional branching 
through multiple user chains. Two sites I can think of have even have 
alternate SNAT'ing per internal address. I have several sites with 
transparent proxying rules, HTTP and DNS.

I found that when I needed to add or adjust one rule I often had to dig 
in the depths of the script code, and the digging could break things. 
My dream of having one simple configuration file and never touching the 
script internals never quite came to pass.

In the early days, I, like many who post here for help, did not fully 
understand the distinction between filter INPUT and FORWARD. My early 
scripts jumped to the same Allow chain for both INPUT and FORWARD, 
although some of those rules belonged exclusively in one or the other.

When I come across these I am converting them to rulesets. It's simple 
to do so in $EDITOR. I make separate AllowIn and AllowFwd chains and 
append the "In" or "Fwd" string as needed. Spending ten minutes in 
$EDITOR gives me a tighter, better firewall, that would have taken 
hours to script (and to debug!)

> Personally I prefer scripts because I can put remarks and empty
> lines in them, grouping lines together that belong to each other
> so I know what I did 1 year (or so) ago, without having to read
> over the complete script/ruleset.

Red herring. No, iptables-save(8) won't preserve comments unless using 
"--comment" in your rules, but you can certainly add comments to your 
rules -- iptables-restore(8) is fine with that. I didn't try blank 
lines, but I bet those work too.

The only grouping requirement I know is that you must keep each table's 
rules together between the *table_name and COMMIT lines. Perhaps you 
could add multiple sections for the same table. Again, I have not 
tried. Nor would I wish to try!

> But everyone should do what (s)he wants in that matter ; the output
> of iptables-save is practically in script form so it's not that I
> can't read it.

The thing that appeals to me is that the output is linear per chain, 
just like netfilter itself. You can see right away what is being done 
in any particular chain.

I am not trying to convince you; I am only trying to explain where I 
came from and why I went where I did. With simple firewalls, simple 
scripts can surely be a viable option.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

