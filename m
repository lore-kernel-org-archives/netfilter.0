From: Mark Ord <lists@losthorizons.mailshell.com>
Subject: Re: Forwarding non local packets to loopback with iptables?
Date: Tue, 14 Sep 2004 09:31:49 +1000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040913233149.GA2378@scholars.home>
References: <20040907114859.GA13315@scholars.home>
	<1094603729.1751.34.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1094603729.1751.34.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Sep 08, 2004 at 08:34:07AM +0000, opie at 817west. com Wed Sep 8 02 wrote:

> On Tue, 2004-09-07 at 07:49, Mark Ord wrote:
> > 
> > What I want to do is set up a SSH tunnel to another machine, behind
> > another firewall, and use the eth1 aliases to access the remote machines from my
> > local network (eth1) and the iptables machine. I tried to set this up
> > before with iptables, failed, 
> 
> can we revisit why that failed, perhaps?

Basically being new to iptables at the time. I set up NAT, firewall and
the internet -> internal forwardings I wanted, had a crack at setting up
what I described in the original email, couldn't get it to work, discovered
rinetd, and went with that.

Now, months later, that I know a lot more about using iptables, I decided to
try again.

> > Last time I tried to establish this with iptables, I got nowhere. This time
> > around I got it working on the iptables machine with:
> > 
> > $IPTABLES -t nat -I OUTPUT -p tcp -s 192.168.0.128 --dport 3389 \
> >         -j DNAT --to 127.0.0.1:13389
> >    .. etc .. for each address and port required.
> > 
> > Connecting to 129.168.0.128 port 3389 takes me where I want - down the
> > ssh tunnel, to machine on the remote network.
> 
> this isn't exactly a great test scenario, as you're testing locally on
> the box itself, which will not cleanly extrapolate to the forwarding
> scenario.

Well, I want to be able to connect to 192.168.0.128 from the firewall box
itself (working) in addition to being able to from the rest of the
192.168.0.0/24 network (not working).

> > Is it possible to achieve this with iptables (redirecting traffic coming in
> > on eth1 (for eth1:?) to a port on 127.0.0.1), and if so, what rules are
> > required?
> 
> no.

Thanks.

> but since you have dedicated IP addresses per host--why aren't you
> just DNAT-ing from the IP on eth1 directly to the host that should
> receive the traffic (i believe this is the "previously failed"
> scenario)?

Because what is bound to 192.168.0.128 (in reality to the loopback, which
192.168.0.128 is supposed to forward to) are via ssh port forwards to a
machine behind another firewall, with non-routable addresses. The idea is to
connect to 192.168.0.128, but actually end up connected to a machine that is
out on the internet, not something physically on the LAN.

Thanks for the response,
Mark.


