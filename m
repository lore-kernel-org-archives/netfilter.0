From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: Trying to setup two ethernet cards with two websites
Date: Tue, 31 Dec 2002 19:49:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A194EC9E-1CF0-11D7-8A13-000393950CC2@karlsbakk.net>
References: <se117fa8.025@butchers.com>
Mime-Version: 1.0 (Apple Message framework v548)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <se117fa8.025@butchers.com>
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
To: JUSTIN GERRY <JGERRY@butchers.com>
Cc: netfilter@lists.netfilter.org


On Tuesday, December 31, 2002, at 05:29 PM, JUSTIN GERRY wrote:

> I am attempting to setup two websites with two ip address, each one on 
> a
> different ethernet card/interface.
>
> It only seems to work for the first rule (first listed ip address) that
> gets matched up, so I can get one website to work but not the other. 
> How
> do I write this so it covers both address and allows httpd to go to
> either interface or either address? Can I write a single rule to match 
> a
> range of ip addresses (.93 and .94) instead of writing one for each
> individual address?
>
> This is what I have so far for testing.....
>
> IF1="eth0"
> IF2="eth1"
> IP2="172.30.12.93"
> IP1="172.30.12.94"
> UNPRIVPORTS="1024:65535"
>
> iptables -F
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
>
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

the two below...
> iptables -A INPUT -i $IF1 -p tcp --sport $UNPRIVPORTS -d $IP1 --dport
> 80 -m state --state NEW -j ACCEPT
> iptables -A INPUT -i $IF2 -p tcp --sport $UNPRIVPORTS -d $IP2 --dport
> 80 -m state --state NEW -j ACCEPT

...are included in these two, so you won't need both. You probably 
don't want those below, as they accept anything regardless to state.

> iptables -A INPUT -i $IF1 -p tcp --sport $UNPRIVPORTS -d $IP1 --dport
> 80 -j ACCEPT
> iptables -A INPUT -i $IF2 -p tcp --sport $UNPRIVPORTS -d $IP2 --dport
> 80 -j ACCEPT

are these really nessecary? with -P DROP, this'll deny any outgoing 
connections at all, regardless of protocol. It'll even drop ICMP 
packets, something you probably don't want.

> iptables -A OUTPUT -o $IF2 -p tcp ! --syn -s $IP2 --sport 80 --dport
> $UNPRIVPORTS -j ACCEPT
> iptables -A OUTPUT -o $IF1 -p tcp ! --syn -s $IP1 --sport 80 --dport
> $UNPRIVPORTS -j ACCEPT

To allow for multiple hosts in a rule, you can specify a mask (or 
number of bits). For instance:
# iptables -s 10.0.0.0/31
will match 10.0.0.0 and 10.0.0.1. .93 and .94, however, overlaps this 
and needs to be allowed for specifically.

so - try first with -P OUTPUT -j ACCEPT, and no rules in the OUTPUT 
chain. It shouldn't be any problem then.

roy


