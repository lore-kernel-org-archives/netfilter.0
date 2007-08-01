From: Martijn Lievaart <m@rtij.nl>
Subject: Re: UDP port redirect
Date: Wed, 01 Aug 2007 08:07:23 +0200
Message-ID: <46B0231B.9050507@rtij.nl>
References: <OF83D375B4.D0B6CF03-ON83257329.007CF9E3-83257329.007EC41C@powers.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF83D375B4.D0B6CF03-ON83257329.007CF9E3-83257329.007EC41C@powers.com.br>
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
To: thiago@powers.com.br
Cc: netfilter@lists.netfilter.org

thiago@powers.com.br wrote:
> Hello all,
>
> I got a problem when redirecting a UDP port. The rules are:
>
> # TCP port redirect - working fine:
>
> iptables -t nat -A PREROUTING -i <ext_if> -p tcp -d <ext_ip> --dport 22 -j
> DNAT -m state --state NEW --to <int_ip>:1194
> iptables -A FORWARD -i <ext_if> -p tcp -d <int_ip> --dport 1194 -m state
> --state NEW -j ACCEPT
>
> # UDP port redirect - not going through
>
> iptables -t nat -A PREROUTING -i <ext_if> -p udp -d <ext_ip> --dport 22 -j
> DNAT -m state --state NEW --to <int_ip>:1194
> iptables -A FORWARD -i <ext_if> -p udp -d <int_ip> --dport 1194 -m state
> --state NEW -j ACCEPT
>
> I hit the nat/prerouting rule, but never reach the filter/forward one.
> As you can see the only change I've made from the tcp rule to udp rule, is
> just the matching protocol.
> I can debug it a little more, but also would like to hear from you guys if
> you have any hints.
>   

Not sure why this doesn't work, but you don't need the state match in 
the NAT rule.

iptables -t nat -A PREROUTING -i <ext_if> -p udp -d <ext_ip> --dport 22 -j DNAT  --to <int_ip>:1194
iptables -A FORWARD -i <ext_if> -p udp -d <int_ip> --dport 1194 -m state --state NEW -j ACCEPT


should work.

You may want to add an explicit LOG rule:

iptables -A FORWARD -i <ext_if> -p udp -d <int_ip> --dport 1194 -j LOG --log-prefix "WRONG: "

or even

iptables -A FORWARD -p udp --dport 1194 -j LOG --log-prefix "WRONG: "


after the ACCEPT rule to debug this.

M4



