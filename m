From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: cant ping fw
Date: Wed, 06 Jul 2005 13:37:25 +0200
Message-ID: <42CBC275.2090003@mnemon.de>
References: <42CBBE57.5060802@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42CBBE57.5060802@eccotours.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Brent Clark schrieb:
> Hi list
> 
> I soo close to pulling my hair out on this
> 
> I have a webserver with the following ruleset (default policy of drop)
> 
> $IPT -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -t filter -A INPUT -m state --state INVALID -j LOG --log-prefix
> "INVALID input: " --log-tcp-options --log-ip-options
> $IPT -t filter -A INPUT -m state --state INVALID -j DROP
> $IPT -t filter -A INPUT -d 217.199.186.255 -j DROP
> $IPT -t filter -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
> $IPT -t filter -A INPUT -p tcp --dport 20 -m state --state NEW -j ACCEPT
> $IPT -t filter -A INPUT -p tcp --dport 21 -m state --state NEW -j ACCEPT
> $IPT -t filter -A INPUT -p tcp --dport 25 -m state --state NEW -j ACCEPT
> #$IPT -t filter -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
> $IPT -N SSH_Brute_Force
> $IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name
> SSH --set --rsource -j SSH_Brute_Force
> $IPT -A SSH_Brute_Force -s 196.36.10.114 -j ACCEPT
> $IPT -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3
> --name SSH --rsource -j ACCEPT
> $IPT -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
> $IPT -A SSH_Brute_Force -p tcp -j DROP
> 
> $IPT -t filter -A INPUT -p tcp --dport 10000 -m state --state NEW -j ACCEPT
> $IPT -t filter -A INPUT -p tcp --dport 113 -j REJECT --reject-with
> icmp-host-unreachable
> $IPT -t filter -A INPUT -p tcp -m multiport --dport 135,137,139 -j DROP
> $IPT -t filter -A INPUT -p icmp --icmp-type source-quench -j ACCEPT
> $IPT -t filter -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT
> $IPT -t filter -A INPUT -p icmp --icmp-type destination-unreachable -j
> ACCEPT
> $IPT -t filter -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
> $IPT -t filter -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
> #$IPT -t filter -A INPUT -p icmp --icmp-type ! echo-request -j LOG
> $IPT -t filter -A INPUT -j LOG --log-prefix "[INPUT  DROP]: "
> --log-tcp-options --log-ip-options
> $IPT -t filter -A INPUT -j DROP
> 
> and for the likes on my I cant work out why I cant ping the machine
> even localhost, does not return anything

Is this really the complete rule set ? No rules in OUTPUT and FORWARD,
but policy set to DROP ? Anyway.

There is no rule for lo. Add

$IPT -<I | A> INPUT -i lo -j ACCEPT
$IPT -<I | A> OUTPUT -o lo -j ACCEPT

and for echo reply add

$IPT -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

This should work.

Have a nice time,

Joerg


