From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: What order ? I'm confused ...
Date: Tue, 13 Jan 2004 12:11:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401131211.11781.Antony@Soft-Solutions.co.uk>
References: <200401131257.26388.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401131257.26388.mrakotom@free.fr>
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

On Tuesday 13 January 2004 11:57 am, Rakotomandimby Mihamina wrote:

> Hi all ,
> I run Iptables 1.2.9 on a 2.4.24 kernel :
>
> I dont understand the way a (network) packet follows through the iptables
> rules .
>
> For example , for the INPUT  table , i have this set of rules (in this
> order) : #========================================
> iptables -P INPUT DROP
>
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A INPUT -i eth0 -j ACCEPT
> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A INPUT -p tcp --dport 20 -j ACCEPT
> iptables -A INPUT -p tcp --dport 21 -j ACCEPT
> iptables -A INPUT -p tcp --dport 25 -j ACCEPT
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -p tcp --dport 8090 -j ACCEPT
> iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
> iptables -A INPUT -p tcp --dport 10080 -j ACCEPT
> iptables -A INPUT -p tcp --dport 9000 -j ACCEPT
> iptables -A INPUT -p icmp -j ACCEPT
>
> iptables -A INPUT -j REJECT
>
> iptables -A INPUT -j LOG --log-level info --log-prefix "iptables_rktmb : "
> iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
> iptables -A INPUT -i ppp0 -m unclean -j DROP
> #========================================
>
> well , my questions are :
>
> If a packet arrives ( fromt the Net , ppp0 interface ) , what rule does he
> meet first ? ( "iptables -P INPUT DROP" or "iptables -A INPUT -i ppp0 -m
> unclean -j DROP")

The -P is the chain Policy, and doesn't really count as a rule.   It tells the 
system what to do with a packet which doesn't match any of the rules.

The -A means Append, and therefore the rules you have listed above will be 
held in the chain in the order you have shown them (a quick "iptables -L 
INPUT -n -v" will confirm this).

Packets are tested against each rule in turn in a chain, starting with the 
first, until it matches, and then the target for rule is used (eg ACCEPT).

> I am tempted to answer : "iptables -A INPUT -i ppp0 -m unclean -j DROP" ...
> so that the filtering process begins from the last rule to the first .
> Am I right ?

No.

> So .
> On the other hand , when i read man iptables about logging ( LOG target ) :
> i see that the LOG target should be _after_ the DROP ( or REJECT ) so that
> I understand that if the packet comes from the net , it meets the first
> rule first and the last one at last .
>
> What's the truth ?

That depends on what you want to log.

If you want to log a packet before ACCEPTing or DROPping it, the LOG rule must 
come before the ACCEPT or DROP rule (otherwise the packet never reaches the 
LOG rule).

If on the other hand, you want to log packets which didn't get matched by any 
of the rules, then you put the LOG rule at the end, and it sees all the 
packets which didn't match your rules (just before they are dealt with by the 
default policy DROP).

> i put the rule about the "unclean" stuff at the end because i read
> somewhere in a tutorial that its best place is there ...

I disagree.   The effect of this is that you are accepting all packets for TCP 
ports 20, 21, 25, 80, etc.... whether they are unclean or not.   I think it 
is better to throw out the unclean packets before ACCEPTing the clean packets 
going to the ports you want.

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


