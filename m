From: "Random Person" <randomperson83@hotmail.com>
Subject: Forwarding in a NAT..
Date: Thu, 19 Sep 2002 23:03:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F185dlqHukzpaPE3vX7000158cf@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ok, this is a question that has probably been answered before, but I'm going 
to ask anyway because I can't find the answer.

I have 2 eth interfaces (eth0/eth1) and I use my linux box as a 
firewall/gateway NAT... What I want to do is take any packet that comes to 
eth0 (internet) that has destination port X and is trying to start a 
connection is forwarded to eth1 (internal network)... but not to a specific 
computer (i.e.. not mangled in any way but with the packet still having same 
source/dest address).

Ok, did that make any sense?

Any help someone could give would be appreciated!:-)

Here's my iptable script:

iptables=/usr/local/sbin/iptables

$iptables -t nat -F
$iptables -t mangle -F
$iptables -F

$iptables -X
$iptables -N from_outside
$iptables -N from_inside

$iptables -P INPUT DROP
$iptables -P OUTPUT ACCEPT


$iptables -A INPUT -i eth0 -j from_outside
$iptables -A INPUT -i eth1 -j from_inside
$iptables -A INPUT -i lo -j from_inside

$iptables -A from_outside -p tcp --syn --dport 80 -j ACCEPT
$iptables -A from_outside -m state --state NEW,INVALID -j DROP
$iptables -A from_outside -p all -m state --state ESTABLISHED,RELATED -j 
ACCEPT
$iptables -A from_outside -p tcp --syn -j DROP


$iptables -A from_inside -p all -j ACCEPT

$iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE



Visit my useless website at http://randomperson.cjb.net

-Your perception is reality until you control it...


_________________________________________________________________
Chat with friends online, try MSN Messenger: http://messenger.msn.com


