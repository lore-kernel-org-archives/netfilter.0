From: James Lay <jlay@slave-tothe-box.net>
Subject: Re: [help] modern iptables rule for transproxy
Date: Sat, 12 Jan 2008 07:58:01 -0700
Message-ID: <C3AE2389.18980%jlay@slave-tothe-box.net>
References: <200801121059.m0CAxZdG008224@betty.it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801121059.m0CAxZdG008224@betty.it.uc3m.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

On 1/12/08 3:59 AM, "Peter T. Breuer" <ptb@inv.it.uc3m.es> wrote:

> Amos Jeffries wrote:
>> Peter T. Breuer wrote:
>>> I'd be much obliged if somebody could give me a modern iptables
>>> equivalent for this ipchains rule
>>> 
>>>    ipchains -A input -p tcp -d 0.0.0.0/0 80 -j REDIRECT 8081
>> 
>> My auto-generated FW has this (with suitable replacements):
>> 
>> iptables -t nat -A PREROUTING -i $LOCAL_IFACE -p tcp -s ! $PROXY_BOX \
>> --dport 80 -j REDIRECT --to-ports 8081
> 
> Yes, thanks. I've been trying variants on that for some time, with no
> success. Stracing the tproxy daemon on port 8081 shows no sign of
> activity at all when I do a
> 
>    telnet news.bbc.co.uk 80
> 
> for example. Is there a canonical way to debug iptables? I'm sure there
> must be. tcpdump shows nothing on port 8081 on any interface I can think
> of, but the telnet news.bbc.co.uk 80 gets through! It must be avoiding
> the REDIRECT somehow.
> 
> 
> The tproxy is clearly bound to port 8081
> 
>    bind(4, {sa_family=AF_INET, sin_port=htons(8081),
> sin_addr=inet_addr("0.0.0.0")}, 16) = 0
>    listen(4, 128)                          = 0
> 
> and is stuck in an accept.
> 
> iptables --t nat -L shows
> 
>   Chain PREROUTING (policy ACCEPT)
>   target     prot opt source               destination
>   REDIRECT   tcp  -- !<proxyhost>          anywhere            tcp dpt:www
> redir ports 8081
> 
> and nothing else. The builtins' rules (INPUT, etc.) are all empty.
> 
> When I try and talk to port 80 on a distant machine, I ought to be making a
> socket which is bound to it with a high local port number. I can see net
> traffic from distant port 80s to high ports on my machine with tcpdump,
> but no sign of anything stirring on port 8081.

Bridging?

$IPTABLES -t nat -I PREROUTING -m physdev --physdev-in $INTIF -p tcp --dport
80 -j REDIRECT --to-ports 3128

James


