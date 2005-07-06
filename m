From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: cant ping fw
Date: Wed, 06 Jul 2005 14:29:12 +0200
Message-ID: <42CBCE98.2050004@mnemon.de>
References: <42CBBE57.5060802@eccotours.dyndns.org>
	<42CBC275.2090003@mnemon.de>
	<42CBC8B9.8090605@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42CBC8B9.8090605@eccotours.dyndns.org>
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

Hi Brent,

Brent Clark schrieb:

> here is my OUTPUT
> 
> $IPT -t filter -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -t filter -A OUTPUT -m state --state INVALID -j LOG --log-prefix
> "INVALID output: " --log-tcp-options --log-ip-options
> $IPT -t filter -A OUTPUT -m state --state INVALID -j DROP
> $IPT -t filter -A OUTPUT -m state --state NEW -j ACCEPT
> $IPT -t filter -A OUTPUT -j LOG --log-prefix "[OUTPUT DROP]: "
> --log-tcp-options --log-ip-options
> $IPT -t filter -A OUTPUT -j DROP
> 
> and for my lo
> 
> $IPT -A INPUT -i lo -j ACCEPT
> $IPT -A OUTPUT -o lo -j ACCEPT

Looking closer to your rules, I see these possibilities:

1.) For some reasons echo-request are considered INVALID. This should
    show up in your logs.
2.) You ping 217.199.186.255 :)
3.) Your client doesn't find fw
4.) /proc/sys/net/ipv4/icmp_echo_ignore_all is set to 1

echo-replies are in state ESTABLISHED, so there is no problem with your
OUTPUT chain. I don't know the real reason, but I have a feeling, that
4.) is the best bet.

HTH and have nice time,

Joerg


