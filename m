From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Output Chain Problem...
Date: Fri, 18 Jun 2004 14:02:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406181402.51862.Antony@Soft-Solutions.co.uk>
References: <005d01c45531$f6f4bfd0$800101df@lvl.digidyne.ca>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005d01c45531$f6f4bfd0$800101df@lvl.digidyne.ca>
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

On Friday 18 June 2004 1:44 pm, Eric Poulin wrote:

> Good Day,
>
>     I'm trying to harden a bit my firewall, who as been working perfectly
> in the last 2 years. However, on of the chain I have never played with was
> the OUTPUT chain. I never though that there could be a security breach with
> the Default policy set to "ACCEPT" on it, but it goes against security
> "best practices".
>
>     Now, packet flow through a chain from top to bottom, and will hit the
> Default Policy if no rules are match... My first test was to put those
> rules in my output chain(That was completly empty before).
>
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.0/24 -j ACCEPT
> iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

That second rule suggests to me that you are slightly mistaken about what 
packets go through the OUTPUT chain - you have allowed all packets sourced 
from an entire Class C, so I suspect you think that all packets from your 
local network, which pass through the Firewall, are traversing the OUTPUT 
chain?

In fact, the only packets which go through OUTPUT are those originating on the 
machine itself - any which are being routed through it go through FORWARD 
instead (and they don't go through INPUT, either...).

>     After this, I did try to set the Default policy to drop... Strangely, I
> lost my ssh connection(but as expected, all my NAT rules continued to work
> perfectly).

Do you mean for connections which were already in place (ESTABLISHED), or new 
ones which you set up after changing the rules?   Bear in mind that existing 
connections will largely be handled in the background, rather than by your 
ruleset - most rules only apply to the first packets of new connections.

> So I changed the policy to accept again, and decided to log
> every packet hitting the bottom of the chain(Without results, so I have
> added a general ACCEPT rule for testing):
>
>     To my surprise, nothing seems to hit my LOG rule, and even the overall
> ACCEPT rule... But again, as soon as I change the default policy to DROP, I
> can't communicate with the box.

And when that happens, do you get any packets LOGged before being DROPped?

I'm not too surprised nothing gets logged when it's working (as I explained 
above, those will probably be established connections), however I *would* 
expect something to get logged when you cannot connect.   Basically, you want 
to log when there's a problem, not when it's working fine :)

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


