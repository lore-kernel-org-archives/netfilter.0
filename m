From: John Sage <jsage@finchhaven.com>
Subject: Re: IP Tables: starting slowly..
Date: Wed, 18 Jun 2003 04:06:05 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030618110605.GL7125@tweedle.finchhaven.net>
References: <20030616161137.GA7125@tweedle.finchhaven.net> <1055805673.19438.236.camel@alpha.newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1055805673.19438.236.camel@alpha.newkirk.us>
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
To: Joel Newkirk <netfilter@newkirk.us>
Cc: John Sage <jsage@finchhaven.com>, netfilter@lists.netfilter.org

Joel:

Thanks so much; very helpful..

On Mon, Jun 16, 2003 at 07:21:13PM -0400, Joel Newkirk wrote:
> On Mon, 2003-06-16 at 12:11, John Sage wrote:
> > hmm..  iptables itself isn't starting slowly, I'm slowly starting to
> > implement iptables.
> > 
> > I'm (finally..) migrating from ipchains, and would appreciate some
> > comment on my overall approach.
> 
> Keep in mind that FORWARD traffic goes only through the FORWARD filter
> chain, never INPUT or OUTPUT.  Those two are strictly for the iptables
> box itself.  (#1 confusion source it seems for ipchains emigrees)

Yes. Took me a few minutes to get my head around that.

I've set rules that cover all interfaces, and end with a blanket
ACCEPT, and that's made it a little clearer to understand:

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
 5535  541K ACCEPT     all  --  eth0   any     anywhere
  940  151K check      all  --  ppp0   any     anywhere
 2198  209K ACCEPT     all  --  lo     any     anywhere
    0     0 check      all  --  any    any     anywhere

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
 3437  197K ACCEPT     all  --  eth0   any     anywhere
 2822 1127K check      all  --  ppp0   any     anywhere
    0     0 ACCEPT     all  --  any    any     anywhere

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
 4999 1254K ACCEPT     all  --  any    eth0    anywhere
  718 51403 ACCEPT     all  --  any    ppp0    anywhere
 2198  209K ACCEPT     all  --  any    lo      anywhere
    0     0 ACCEPT     all  --  any    any     anywhere
<snip>


> > 1) I'm writing a minimal set of rules to account for every packet within
> > a specific chain, and not let any fall through to the default policy
> > -- which at the moment is ACCEPT -- after I'm certain there aren't any
> > packets dropping through to the policies, the default policies will
> > become DROP.
> > 
> > Good idea? Bad idea?
> 
> Not necessarily bad, but cautious is always safer.  If you log
> everything as the last rule in the chain, then the DROP policy takes
> effect,

So a LOG at the end performs a DROP, without an explicit DROP
statement following?

Oh. If the _policy's_ DROP, eh?

> you may have communications problems occasionally, but a quick
> look at the log will usually tell you what was dropped, so you can craft
> a rule to deal with it.  BTW, policy is an attribute of the chain
> itself, not a rule at the end. just:
> 
> iptables -P FORWARD DROP
> 
> > # OUTPUT:
> > /sbin/iptables -t filter -A OUTPUT \
> >  -o lo -j ACCEPT
> > /sbin/iptables -t filter -A OUTPUT \
> >  -o eth0 -j ACCEPT
> > /sbin/iptables -t filter -A OUTPUT \
> >  -o ppp0 -j ACCEPT
> 
> 
> Well, this pretty much lets anything out from the firewall box itself...

Yeah, for the moment that's OK..


> > 2) Is a default DROP rule (a rule that will catch any/everthing)
> > irrelevant on the FORWARD chain?
> 
> Far from it - most people treat a DROP rule on FORWARD and INPUT chains
> as the basic starting point.  Set a DROP policy on INPUT and FORWARD and
> then add rules to ACCEPT the desired traffic - INPUT for traffic to the
> firewall box, FORWARD for traffic from/to the machines behind it. 
> OUTPUT is less of a concern to most people, but for myself I've set a
> DROP policy there as well, and set up a dozen or so rules for the
> connections that the firewall itself needs to initiate.


> > 3) Can someone point me to a quick lesson on logging? At the moment
> > I've got the following:
> 
> http://iptables-tutorial.frozentux.net is the best tutorial around on
> iptables.  The quick and dirty:

Yup. It's excellent.

> iptables -A FORWARD -i eth0 -j LOG --log-prefix "FORWARDLogs:"
> 
> The log prefix is any string you want (within reason) and helps you find
> the log entries from a particular LOG rule with grep, among other uses. 

<snip>

> First suggestion - DROP policy on INPUT and FORWARD.

Got it..

> Second suggestion:
> 
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> these two rules will allow replies and related traffic (like FTP data
> related to FTP control).

I go right to this via a -j check:

#  chain check:
/sbin/iptables -t filter -N check
# chain check: ACCEPT's
/sbin/iptables -t filter -A check \
  -m state --state ESTABLISHED,RELATED -j ACCEPT
:
#  chain INPUT:
/sbin/iptables -t filter -A INPUT \
  -i ppp0 -j check
:
#  chain FORWARD:
/sbin/iptables -t filter -A FORWARD \
  -i ppp0 -j check


Thanks again..


- John
-- 
"Obviously, we do not want to leave zombies around."

