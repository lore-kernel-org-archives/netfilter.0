From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Iptables efficiency, order of execution
Date: Fri, 06 May 2005 23:52:20 -0500
Message-ID: <427C4984.6060907@riverviewtech.net>
References: <427B8CC5.6070003@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427B8CC5.6070003@danbbs.dk>
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
To: netfilter <netfilter@lists.netfilter.org>

(Dough! Ctrl+Enter != Ctrl+End)

Mogens Valentin wrote:
> Sometimes questions pop up on various network lists about execution
> order of rules.
> Such questions are usually dealt with per example, but I sometimes
> ponder about general guidelines, or try to logically derive my own.

Generally I like to put the rule(s) that will match the highest percentage of the time at / towards the top of the list followed by the next highest percent matched rules on down the list to the less / least likely to match at the bottom.  The idea behind this is to have the most common packets match rules at the top (start) of the list so they have to traverse as few rules as possible.

If you are going to have a LARGE block of IPs that you are going to match on, namely each IP in a class B I would divide the logic up in to multiple smaller segments in sub chains.  Namely I would break the rules up such that there would be a MAXIMUM of 34 rules to process for the entire 65536 IP network.  This may seem like a lot of work to just break the rules up to make it more efficient for matching, but keep in mind that each rule that you have to match against will take time to process.  So when you are talking about needing to process 65536 different IPs that would be a LOT of rules where as you could get to the EXACT RULE you wanted out of 65536 rules in just 34 rules.  I would call that really good efficiency.  Conversely you could use the same methodology to match on just a class C or all the class Cs in a class B in a MAXIMUM of 16 rules to get down to the IP or class C networ
 k.  Below is a (partial) hypothetical script:  (There are more points below too.)

iptables -t filter -A FORWARD -j 16_0
# 16_0 192.168.0.0/16
iptables -t filter -A 16_0 -s 192.168.0.0/18 -j 18_0
iptables -t filter -A 16_0 -s 192.168.64.0/18 -j 18_64
iptables -t filter -A 16_0 -s 192.168.128.0/18 -j 18_128
iptables -t filter -A 16_0 -s 192.168.192.0/18 -j 18_192
# 18_0 192.168.0.0/18
iptables -t filter -A 18_0 -s 192.168.0.0/20 -j 20_0
iptables -t filter -A 18_0 -s 192.168.16.0/20 -j 20_16
iptables -t filter -A 18_0 -s 192.168.32.0/20 -j 20_32
iptables -t filter -A 18_0 -s 192.168.48.0/20 -j 20_48
### <snip>
# 20_0 192.168.0.0/20
iptables -t filter -A 20_0 -s 192.168.0.0/22 -j 22_0
iptables -t filter -A 20_0 -s 192.168.4.0/22 -j 22_4
iptables -t filter -A 20_0 -s 192.168.8.0/22 -j 22_8
iptables -t filter -A 20_0 -s 192.168.12.0/22 -j 22_12
### <snip>
# 22_0 192.168.0.0/22
iptables -t filter -A 22_0 -s 192.168.0.0/24 -j 24_0
iptables -t filter -A 22_0 -s 192.168.1.0/24 -j 24_1
iptables -t filter -A 22_0 -s 192.168.2.0/24 -j 24_2
iptables -t filter -A 22_0 -s 192.168.3.0/24 -j 24_3
### <snip>
# 24_0 192.168.0.0/24
iptables -t filter -A 24_0 -s 192.168.0.0/26 -j 26_0
iptables -t filter -A 24_0 -s 192.168.0.64/26 -j 26_64
iptables -t filter -A 24_0 -s 192.168.0.128/26 -j 26_128
iptables -t filter -A 24_0 -s 192.168.0.192/26 -j 26_192
# 26_0 192.168.0.0/26
iptables -t filter -A 26_0 -s 192.168.0.0/28 -j 28_0
iptables -t filter -A 26_0 -s 192.168.0.16/28 -j 28_16
iptables -t filter -A 26_0 -s 192.168.0.32/28 -j 28_32
iptables -t filter -A 26_0 -s 192.168.0.48/28 -j 28_48
### <snip>
# 28_0 192.168.0.0/28
iptables -t filter -A 28_0 -s 192.168.0.0/30 -j 30_0
iptables -t filter -A 28_0 -s 192.168.0.4/30 -j 30_4
iptables -t filter -A 28_0 -s 192.168.0.8/30 -j 30_8
iptables -t filter -A 28_0 -s 192.168.0.12/30 -j 30_12
### <snip>
# 30_0 192.168.0.0/30
iptables -t filter -A 30_0 -s 192.168.0.0/32 -j 32_0
iptables -t filter -A 30_0 -s 192.168.0.1/32 -j 32_1
iptables -t filter -A 30_0 -s 192.168.0.2/32 -j 32_2
iptables -t filter -A 30_0 -s 192.168.0.3/32 -j 32_3
### <snip>
# 32_0 192.168.0.0/32
#    You would put any rules that were specific to 192.168.0.0 here.
# 32_1 192.168.0.1/32
#    You would put any rules that were specific to 192.168.0.1 here.
# 32_1 192.168.0.2/32
#    You would put any rules that were specific to 192.168.0.2 here.
# 32_1 192.168.0.3/32
#    You would put any rules that were specific to 192.168.0.3 here.

You should probably start with fairly simple rules at the start of your firewall as they will process faster.  Put your more complex match rules in as specific areas as possible so that as few packets need to traverse them as possible.

Below are some rules ideas that I generally use that are not specifically performance related but more just general good ideas in firewalls.

If you want to have rules that check and REJECT specific types of source IP addresses, namely bogons, create a chain that will do it for you.  Do the same with your destination IP addresses.  This way you could call this chain from any other chain and be sure that your source and / or destination IP addresses are valid.

I personally tend to think that client programs should talk out ephemeral ports and talk to privileged or ephemeral ports and that privileged ports should talk to ephemeral ports and never directly privileged ports.  Translation low ports can talk to hi ports only.  High ports can talk to low or high ports.

You should really rely on some sort of stateful packet matching, be it the basic state match extension or the conntrack match extension.

For your basic NAT firewall / router you really don't need any inbound ports, save possibly for SSH for remote management.

Decide if you will DROP or REJECT inbound (from the net) packets that you did not solicit and stick with this policy through out your firewall.



Grant. . . .

