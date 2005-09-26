From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: DNAT Rules.
Date: Mon, 26 Sep 2005 12:20:40 +0200
Message-ID: <4337CB78.6030302@mnemon.de>
References: <1057.192.168.1.22.1127673317.squirrel@192.168.1.22>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1057.192.168.1.22.1127673317.squirrel@192.168.1.22>
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
To: netfilter@lists.netfilter.org

Vincent Blondel wrote:
> Hi,
> 
> I am trying to configure next set up so a public host can connect to my web server located in a dmz.
> 
>                   -----------------------
>   public host --> |  eth1        eth2   | -->  web server
>     x.x.x.x       | 1.2.3.4    10.1.1.1 |      10.1.1.2:80
>                   ----------------------
> 
> As far as I can understand, this typically corresponds to a mix of DNAT, SNAT and FORWARD rules. Below you can find the
> rules I have configured until now.
> 
> #####################################################################
> 
> # Enable ip forward
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> # Unlimited traffic on the loopback interface
> iptables -A INPUT  -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT

Ok, until here.

> # Set the default policy to drop
> iptables --policy INPUT   DROP
> iptables --policy OUTPUT  DROP
> iptables --policy FORWARD DROP

This is more a philosophical question and is discussed on this list 
again and again. My opinion is to have a OUTPUT policy of ACCEPT and 
then dedicated DROP Rules where needed.

> iptables -t nat --policy PREROUTING  DROP
> iptables -t nat --policy OUTPUT      DROP
> iptables -t nat --policy POSTROUTING DROP
> 
> iptables -t mangle --policy PREROUTING  DROP
> iptables -t mangle --policy POSTROUTING DROP

Don't do that. Don't filter in nat and mangle. These tables are not 
intended for filtering.

> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 1.2.3.4

Yes.

> iptables -t nat -A PREROUTING -i eth1 -p tcp --sport 1024:65535 -d 1.2.3.4 --dport 80 -j DNAT --to-destination 10.1.1.2
> iptables -A FORWARD -i eth1 -o eth2 -p tcp --sport 1024:65535 -d 10.1.1.2 --dport 80 -m state --state NEW -j ACCEPT

I prefer to add --syn to the FORWARD rule.

> iptables -A FORWARD -i eth2 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth2 -m state --state ESTABLISHED,RELATED -j ACCEPT

These two rules can be rewritten to

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

It is not working because you set policies in mangle to DROP and there 
is no rule, that allows packets to pass mangle. But even if you add 
respective rules (or preferably set policies to ACCEPT) in mangle, it 
will probably not work, because nat/POSTROUTING has only a rule for 
outgoing packets via eth1. So the incoming SYN packet will be dropped, 
effectively terminating the connection.

HTH,

Joerg


