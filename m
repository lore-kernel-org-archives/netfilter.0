From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Parts of firewall disappearing under load
Date: Tue, 02 Jun 2009 17:43:49 +0200
Message-ID: <1243957429.10053.7.camel@enterprise.ims-firmen.de>
References: <20090602135200.GA3494@chris-laptop.a2hosting.com>
	 <0E343D269189485382D3A75C20D236B3@phoenix>
	 <20090602153117.GA3549@chris-laptop.a2hosting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090602153117.GA3549@chris-laptop.a2hosting.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris <chris@deksai.com>
Cc: netfilter@vger.kernel.org, Jason Pyeron <jpyeron@pdinc.us>

On Tue, 2009-06-02 at 11:31 -0400, Chris wrote:
> On Tue, Jun 02, 2009 at 10:10:31AM -0400, Jason Pyeron wrote:
> > > We've got quite a few heavily loaded boxes (ISP shared 
> > > servers) which have firewalls enabled.  The firewalls 
> > > basically allow certain ports, block some naughty IPs, and 
> > > use limit and recent to keep some services under control.
> > > 
> > > What we've noticed is that on rare occasions, a box will 
> > 
> > Can you make a test case? Does it happen on more than one machine?
> 
> That's the tricky part.  It happens maybe once or twice a month, and on
> different machines.  I don't know of a way to reproduce it.  Any
> pointers on information that would be useful to gather at the time it
> happens would be extremely useful, since at this point it is a mystery
> to me.

If you can actually see that you have a different active rulesets when
it "works" than when it doesn't work, then your problem most likely is
with the ruleset loading/creation process. I am not aware of any
component of netfilter that can change the ruleset by itself without
user space interaction. Of course various dynamic memory tables can get
exhausted (connection tracking, neighbor caches, routing cache etc), but
when this happens you usually get messages in your kernel log
that clearly say so.

How do you manage your ruleset? Check the logs of that solution....

    Thomas

