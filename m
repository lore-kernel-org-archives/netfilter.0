From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: block port 137
Date: Wed, 4 Aug 2004 08:03:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408040803.02568.Antony@Soft-Solutions.co.uk>
References: <267354A234DF4D46AA6AE56E1240BEF004A3BF@tv.wcslnet.net> <200408030717.59289.Antony@Soft-Solutions.co.uk> <00d601c479cf$352a91f0$858310ac@suarapembaruan.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d601c479cf$352a91f0$858310ac@suarapembaruan.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 04 August 2004 4:00 am, david wrote:

> Dear Antony,
> I agree with you, i must block all traffic and accept one-by-one rules that
> i want, but the problem is i don't know how to do this

1. Here's the basic idea:

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $INTIF -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -i $INTIF -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -i $INTIF -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -j LOG

These rules mean "DROP any packets which I don't have a rule to ACCEPT, then 
ACCEPT all packets except the first of any connection, then ACCEPT the first 
packets for web browsing and DNS, then LOG any other packets which try to get 
through."

2. The important part of the above ruleset, for someone like you who is not 
quite sure what rules to use to ACCEPT the packets you want (and you don't 
want to default DROP any packets by omission), is the final LOG rule.

That rule will tell you what packets are trying to get through the ruleset, 
but haven't been ACCEPTed by one of the previous rules - and you may want to 
add a rule to specifically ACCEPT some of them.   Of course, you may *not* 
want to accept some of them either, so you're happy for those to continue 
being DROPped.   In that case (packets you know that you don't want), the 
next refinement of the ruleset is:

3. Add some specific DROP rules just before the final LOG rule, so that the 
packets you know about and do not want get DROPped without being logged.

The final outcome of this is a ruleset which:
a) ACCEPTs the packets you know you want
b) DROPs the packets you know you don't want
c) LOGs any other packets you haven't thought about or weren't expecting

As you can see, you can build such a ruleset gradually - if you don't want to 
disrupt communications through the firewall as you do it, just leave the 
default policy on ACCEPT as you add the specific ACCEPT rules, and then once 
you have no more wanted packets being DROPped, you can set the policy to DROP 
and concentrate on cutting down what gets LOGged.

I do recommend studying one of the netfilter tutorials such as Oskar 
Andreasson's at http://iptables-tutorial.frozentux.net so that you get a 
better understanding of how packets make their way through netfilter, and 
also what packets are necessary for correct and efficient operation of a 
network (some of them may be non-obvious, such as TCP DNS in my mini-ruleset 
above, or certain types of ICMP packets etc).

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


