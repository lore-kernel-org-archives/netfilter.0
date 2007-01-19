From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Filtering in PREROUTING
Date: Fri, 19 Jan 2007 09:51:05 -0600
Message-ID: <45B0E8E9.4090107@riverviewtech.net>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>	<45AFC82B.6030505@plouf.fr.eu.org>
	<1169212660.16267.1.camel@len.t-t-l.co.uk>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169212660.16267.1.camel@len.t-t-l.co.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

george wrote:
> - broadcasts, mostly from Windows boxes which include Grant's netbeui
> example.  These are most frequent and were the trigger for doing this.

Remember that not all NetBEUI traffic is a broadcast.  In fact, the only 
thing that is a broadcast is traffic looking for other hosts (if you are 
not using NetBIOS Name Server (a.k.a. WINS)) or messages that are meant 
to be broadcast messages to user / computers / domains, i.e. "The server 
is going down for maintenance." messages.

> - spoofed source address (I don't know if I really need these with
> rp-filter enabled, in particular to catch private addresses if they
> manage to get in from the Internet.  I may be being too paranoid here)

RP filter can detect spoofed source traffic from your internal network 
subnet, but not the internet at large.

> These all look good to me.  I haven't needed NOTRACK before so I'd have
> to get that bit straight in my head if I were to go that way.

To my knowledge, NOTRACK is really just used to tell the connection 
tracking system to not track a packet.  There is not really a lot of use 
for this in most installs.  There are only two things that come to mind 
where you would not want / need this.  1)  If you were using TARPIT and 
did not want to tie up CTState table entries.  2)  If you were doing 
some sort of really high traffic for specific services and did not want 
that service to be connection tracked.

> I'm still not sure that I'm doing anything wrong, just unconventional.

I will agree with and not argue with that statement.

> From what I've been told via this list I'm thinking that it would be
> sensible to move my broadcast dropping to raw, state checks to filter
> and I don't know if I even need the spoofing checks, but if I do I
> suspect raw is the place for them.

In accordance with your above statement, I will say that (IMHO) the 
filter table is better, but raw is not wrong.

> I am still slightly nervous that by going against the designers'
> intentions I might end up with something breaking.  I would hope that
> anything dangerous wouldn't be allowed but "of course I didn't check for
> that - nobody would do that would they" is a classic reaon for software
> flaws :)

Well I don't *think* / believe you will run in to any bugs that will 
break things short of a bug in a specific match (extension).  As I 
understand it, most pieces of NetFilter are small modules that just 
check their small data set and return a value.  IPTables it self calls 
small tests in combination with each other and deciding what to do based 
on the return value from the small tests.  Note, this is what I have 
derived being a NetFilter / IPTables user, not from a developers standpoint.



Grant. . . .



Grant. . . .

