From: Gabriel <jarod125@yahoo.com>
Subject: Re: weird iptables behaviour
Date: Fri, 16 Sep 2005 11:48:30 -0700 (PDT)
Message-ID: <20050916184830.48778.qmail@web60914.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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


> --- /dev/rob0 <rob0@gmx.co.uk> wrote:
> 
> On Friday 2005-September-16 00:45, Grant Taylor wrote:
> > > On the openvpn box, FORWARD policy is DROP, so I
> did
> > > "iptables -I FORWARD -i tap0 -j ACCEPT" and thought
> > this
> > > should do the trick. But I was wrong. The only
> solutions I
> >
> > First of all you will need to have a corresponding
> rule:
>
> iptables -I FORWARD -o tap0 -j ACCEPT
>
> To allow traffic in the reverse direction too.
> 
> Better yet, the usual stateful rule:
> iptables -I FORWARD -m state --state RELATED,ESTABLISHED
> -j ACCEPT

I'm sorry, I forgot to mention I already have the stateful
rule in the chain. It's not in the first position, but I
don't think that matters because I issued a few consecutive
"iptables -L FORWARD -v" and, from what I could tell, all
the ping packets hit the default (DROP) policy, so this
means the packets did not match either the first (-i tap0
-j ACCEPT) rule (which is normal, since only the first ping
packet matches that), or the stateful rule (which is
somewhere down in the chain and _should_ have been matched
by the other ping packets).
 
> Did you compile your bridging support with bridge-nf 
> support?  If you did you will need to do some more work
to > allow your traffic to pass through.  This is because
> the bridge-nf code allows IPTables to see the traffic
that
> is passing on layer 2 as if it was on layer 3. 
 
Yeah, apparently I have CONFIG_BRIDGE_NETFILTER=y. But
still, from what I know, the "-i tap0 -j ACCEPT" and the
stateful rule should be enough. The packet comes in on
tap0, should get through and the reply should match the
stateful rule.
 
> Thus you will> probably need a rule like this:
>
> iptables -I FORWARD -i br0 -o br0 -j ACCEPT
 
I don't understand this rule. Does it mean that what comes
on any of the bridged interfaces can go to any (other)
bridged interface(s)?

P.S.: Sorry for the private reply, /dev/rob0. I didn't look
at the "To:" field...


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

