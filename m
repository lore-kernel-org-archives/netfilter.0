From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Multiple conditions for logging packets
Date: Mon, 23 Sep 2002 14:33:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8F0A31.9010005@fugmann.dhs.org>
References: <09d001c262f1$50f418d0$0200a8c0@bart>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Matt Parlane <matt@zevi.net>
Cc: netfilter@lists.netfilter.org

Matt Parlane wrote:
> Hi list...
> 
> I have a simple linux machine acting as a firewall/gateway, and I'm after a
> way to specify multiple conditions for rules.  Basically I want to create a
> rule for packets which are either coming from or going to the internet - not
> packets which are both sourced and destined for the local network.  The
Create a new chain for this: e.g.
iptables -N INTERNET_LOG
iptables -A INTERNET_LOG -i eth0 -j ULOG
iptables -A INTERNET_LOG -o eth0 -j ULOG

#Forward to the logging:
iptables -A INPUT -j INTERNET_LOG
iptables -A OUTPUT -j INTERNET_LOG
iptables -A FORWARD -j INTERNET_LOG

Remember that all boolean operations can be created in netfilter:
(a and b are packet conditions and C is either a chain or target)
if a      then C ->  iptables (a)  -J C
if !a     then C ->  iptables (!a) -J C
if a && b then C ->  new chain: iptables (!a) -J return,
                                 iptables (!b) -J return,
                                 iptables -J C
if a || b then C ->  iptables (a) -J C, iptables (b) -J C

And that all  conditions in a rule are logical AND e.g.:
iptables -A input -p tcp --dport 25, means that the packet must be a tcp 
protocol type _and_ must have destination port 25. It is not possible to 
create logical OR in a single rule. (Well in some rare cases it is, but 
I leave that out for now.)

The problem is usually to create the AND operator. This is easily done 
by creating a new chaing, and returning from this if any of the 
conditions are false.

In your case, you need the OR operator, which is somewhat simple to create.

Hope it helps
Anders Fugmann






-- 
Neo: 'Can you fly that thing?'
Trinity: 'Not yet'.
$ apt-get install pilot-prg-v212helicopter.


