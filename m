From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Wed, 13 Apr 2005 20:23:05 -0500
Message-ID: <425DC5F9.5020308@riverviewtech.net>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter@lists.netfilter.org

> $IPTABLES -t filter -P INPUT   DROP
> $IPTABLES -t filter -P OUTPUT  DROP
> $IPTABLES -t filter -P FORWARD DROP
>  
> $IPTABLES -t filter -A INPUT   -j DROP_CHAIN
> $IPTABLES -t filter -A OUTPUT  -j DROP_CHAIN
> $IPTABLES -t filter -A FORWARD -j DROP_CHAIN
>   
> $IPTABLES -t filter -A INPUT  -i $LOOPBACK_INTERFACE -j ACCEPT
> $IPTABLES -t filter -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT

I personally do not like the idea of using a unified chain like this b/c you can run in to some sticky problems if you use the "-i" or "-o" parameters depending on what chain is ultimately calling the chain you created.  Consider for example you have a rule in your DROP_CHAIN like the ones below when you are processing a packet that is inbound you will jump from the INPUT chain to the DROP_CHAIN where you have a rule that uses the "-o" parameter which is illegal in the INPUT chain or any chain called by the INPUT chain.  Unified chains like the one that you are proposing are quite often limited in such that they can not match against the in or out interface.  However if you wanted to have something in your chain which matched for source or destination IP that would be fine, i.e. match any thing that is from or to any multicast IP addresses could easily be processed in this chain.

However if you really want to use a unified chain add a couple of rules to your DROP_CHAIN like the following.

$IPTABLES -t filter -A DROP_CHAIN -i ! lo -s 127.0.0.0/8 -j DROP
$IPTABLES -t filter -A DROP_CHAIN -o ! lo -d 127.0.0.0/8 -j DROP

This will make any traffic that has a source address of 127.0.0.0/8 that did not come in via the lo interface get dropped.  Correspondingly any traffic that is not going out the lo interface with a destination of 127.0.0.0/8 will get dropped as well.  Though I'm not sure what will happen in the situation where you are calling a rule in the DROP_CHAIN during an INPUT chain traversal that uses the "-o" parameter.



Grant. . . .

