From: Ludo Stellingwerff <ludo@protactive.nl>
Subject: RE: magle, filter & FORWARD
Date: Wed, 02 Jun 2004 22:32:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086208328.2655.35.camel@thunderbird.stwerff.xs4all.nl>
References: <20040602193313.85458.qmail@web41711.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040602193313.85458.qmail@web41711.mail.yahoo.com>
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
To: "Kevin D. White" <web_crawlz@yahoo.com>
Cc: netfilter@lists.netfilter.org

At first, sorry for any confusion I created, but sadly I would have to
agree with Dick St.Peters about the definition mistake I made: Chains
still are what they were with ipchains.

Trouble is that there are several objects involved:
hooks    Place in the network-subsystem where packets are matched
tables   Combination of chains with similar purpose
chains   List of rules applied in turn at a give packet
rules    Packet matching and handling

On Wed, 2004-06-02 at 21:33, Kevin D. White wrote:
> Ok, now that I have made the major mistakes and they
> are out of the way, let me try this.
> 
> Netfilter is made up of 5 subsystems, Pre-routing,
> Input, Forward, Output and Post-routing.

Correct, 5 hooks in the networksubsystem where chains can be attached. 

>   These
> subsystems are governed by three tables, nat, magle,
> filter.

At these points one or more tables filled with chains are attached.
These tables are for different purposes: filtering, Address translating
and mangling of packetfields.
Initially each table contains 1 chain with a similar name as the 'hook'
where this table is attached.
In the 'nat' table at the POSTROUTING hook, there is a chain called
POSTROUTING. 

>   The elements of these tables have the
> following characteristics.  First there is a 'hook' or
> subsystem identifier (i.e. PREROUTING, INPUT, FORWARD,
> etc), then there is a condition and finally there is
> an Action/Target.  

No, it's not 'hook' nor subsystem identifier, but the name of the chain
this rule is attached to:
Parent chain, condition and target.

iptables -t nat -A PREROUTING -s 192.168.4.6 -j ACCEPT
-------------------p. chain--- Condition  ----  Target

> All received packets begin in the
> Pre-routing subsystem, the Pre-routing subsystem
> accesses the nat table and looks for all it's hooks
> (all elements with PREROUTING).

Thus this will become:
All received packets begin at the PREROUTING hook, where the connected
'nat' table is being checked by accessing the primary chain called
PREROUTING. This chain is checked for matching rules.
>   Then the same is done
> with the mangle table.
 Next the mangle table is checked for the PREROUTING chain.

>   A routing decision is made,
> and the packet would either move into the Input
> subsystem or the Forward subsystem were the tables for
> those subsytems would be accessed and so on.  All
> packets end up in the Post-routing subsystem before
> leaving an interface.
> 

This is correct.

> I am intentionally ignoring user created hooks.
> 

They are user created chains which can be stored in each table and
function as a new target: 
iptables -t mangle -N test
iptables -t mangle -A test -j MARK --set-mark 3
iptables -t mangle -A PREROUTING -s 192.168.4.6 -d 192.168.4.7 -j test


> 
> 	
> 		
> __________________________________
> Do you Yahoo!?
> Friends.  Fun.  Try the all-new Yahoo! Messenger.
> http://messenger.yahoo.com/
> 


