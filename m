From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rules not taking effect - 2nd try
Date: Fri, 18 Oct 2002 09:25:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021018082552.QOKH292.mta03-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210171713000.6045-100000@altaica.tigerknight.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210171713000.6045-100000@altaica.tigerknight.org>
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
To: netfilter@lists.netfilter.org

On Friday 18 October 2002 1:32 am, Tib wrote:

> When I write this rule at the command prompt:
>
> iptables -t nat -A PREROUTING -p tcp -d 216.36.67.63 --dport 40000:40200
> -j DNAT --to-destination 192.168.1.22
>
> it gets added to the table/chain correctly, but does not take effect. IE
> if you telnet to 216.36.67.63 on port 40000, it does not get forwarded to
> 192.168.1.22 as it should.

Are you also adding the corresponding FORWARD rule to actually allow the 
packets through the firewall ?

> This rule was already in existance and working fine:
>
> iptables -t nat -A PREROUTING -p tcp -d 216.36.67.63 --dport 4996:5000
> -j DNAT --to-destination 192.168.1.4
>
> But when I flushed it (iptables -t nat -F or iptables -t nat -C PREROUTING
> -D 1), the rule still worked even though iptables -t nat -L showed a blank
> prerouting ruleset.
>
> > You mention -t nat specifically.
>
> Yes, I'm not sure what this comment means though.

I think you need to read some of the documentation available at 
http://www.netfilter.org/documentation in order to learn about filtering, 
address translation, and the differe chains/tables used within netfilter.

> > If your FORWARD chain (I'm assuming this is a routing firewall) contains
> > a rule to allow ESTABLISHED packets then further packets in a connection
> > stream will continue to pass through the firewall even if you remove the
> > rule/s which originally allowed the connection to get set up.
>
> So as soon as the connection is gone, it would time out and the new rules
> would apply?

No, I was assuming you had the standard default DROP policy (you haven't) and 
a FORWARD rule to accept ESTABLISHED,RELATED connections (you haven't).

> > What exactly are you trying to do ?   What rules are you trying to
> > remove, or what traffic are you trying to block ?
>
> Ok - here's my setup:
>
> DSL connection
>
> router (which forwards all traffic by default to linux box)
>
> linux box (acts as default gateway/masquerade box for internal network.
>
> ||         has web/mail/etc services on it which router forwards traffic
> ||         to)
>
> internal network (192.168.1.x - has a host that I am running a program on
>                   that I want incoming connections to reach. it uses ports
>                   40000 to 40200)
>
> Here's the ruleset:

Please can you post your rules again, but this time post the rules 
themselves, not the output from iptables -L   The listing output (a) doesn't 
contain allthe information we need to understand what rules you have, and (b) 
is more confusing (at least for me) because that'snot how I write my rules.

Antony.

-- 

I vote "no" to this proposal to form a committee to investigate whether we 
should or should not hold a ballot on whether to vote yet.

