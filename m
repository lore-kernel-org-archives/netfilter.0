From: Chris <chris@deksai.com>
Subject: Re: Parts of firewall disappearing under load
Date: Tue, 2 Jun 2009 15:39:43 -0400
Message-ID: <20090602193943.GA3722@chris-laptop.a2hosting.com>
References: <20090602135200.GA3494@chris-laptop.a2hosting.com> <0E343D269189485382D3A75C20D236B3@phoenix> <20090602153117.GA3549@chris-laptop.a2hosting.com> <1243957429.10053.7.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1243957429.10053.7.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Jun 02, 2009 at 05:43:49PM +0200, Thomas Jacob wrote:
> If you can actually see that you have a different active rulesets when
> it "works" than when it doesn't work, then your problem most likely is
> with the ruleset loading/creation process. I am not aware of any
> component of netfilter that can change the ruleset by itself without
> user space interaction. Of course various dynamic memory tables can get
> exhausted (connection tracking, neighbor caches, routing cache etc), but
> when this happens you usually get messages in your kernel log
> that clearly say so.
> 
> How do you manage your ruleset? Check the logs of that solution....

Nothing is changing the firewall after it is up, other than the addition
of some deny rules.  Once it is up, it is up.  Nothing would cause the
large number of random differences like what happens here.  We have a
lot of servers running nearly identical rules.  The servers that have
the problem run fine for months at a time too :)

Is it possible that a table used by recent or limit could overrun and cause
this type of behavior without necessarily showing up in the logs?

There is another case I can think of that may or may not be related.  We
lost a fairly large customer once because the firewall would
occasionally stop allowing traffic from his facebook application.  We
studied the tcpdumps for any clue as to what was happening, and could
find nothing.  We started emptying chains until we had a bunch of empty
chains with nothing left but a single ACCEPT for everything.  That still
didn't fix the problem.  We had to remove all the chains, and reload to
get things working again.

I have no idea if these shared servers are suffering the same problem,
but dropping everything in the firewall and reloading does fix it.

The problem I've had in the past is that the servers don't have enough
sense to have this problem during slow times of the day.  I can't leave the
machines in this state long enough to study it very carefully without an
angry mob coming after me.

I can fix the problem, just not tell you how it gets that way.  What I
am really asking is if there is any useful information I could gather
while a machine is down to post to this list so I don't have to ask
people to look into their crystal balls to help diagnose it.  If it is a
bug in code or a strange corner case, I'd like to find out what it is.

Chris
