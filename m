From: Krunk <krunkalot@hotpop.com>
Subject: Re: Curious problem with my iptable rules.....detailed post
	inside, help appreciated.
Date: Sun, 18 Apr 2004 13:10:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082311801.5336.38.camel@james>
References: <1082158518.4759.40.camel@james>
	 <1082228983.2270.33.camel@katala.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082228983.2270.33.camel@katala.sterenborg.info>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-04-17 at 14:09, Rob Sterenborg wrote:
> 
> Maybe it's a bit easier if you also told us what it is that you want to
> achieve

I'm approaching this with the intention of learning the proper way to
securely lock down a production system. (it's just an old mac I have).
Most of the script was adapted from a book on security which I'm reading
(only one chapter dedicated to iptables......."Real World Linux
Security" by Bob Toxin btw.) 

>  (and why you're using 2 scripts) because I think your script can
> be a lot shorter than the main script you're using right now.
> (Btw, I didn't read all of the script.)
> 
One script is the one I'm "working with" the smaller one is a bare bones
"I know this works" script so when I hit a hitch in the other one and
the roommates get ancy from not internet I can bring it up quick.

> There's a lot of DROPping going on while in the same time you have set
> policy to DROP for the INPUT, OUTPUT and FORWARD chains. That means
> *everything* is closed already : you can't get in, out or through the
> box. Only  packets you have set an ACCEPT rule for can be received, sent
> or forwarded/routed.
> 
From what I read, this is to prevent a "hole" from opening up. By having
a default policy of DROP, anything overlooked is by default dropped. I
was under the impression that having only explicitly accepted packets
allowed is a good thing.

> Setting OUTPUT policy to DROP is good. Only it might be easier to
> troubleshoot your script if you first set it to ACCEPT, do some testing
> untill it works. Then set OUTPUT to DROP and get it working again (if it
> doesn't, because then only the iptables box won't be able to send
> packets so your clients on eth1 and eth2 shouldn't notice it).
> 
When I first built the script, I did it very piecemeal...taking one
section at a time. Started with the bare minimum forward script and
built the DENY and DROP rules one by one. Testing as I went along and
correcting syntax errors etc etc. I only set the initial DROP policies
at the very end after the script was done. To test if this was the
problem I commented out the initial DROP Policies....the same problem
persisted. Since the only remedy I've found for getting it working again
after initially running the script is a hard reboot, it greatly
complicates the troubleshooting. In essence I would have to reboot after
every added line until I found the trouble maker (ugh). I was hoping
there was some glaring error in procedure that would be caught so I
wouldn't have to do this. On a side note, I eliminated all of the DROP
and REJECT rules "just to see" and it does work that way. It would seem
that there is some policy being set which my -X and -F loop is not
catching.

> You have the RELATED/ESTABLISHED rules at the bottom of your script.
> As most (accepted) packets will be matched by these rules, put these
> close to the top of your script.
> 
> Put : echo 0 > /proc/sys/net/ipv4/ip_forward
> at the top of your script, so there won't be any packet forwarding, even
> if there are rules already.
> Put : echo 1 > /proc/sys/net/ipv4/ip_forward
> at the bottom of your script so forwarding starts when all rules are in
> place.
> 

Thank you for the suggestions, they make perfect sense....I've made the
adjustments.
> You realize that the :
> - INPUT chain is for incoming packets, DESTINED FOR the iptables box.
> - OUTPUT chain is for outgoing packets, COMING FROM the iptables box.
> - FORWARD chain is for packets going through the iptables box in either
> way.
> Every packet will *only* go through one chain. 
> 
> Did you read Oskar's iptables tutorial ?
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html

I'm in the process of reading it now, I've read several other tutorials...but this is the most thorough
I've seen yet. 

Thank you.



