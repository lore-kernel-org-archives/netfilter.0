From: J Kim <jindor@yahoo.com>
Subject: Transparent proxy rule at tun interface
Date: Tue, 5 Oct 2004 18:39:39 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041006013939.26732.qmail@web50903.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,

I've been using iptables without problem for a long time, but finally faced one
when I tried a new thing.

I'm using Linux 2.4.20. What I want to be able to do is having a rule in NAT
table PREROUTING chain for transparent proxy at 'tun' interface, instead of
usual physical (ethx) one, like following:
                              ~~~~~~~~~
iptables -t nat -A PREROUTING -i tun255 -p tcp -m tcp \
 --dport 80 -j REDIRECT --to-ports 3128 

I confirmed that packets are coming in from tun255 to system. Another rule I
setup at mangle PREROUTING chain (-t mangle -A PREROUTING -i tun255 ...) for
debugging tells me that packets come visit the mangle table (the rule's
packet/byte counts increases).

Problem is, packets never come into nat table. Packet/byte count stays zero (-t
nat -L PREROUTING -v -x).

For debugging, if I do something like this at mangle table, traffic is blocked:

iptables -t mangle -A PREROUTING -i tun255 -j DROP

but same rule at nat table never affects the traffic:

iptables -t mangle -A PREROUTING -i tun255 -j DROP

Transparent proxy rule at ethx interface works with no problem. So proxy itself
works fine.

I tried same thing with tap device as well, but it doesn't work either. Is this
a limitation of iptables that nat table works only with physical device, or am
I missing something?


Any clue or suggestion would be appreciated. Thanks in advance.

Jinsuk Kim


		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com

