From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: IPv6 Router and NAT/connection tracking
Date: 20 Jun 2003 02:24:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056090288.4482.193.camel@alpha.newkirk.us>
References: <1074720319.1055981347734.JavaMail.Administrator@pumbaa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074720319.1055981347734.JavaMail.Administrator@pumbaa>
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
To: Internet Protocol version Six <inet6@mail.be>
Cc: netfilter@lists.netfilter.org

On Wed, 2003-06-18 at 20:09, Internet Protocol version Six wrote:
> I'm connected via IPv6-in-IPv4 and I have a /48 assigned to this
> box, and I want the box to act as a router for my machines which
> it's doing nicely, only the conntrack thing is annoying the hell
> outta me ;) Will that solve it (ACCEPTING in both directions)?
> 
> And so what you are saying is that I should do this?:
> iptables -I INPUT -p 41 -j ACCEPT
> iptables -I OUTPUT -p 41 -j ACCEPT
> iptables -I PREROUTING -p 41 -j ACCEPT -> not sure about this one
> 
> or am I wrong/forgetting something? :)
> 
> Thanks for your help, greatly appreciated

AFAIK that is correct.  (however the PREROUTING one wouldn't work, would
need to be NAT table, and would be unnecessary anyway since that chain
is supposed to have an ACCEPT policy - NAT in NAT table, filter in
FILTER table)  The two rules, INPUT and OUTPUT, should overcome any
failure of the state machine to recognize intermittent tunnel traffic as
ESTABLISHED.

Regarding 'internal' ipv6 traffic within your network, I suspect you
should be using ip6tables there if needed.  (ip6tables won't see 6in4
tunnel traffic though, since the tunnel itself is IPv4)

I haven't configured my gateway as an ipv6 router yet, however.  I have
a single address ATM from freenet6.  When I get the chance to tinker (a
few weeks from now at least) I want to configure ipv6 on my desktop as
well as my server and see what there is to see.

j



