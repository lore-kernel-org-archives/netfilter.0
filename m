From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Query: Stateful parameters Explicitly and Implicitly defined,
 which is it?
Date: Wed, 21 Oct 2009 09:59:14 +0200
Message-ID: <4ADEBF52.7050602@chello.at>
References: <4ADE2689.4070707@tssg.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ADE2689.4070707@tssg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

netfilter-owner@vger.kernel.org wrote:
> Dear experts,
>
> If a rule has a state of NEW does it implicitly imply ESTABLISHED also?
>
> Looking at examples on the web I see references to both.
>
> For example to permit access to an internal Web server, which of the 
> straw-man rules are correct?
>
> Implicit Established Example:
> iptables -a FORWARD -i eth0 --dport 80 -m state --state NEW -j ACCEPT
>
> Explicit Established Example:
> iptables -a FORWARD -i eth0 --dport 80 -m state --state 
> NEW,ESTABLISHED -j ACCEPT

both are, but both miss: '-p tcp'; and its '-A' not '-a'.
It depends what your other rules in the ruleset do.
if you have some like:
iptables -A FORWARD -m state --ESTABLISHED -j ACCEPT
the first of the 2 rules above will work out, though the second will 
also work, just has this redundant state descriptor (which does not 
matter all).

To allow http traffic, without other rules:
iptables -A FORWARD -i eth0 -m tcp --dport 80 -m state --state 
NEW,ESTABLISHED -j ACCEPT
iptables -A FORWARD -o eth0 -m tcp --sport 80 -m state --state 
ESTABLISHED -j ACCEPT

>
> Similarly, I see reference to setting TCP flags as a control measure. 
> Particularly for port scanning etc. However sticking with the  Web 
> server example, an internal Web Server should expect a client to 
> initiate a connection (SYN flag) but the server itself should not do 
> this.
>
> example strawman-rules of the stateless kind:
> iptables -a FORWARD -i eth0 --dport 80 --tcp-flags SYN -j ACCEPT
>
> iptables -a FORWARD -o eth1 --sport 80 --tcp-flags ACK -j ACCEPT
>
> The thing is, what happens after the 3-way handshake? Incoming http 
> requests will no longer have a SYN flag set! So is there some implicit 
> knowledge that netfilter or other packet filters operate over?
>
Same as before, you need other rules to handle that. Usually I normalize 
TCP traffic, even before it hits the rules for the servers, but if i 
wouldn't do it globally, I'd rather write the rule like this:
iptables -A FORWARD -i eth0 -m tcp --dport 80 --tcp-flags SYN -m state 
--state NEW -j ACCEPT

> regards,
> Will.
>
hope it helps

regards

Mart

