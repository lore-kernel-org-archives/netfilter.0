From: Ramunas Vabolis <ramuva@openoffice.lt>
Subject: Re: raw table and NOTRACK target
Date: Fri, 26 Jun 2009 10:43:17 +0300
Message-ID: <20090626074317.GA11753@openoffice.lt>
References: <20090625130555.GB9856@openoffice.lt> <1246000121.3985.5.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1246000121.3985.5.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> > 
> Pay attention to order. As far as I understood your rule order is like
> this:
> 
> -t raw -A PREROUTING -j NOTRACK
> -t raw -A PREROUTING -p tcp -s host.ip --dport 80 -j RETURN
> -t raw -A PREROUTING -p tcp -d host.ip --sport 80 -j RETURN
<skipped>
Thank you for pointing this out, but I already well aware of that.
That's why I'm using -I to prepend rules to begining of the chain.

The first rule is hit - I can verify that with iptables -t raw -vxnL.
But it seems if packet is RETURNed of ACCEPTed in raw chain it is
removed from further processing (I'm running tcpdump on my router and I
see packet entering in local interface but it does not appear in my
outgoing interface). 

So exact steps to replicate the behaviour:

iptables -t raw -A PREROUTING -p tcp -s real.ip --dport 80 -j RETURN
iptables -t raw -A PREROUTING -p tcp -d real.ip --sport 80 -j RETURN
iptables -t raw -A PREROUTING -j NOTRACK

running lynx http://any.host.com from real.ip

running tcpdump on inner interface:
tcpdump -i ethlocal -n host real.ip and port 80 

does show connection attempts while 
tcpdump -i ethoutside -n host real.ip and port 80 
is silent.

iptables -t raw -vxnL shows that first rule is hit couple times, the
second rule is never hit.
