From: Martijn Lievaart <m@rtij.nl>
Subject: Re: strange behaviour
Date: Wed, 28 Feb 2007 18:36:37 +0100
Message-ID: <45E5BDA5.9050904@rtij.nl>
References: <768065.25159.qm@web36815.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <768065.25159.qm@web36815.mail.mud.yahoo.com>
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
To: angico <angico@yahoo.com>
Cc: netfilter@lists.netfilter.org

angico wrote:
> GREAT, GUYS! IT WORKED!!!!!! I THANK YOU VERY MUCH for the help!
> angico.
>   

Well the problem is in your rules in the first place, I cannot beleive 
no one caught this.

Let's reiterate your rules:

1    ACCEPT     all  --  192.168.0.0/24       boitata.jlm         
2    ACCEPT     tcp  --  anywhere             anywhere            state RELATED,ESTABLISHED 
3    ACCEPT     udp  --  anywhere             anywhere            udp spt:domain 
4    ACCEPT     udp  --  anywhere             anywhere            udp spt:http state NEW,RELATED,ESTABLISHED 
5    ACCEPT     icmp --  anywhere             anywhere            icmp echo-reply 
6    ACCEPT     icmp --  anywhere             anywhere            icmp echo-request 

(by the way, next time post the output of iptables-save, much better readable)

In rule 2, you allow all packets that are tcp and belong to an established session or related session. This means you DON'T allow the ICMP fragmentation needed messages in (dunno if they are deemed related or established, I think the latter). This is where you shoot yourself in the foot. This is why you SEEM to need the clamp-mss option. You don't need that option, your rules are faulty.

Nothing to do with your problem, but let's have a quick look at your other rules:

1) I prefer to match by interface, but YMMV.
3) Only sensible if you run a local nameserver.
4) What does this do?
6) This rule would not be needed had you allowed all RELATED and ESTABLISHED packets in.

I won't go into your OUTPUT rules, they should work together with your input rules.

What you probably want is something like this:

# Default is to drop
-P INPUT DROP
# Let in anything established or related
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# anything not new is dropped right away
-A INPUT -m state ! --state NEW -j DROP
# pings are allowed
-A INPUT -p icmp --type echo -j ACCEPT
# Input from the local network is allowed
-A INPUT -i $LOCALIF -j ACCEPT
# anything else is logged and dropped by the policy
-A INPUT -j LOG

# We allow anything from the box itseld to the outside
-P OUTPUT ACCEPT

(Add approptiate logging rules for safety and debugging)


I think you would do well to read some tutorials on writing IP tables rules.

HTH,
M4



