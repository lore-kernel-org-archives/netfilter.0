From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: limit module not working with drop policy
Date: Sat, 23 Jan 2010 10:45:56 +0100
Message-ID: <4B5AC554.4040804@chello.at>
References: <4B591A79.2030600@infoservices.in>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B591A79.2030600@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 22.01.2010 04:25, netfilter-owner@vger.kernel.org wrote:
> Dear list,
> 
> My firewall policy is default drop.  But the limit module is not working
> here. I have the following rules to defeat ping flood
> 
> ``````````
> iptables -A INPUT  -p icmp -m limit --limit 3/minute -j ACCEPT
> iptables -A INPUT  -p icmp -j DROP
> ``````````````````
> and it is not working. The same rule set is working with default accept
> policy.  What modification should I need to make it working with drop
> policy firewall ?
> 
> Thanks
> 

> *filter
> :INPUT DROP [0:0]
> :FORWARD DROP [0:0]
> :OUTPUT DROP [0:0]
> -A INPUT -i lo -j ACCEPT
> -A INPUT -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -i eth0 -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state --state NEW -j DROP
> -A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 3/min -j ACCEPT
> -A INPUT -i eth0 -p icmp -j DROP
> -A OUTPUT -o lo -j ACCEPT
> -A OUTPUT -o eth0 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
> COMMIT
> # Completed on Sat Jan 23 12:26:49 2010


Hello,

Actually you should not need that '-A INPUT -i eth0 -p icmp -j DROP'
rule, as the DROP policy should catch it.
As i've been reading complains about the limit match being broken for
years, i suggest trying the 'hashlimit' match (maybe without the
--hashlimit-mode option).


best regards

Mart

