From: Matt Singerman <msingerman@ncemch.org>
Subject: Problems configuring iptables
Date: Wed, 23 Aug 2006 11:49:11 -0400
Message-ID: <44EC78F7.4010106@ncemch.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi all,

I am new to iptables, so please bear with me here.  I am configuring 
what I think is a fairy simple setup.  I have a linux box which is 
acting as a network bridge that I want to install the firewall on.  It 
has two ethernet cards: eth0 is attached to the internet, and eth1 is 
connected to the internal network.  All machines inside the network use 
static public IP addresses, so there is no need to use NAT services or 
IP masquerading.  I am setting it up to only accept SYN packets on 
certain TCP ports, then accept all packets on existing connections.  The 
order would be:

ACCEPT SYN packets for certain TCP services.
DENY all other SYN packets on other TCP services.
ACCEPT all other TCP packets that are part of an existing connection.
DENY all other TCP packets.

I started by changing the policies on INPUT AND FORWARD to drop all 
packets by default, and OUTPUT to accept.

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

Next, I added a rule to allow all traffic from the internal network to 
the outside world:

iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

Next, a rule to forward packets that are part of an existing connection 
from eth0 to eth1.

iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT

Same thing, but on the firewall...

iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

And to allow all inputs from the internal network and local loopback to 
the firewall.

iptables -A INPUT -i eth1 -s 0/0 -d 0/0 -j ACCEPT
iptables -A INPUT -i lo -s 0/0 -d 0/0 -j ACCEPT

So after I set up these rules, if I understand iptables correctly, all 
traffic from inside the network should flow out smoothly over the bridge 
no matter what the internal IP address is nor what port the traffic is 
on.  This, however, is not happening: no traffic can flow in or out of 
the network.

Also, if I try to add a rule to allow, say, SSH traffic to a specific 
machine behind the firewall, I run into other problems.  If I type:

iptables -A FORWARD -s 0/0 -d w.x.y.z -p tcp --dport 22 --syn -j ACCEPT

This is, so far as I am aware, the format I would use.  However, when I 
type iptables -L, the list just hangs just before listing that rule.

Can anyone offer any pointers as to what I may be doing wrong, and what 
I can do to get this working?  Thanks!

Regards,

Matt

