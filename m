From: Jason Opperisano <opie@817west.com>
Subject: Re: specifying -m state --state NEW (Was : --policy DROP kills
	everything?)
Date: Fri, 10 Jun 2005 15:33:24 -0400
Message-ID: <20050610193324.GA6604@bender.817west.com>
References: <42A78007.7080504@edoceo.com>
	<20050609062511.8AD978EDCEB@smtp.sterenborg.info>
	<20050610180827.GA6276@bender.817west.com>
	<1118430816.8207.44.camel@sonea.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1118430816.8207.44.camel@sonea.sterenborg.info>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Jun 10, 2005 at 09:13:36PM +0200, Rob Sterenborg wrote:
> On Fri, 2005-06-10 at 14:08 -0400, Jason Opperisano wrote:
> > On Thu, Jun 09, 2005 at 08:26:38AM +0200, Rob Sterenborg wrote:
> > > If -m state is not specified then, in my experience, -m state --state
> > > NEW is assumed (someone please correct me if I'm telling nonsense here)
> > > so your rules *will* allow new connections.
> > 
> > that is; indeed, nonsense.
> 
> In that case I don't understand why both rules seem to do the same job.
> Both :
> 
> $ipt -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
> 
> and :
> 
> $ipt -A INPUT -i eth0 -m state --state NEW -p tcp --dport 22 -j ACCEPT
> 
> only work in combination with :
> 
> $ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> At least, here it does.

using "-m state --state NEW" in your rules pretty much forces you into
using the "-m state --state RELATED,ESTABLISHED" rule (this is not a bad
thing).  the first rule:

  -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT

will not consider the state of the packet in the decision to match this
rule. it will match NEW, ESTABLISHED, RELATED, etc...as long as the
input interface is eth0 and the destination port is TCP 22.

> I was just looking at Oskar's tutorial where I read that the state
> matches are explicit thus have to be specifically loaded for them to
> work. Does this means that if I don't specify a state match in a rule,
> the rule just won't match any state ?

correct.  just like not specifying "-d w.x.y.z" means the rule will
match any destination IP address; not specifying "-m state --state X"
means the rule will match a packet in any state.

> Assuming that that's true in the first rule, a packet coming in on port
> 22 would be accepted regardless of state ?

yes.

> In practice I know that that's not true because when I use the first
> rule without accepting RELATED or ESTABLISHED, I *cannot* connect to
> sshd. When I add the RELATED,ESTABLISHED accept rule, I *can* connect to
> sshd. (And this is how I would expect it to work.)

i would question your testing methodology, as you can run a functional
iptables firewall without using state matches at all.

> So, what is the difference in specifying and not specifying --state NEW
> in a rule ?

the difference is whether you want to match only NEW packets or not.
commercial firewalls like Cisco PIX and Check Point FW-1 enforce
something along the lines of:

  -p tcp --tcp-flags ALL SYN -m state --state NEW

in the decision of whether a packet should be allowed to traverse the
filter rules or not.

in the world of netfilter--you write the rules, you decide how specific
the match will be.  if you want to say, this rule only matches NEW TCP
SYN packets, then use a construct like the above--you can even use
variables to simplify your scripts, like so:

  TCP_REQ="-p tcp --tcp-flags ALL SYN -m state --state NEW"
  iptables -A INPUT $TCP_REQ --dport 22 -j ACCEPT

-j

--
"Brian: Congratulations, Peter. You're the Spalding Gray of crap."
        --Family Guy

