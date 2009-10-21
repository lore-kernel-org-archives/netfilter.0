From: John Lister <john.lister@kickstone.com>
Subject: Re: Query: Stateful parameters Explicitly and Implicitly defined,
 which is it?
Date: Wed, 21 Oct 2009 08:21:50 +0100
Message-ID: <4ADEB68E.6070803@kickstone.com>
References: <4ADE2689.4070707@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ADE2689.4070707@tssg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: William Fitzgerald <wfitzgerald@tssg.org>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

William Fitzgerald wrote:
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
>
I'm no expert, but i would usually have a rule that accepts any 
established connections first, followed by ones where the state is new 
and has the conditions you require. I've also added RELATED below as 
you'd often want those to be accepted by default as well.

iptables -a FORWARD -m state --state RELATED, ESTABLISHED -j ACCEPT
iptables -a FORWARD -i eth0 --dport 80 -m state --state NEW -j ACCEPT
...

John
