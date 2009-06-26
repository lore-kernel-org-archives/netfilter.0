From: Ramunas Vabolis <ramuva@openoffice.lt>
Subject: Re: raw table and NOTRACK target
Date: Fri, 26 Jun 2009 16:09:44 +0300
Message-ID: <20090626130944.GA18792@openoffice.lt>
References: <20090625130555.GB9856@openoffice.lt> <1246000121.3985.5.camel@casper.meteor.dp.ua> <20090626074317.GA11753@openoffice.lt> <1246020740.3985.11.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1246020740.3985.11.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Hello again, 

> If I've got it right you are trying to do DNAT. The problem was that
> everything was not being traced by conntrack, this is what you've
> already fixed.
	Yes, I'm trying to do some DNAT, but still got a long way to go.
 
> Next, as you've told in further message nothing block that traffic in -t
> filter, that's good.
> 
> Next, show as the actual DNAT rules and check the counters encrease as
> you trying to connect.
> 
> You can also check whether the connection is actually being tracked by
> analizing output of "conntrack -L" or "conntrack -E"
	
	The problem is that I'm stuck at step.1 - excluding items from
NOTRACK. As soon as I add rules with RETURN in raw table, packets are
dropped somewhere. To reproduce:

I've got a host, which connects with lynx to any website.

In router there no DROP rules in FORWARD and single line in raw table:
/sbin/iptables -t raw -A PREROUTING -j NOTRACK

Host connects to any remote host port 80.

As soon as I add two lines with -j RETURN in raw table (so the entries 
are tracked) I experience the same effect as I've added -j DROP: 

/sbin/iptables -t raw -I PREROUTING -p tcp -s host.ip --dport 80 -j RETURN
/sbin/iptables -t raw -I PREROUTING -p tcp -d host.ip --sport 80 -j RETURN

are acting as I've made these rules:

/sbin/iptables -t raw -I PREROUTING -p tcp -s host.ip --dport 80 -j DROP
/sbin/iptables -t raw -I PREROUTING -p tcp -d host.ip --sport 80 -j DROP

I've tried replacing RETURN with ACCEPT with same results. As soon as I
remove those 2 rules, host.ip can connect to remote 80 port. 
