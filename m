From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Is this firewall good enough?
Date: Wed, 09 Jun 2004 04:11:05 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C61D59.1090505@linuxmail.org>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com> <200406081057.40137.Antony@Soft-Solutions.co.uk> <40C5D53A.9060407@linuxmail.org> <200406081623.15400.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406081623.15400.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

>>So to avoid loading the connection tracking module, I would put rules to
>>handle return packets in the proper chain.
>>
>>eg: iptables -A tcp_packets -p tcp --sport 1024:65535 --dport 80 -j ACCEPT
> 
> 
> That rule allows packets *to* port 80 - I was asking how you deal with *reply* 
> packets - the ones *from* port 80 on the remote server.

Sorry, the OP was about packets to his box and not from replies from a 
box he is trying to access.

iptables -A tcp_packets -p --sport 80 --dport 1024:65535 -j ACCEPT
> 
> 
>>Then i put tcp/udp/icmp packets to the proper chain
>>
>>eg: iptables -A INPUT -p tcp -j tcp_packets
>>
>>You could make a catch all for return packets like:
>>
>>iptables -A INPUT -p tcp ! --syn -j ACCEPT
> 
> 
> You seem to be advocating not using the ESTABLISHED,RELATED match - which 
> would render the firewall stateless (like ipchains) instead of stateful.   
> That seems a backwards step to me - or have I misunderstood something?
> 

Stateful is expensive. If you have a high traffic load, it is not worth 
it. The context is when the box is a server. If you are protecting your 
home box, by all means, use stateful.

