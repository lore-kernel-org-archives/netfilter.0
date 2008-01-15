From: Philip Craig <philipc@snapgear.com>
Subject: Re: [help] modern iptables rule for transproxy
Date: Wed, 16 Jan 2008 09:55:41 +1000
Message-ID: <478D47FD.8070402@snapgear.com>
References: <200801151933.m0FJXYGD011494@betty.it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801151933.m0FJXYGD011494@betty.it.uc3m.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ptb@inv.it.uc3m.es
Cc: netfilter@vger.kernel.org

Peter T. Breuer wrote:
> "Gonzalo Arana" wrote:
>> On Jan 12, 2008 8:59 AM, Peter T. Breuer <ptb@inv.it.uc3m.es> wrote:
>>>>>    ipchains -A input -p tcp -d 0.0.0.0/0 80 -j REDIRECT 8081
> 
>>>> iptables -t nat -A PREROUTING -i $LOCAL_IFACE -p tcp -s ! $PROXY_BOX \
>>>> --dport 80 -j REDIRECT --to-ports 8081
>>> Yes, thanks. I've been trying variants on that for some time, with no
>>> success.
> 
>>>   Chain PREROUTING (policy ACCEPT)
>>>   target     prot opt source               destination
>>>   REDIRECT   tcp  -- !<proxyhost>          anywhere            tcp dpt:www redir ports 8081
> 
> 
>> Perhaps your are running 'telnet news.bbc.co.uk 80' on the same box as
>> tproxy is running. 
> 
> Yes, indeed, that's the whole idea, and the objective, and the problem.
> There's no "perhaps" in it! That's the problem description. How to get
> outgoing http requests to distant port 80s to be redirected to a proxy
> daemon sitting on port 8081 of the LOCAL machine instead.

Then you need the rule in the OUTPUT chain. PREROUTING only sees forwarded
packets.  The problem with this though is that you need some way to stop
connections from the proxy being redirected too.  Maybe you can use the
owner match to specify the uid of the proxy process.  From a quick google,
there are some example rules for tor that do this:
http://wiki.noreply.org/noreply/TheOnionRouter/TransparentProxy
(You want local redirection, not middlebox.)

Note that the ipchains rule you gave is only for forwarded traffic too.
I don't recall whether ipchains supported local redirection.

>> If that's the case, telnet's connection may be using
>> <proxyhost> as source IP address.
> 
> What would be bad about that? And if it is bad, what would one do about
> it? I'm puzzled ...

Because the '-s ! $PROXY_BOX' means the rule will not match packets
that have proxyhost as the source IP address.

> What I don't do is get through to the tproxy daemon sitting on localhost
> 8081 when I telnet out to a distant host on its port 80. I don't know
> why. How does one debug iptables?!!!

Use 'iptables -t nat -L -n' and look at the packet counters to see which
rules are being matched.  (And if the policy counters go up then no
rules were matched.)

