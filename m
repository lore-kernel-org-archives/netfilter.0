From: Silvio Fonseca <silvio.listas@pizzaroot.com.br>
Subject: Re: problems with port forwarding
Date: Fri, 23 Feb 2007 17:07:10 -0200
Message-ID: <200702231707.10350.silvio.listas@pizzaroot.com.br>
References: <45992f580702230807p39f8fcacr914ef910270ae2ba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45992f580702230807p39f8fcacr914ef910270ae2ba@mail.gmail.com>
Content-Disposition: inline
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

Hello Andres,

In your FORWARD rule, you should have destination tcp port 22 instead of 
10022, anyway, since the rule right below is "anywhere to anywhere ACCEPT", 
this shouldn't cause problems.

Regarding the LOGs not appearing, you need to move the LOG rule to be before 
the "action" rule.

Send us back what the logs are showing so we can have a better understanding.

Best Regards

Silvio Fonseca

> I need to forward a port from one server to another - and I'm having
> some trouble.
>
> I have a server (A) and I want connections to port 10022 in server A
> to be forwarded to port 22 in server B.
>
> I tough I got the procedure correctly, because it's working using
> another server (C) and server B.
>
> Anyway, here are the relevant tables:
>
> iptables -L --line-numbers -t nat
>
> Chain PREROUTING (policy ACCEPT)
> num  target     prot opt source               destination
> 1    DNAT       tcp  --  anywhere             anywhere            tcp
> dpt:ftp to:SERVER_B:22
> 2    LOG        all  --  anywhere             SERVER_B    LOG level debug
>
> Chain POSTROUTING (policy ACCEPT)
> num  target     prot opt source               destination
> 1    SNAT       tcp  --  anywhere             SERVER_B    tcp dpt:ssh
> to:SERVER_A
> 2    LOG        tcp  --  anywhere             SERVER_B    LOG level debug
>
> iptables -L FORWARD
>
> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere            state
> RELATED,ESTABLISHED
> REJECT     tcp  --  anywhere             anywhere            tcp
> flags:!SYN,RST,ACK/SYN reject-with tcp-reset
> DROP       all  --  anywhere             anywhere            state INVALID
> ACCEPT     tcp  --  anywhere             SERVER_B    tcp dpt:10022
> ACCEPT     all  --  anywhere             anywhere
> LOG        tcp  --  anywhere             SERVER_B    LOG level warning
>
> If I connect from server A to localhost, port 10022, it works. If I
> connect from any other machine to server A, port 10022, it doesn't.
>
> Any suggestions? I've been looking at this and making tests for a long
> time today and I can't find the error.
>
> By the way, I can't see any entries in the log...
>
>    Andres

