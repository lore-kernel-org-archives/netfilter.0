From: "Kevin D. White" <web_crawlz@yahoo.com>
Subject: RE: magle, filter & FORWARD
Date: Wed, 2 Jun 2004 17:53:31 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040603005331.96813.qmail@web41712.mail.yahoo.com>
References: <1086208328.2655.35.camel@thunderbird.stwerff.xs4all.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1086208328.2655.35.camel@thunderbird.stwerff.xs4all.nl>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


--- Ludo Stellingwerff <ludo@protactive.nl> wrote:
> At first, sorry for any confusion I created, but
> sadly I would have to
> agree with Dick St.Peters about the definition
> mistake I made: Chains
> still are what they were with ipchains.
No problem, this is a public mail list and the fact
your tring to help gives you instant forgiveness :)
It's a good thing that there are people like Dick who
mantain the integrity of archives for an open
discussion!  Way to go Dick!

> Trouble is that there are several objects involved:
> hooks    Place in the network-subsystem where
> packets are matched
> tables   Combination of chains with similar purpose
> chains   List of rules applied in turn at a give
> packet
> rules    Packet matching and handling
Yes, my questions seem to lean towards the inner
workings of Netfilter and is not so much about how to
do something.

> On Wed, 2004-06-02 at 21:33, Kevin D. White wrote:
> > Ok, now that I have made the major mistakes and
> they
> > are out of the way, let me try this.
> > 
> > Netfilter is made up of 5 subsystems, Pre-routing,
> > Input, Forward, Output and Post-routing.
> 
> Correct, 5 hooks in the networksubsystem where
> chains can be attached. 

phew!
 
> >   These
> > subsystems are governed by three tables, nat,
> magle,
> > filter.
> 
> At these points one or more tables filled with
> chains are attached.
> These tables are for different purposes: filtering,
> Address translating
> and mangling of packetfields.
> Initially each table contains 1 chain with a similar
> name as the 'hook'
> where this table is attached.
> In the 'nat' table at the POSTROUTING hook, there is
> a chain called
> POSTROUTING.
 
Great! Two chains called FORWARD with different rules,
located in different tables and used by the Forward
subsystem.

> >   The elements of these tables have the
> > following characteristics.  First there is a
> 'hook' or
> > subsystem identifier (i.e. PREROUTING, INPUT,
> FORWARD,
> > etc), then there is a condition and finally there
> is
> > an Action/Target.  
> 
> No, it's not 'hook' nor subsystem identifier, but
> the name of the chain
> this rule is attached to:
> Parent chain, condition and target.
> 
> iptables -t nat -A PREROUTING -s 192.168.4.6 -j
> ACCEPT
> -------------------p. chain--- Condition  ---- 
> Target
Good stuff! So the hook is a function in Netfilter
that looks for chains that pertain to that particular
subsystem, within the table that is attached.  

> > All received packets begin in the
> > Pre-routing subsystem, the Pre-routing subsystem
> > accesses the nat table and looks for all it's
> hooks
> > (all elements with PREROUTING).
> 
> Thus this will become:
> All received packets begin at the PREROUTING hook,
> where the connected
> 'nat' table is being checked by accessing the
> primary chain called
> PREROUTING. This chain is checked for matching
> rules.
> >   Then the same is done
> > with the mangle table.
>  Next the mangle table is checked for the PREROUTING
> chain.
> 
> >   A routing decision is made,
> > and the packet would either move into the Input
> > subsystem or the Forward subsystem were the tables
> for
> > those subsytems would be accessed and so on.  All
> > packets end up in the Post-routing subsystem
> before
> > leaving an interface.
> > 
> 
> This is correct.
phew!

> > I am intentionally ignoring user created hooks.
> > 
> 
> They are user created chains which can be stored in
> each table and
> function as a new target: 
> iptables -t mangle -N test
> iptables -t mangle -A test -j MARK --set-mark 3
> iptables -t mangle -A PREROUTING -s 192.168.4.6 -d
> 192.168.4.7 -j test
> 
Yes the rest is semantics, excellent.

Thank you very much Ludo, your a true scholar and a
gentleman.

I'm very impressed with Netfilter and what it can do. 
If anyone needs a good replacement for what they are
currently using, I will direct them to here.

Another big thanks goes out to Daniel, Justin and
Dick!
:)


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

