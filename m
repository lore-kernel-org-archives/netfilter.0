From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: safe default chain policies
Date: Fri, 2 Apr 2004 20:23:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404022023.17536.Antony@Soft-Solutions.co.uk>
References: <BAY16-F74E0ivR0wzGD000006a0@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY16-F74E0ivR0wzGD000006a0@hotmail.com>
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

On Friday 02 April 2004 8:02 pm, Philippe Anctil wrote:

> >The secure attitude uses the same argument as for FORWARD - you block all
> >traffic except that which you know you want and write ACCEPT rules for,
> > and you can then be sure your machine isn't communicating in any other
> > way than you want it to.
>
> Yes I understand this attitude is the base of building a secure firewall. I
> was actually applying it abusively.

 !?

> I find setting up the INPUT chain to DROP unquestionable. This is because
> traffic hitting this chain gives direct access to services on the main
> gate.

Agreed.

> Traffic hitting the OUTPUT originates from the firewall box itself. Why
> wouldn't we want a program to communicate outside? Because it is not
> authorized. What kind of unauthorized program could be installed on my box?
> Well this question does not exactly sounds like the right one. Who could
> install unauthorized programs on the box? Only those who have remote /
> physical access to the box. For an entreprise level filtering bug I'd
> probably go for a DROP. For my home network, I'll put it to ACCEPT.

That is a reasonable distinction, and a reasonable conclusion, IMHO.

> I may reconsider this, but my current ruleset does not make sense anyway:
>
> iptables -P OUTPUT DROP
> iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -s $internal_ip -j ACCEPT
> iptables -A OUTPUT -s $external_ip -j ACCEPT

I agree with you :)   This does not make sense - it is a totally open policy, 
because you have specified the only three source addresses a packet can 
possibly have, and decided to allow the traffic (which I do not necessarily 
disagree with).   You may as well just have iptables -P OUTPUT ACCEPT.

That is a reasonable thing to do on a home firewall IMHO.

> Now what about the FORWARD chain? Traffic hitting this chain has two
> possible origins and a corresponding destination.
>
> A. Local network traffic going outside. For my home network, I am not
> restricting  outgoing traffic. This type of traffic does not justify a
> restricted policy.

Okay, that's your choice, and it's a perfectly reasonable one.

> B. Outside traffic heading back (or even towards?) to the local network. I
> think the origin of the traffic totally justifies this chain to be set to
> DROP. There is no limit to what wacked attempts outsiders may try.

Agreed :)

> But allow me to argue a little more on the FORWARD table subject. This
> table tends to have very loose restrictions. Mine's like this:
>
> iptables -P FORWARD DROP
> iptables -A FORWARD -s $network_addr -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> Here I am trusting iptables entirely

Well, it is your firewall :)   Of course you must trust it.

> in the hypothesis someone more clever than me finds a way of tricking the
> state machine, too bad for 'me home network.

Agreed, but I do not believe such a trick has been discovered.

> How much more would I trust iptables if I were to configure
> this table with a default ACCEPT policy?

How *would* you configure this table with a default ACCEPT policy?   Or, to 
put it another way, if you had a default ACCEPT policy, what rule/s would you 
use for DROPping packets (as you say you do not want a totally open FORWARD 
chain from outside to inside....)?   I think it makes for a more complex 
setup.

> As I said above, I'll set FORWARD to DROP for my peace of mind. But I can't
> help thinking it does much of the work by itself.

The main reason I like setting a default DROP policy on FORWARD is that if I 
get one of the rules wrong, then something I want to work will not work, and 
I can spot it and correct it.   If I did it the other way round, with a 
default ACCEPT policy, then if I make a mistake, something I don't want to 
work will work, and it'll almost certainly be someone other than me who finds 
out and uses it :)

You can make a perfectly secure firewall with a default ACCEPT policy on 
FORWARD.   It's just harder to think of everything you need to DROP than it 
is to think of everything you want to ACCEPT under a default DROP policy.

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


