From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: Packet chain traversals
Date: Sun, 27 Oct 2002 19:50:05 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210271942340.12007-100000@laptop1.agatha>
References: <200210271303.57379.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210271303.57379.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

Hi Joel,

On Sun, 27 Oct 2002, Joel Newkirk wrote:

> I've been working on a chain traversal diagram (primarily for my own reasons, 
> but if anybody likes it they are welcome to use it non-commercially) and have 
> a few questions.
> 
> First, the current form of the diagram is (temporarily) at 
> http://newkirk.no-ip.org:83/Traversal-sm.png

Mmmmm, reminds me of that trip on LSD I took the other day.... =) just 
kidding. It does look good really, except you made it rather confusing in 
one aspect... I don't know if it's just me, but why do you have two "out" 
and two "in"?

> and the basic rule is that a packet cannot cross a black line.  The choices of 
> colors are meaningless, except to differentiate chains.
> 
> I know that the 'latest' form of netfilter has mangle AND filter chains for 
> forward and input, and mangle, nat, and filter chains for output.  (Yeah, the 
> diagram would be even more confusingly complicated with that detailed :^)
> 
> Can someone offer some examples of uses for mangle-forward, mangle-input, 
> mangle-output, and nat-output?  I can't see much use for them, but my use of 
> iptables has been fairly simple so far, and most of my comprehension is based 
> on the previous version of the tutorial. (and absorbing the gobs of 
> information embedded in messages here :^)
> 
> Also, I wanted to ask for clarification on a point in the latest 
> iptables-tutorial "Traversing of tables and chains" section:  At one point it 
> seems that packets pass through mangle-forward THEN filter-forward, (diagram) 
> yet elsewhere it seems to be the reverse. (table 1)  Which is correct?

I just fixed this today actually. If you want to make absolutely certain, 
run the script attached to the tutorial (I added an updated version to 
this mail since the one in the released tutorial doesn't contain the 
mangle5hooks.patch fixes), tail -f the proper logfile 
and then send ping's from different locations and directions (e.g., ping 
across the firewall, ping to the firewall and ping from the firewall). 
That way you will be able to make sure how it works.

> 
> Thanks for any input, examples, diagram criticism (artistic or logical) etc.  
> If your response seems to you to be useless to the list in general then 
> please just send it to me directly.

no problem. Don't take me too seriously though, I am a lousy "artist" 
so... :)

> 
> j
> 
> 

-- 
----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net


