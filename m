From: Mike Smith <mismith356@gmail.com>
Subject: Forwarding while on same subnet...confusions
Date: Tue, 23 Nov 2004 14:09:12 -0500
Message-ID: <dc56727e041123110948cb3a14@mail.gmail.com>
Reply-To: Mike Smith <mismith356@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello All,

I am not overly network savvy however I am trying to better understand
firewalling due to a work related project.  I will try to be brief and
to the point while still providing enough details (please forgive me
if I fail in these attempts).

I am attempting to setup a very simple firewall for port forwarding
while sitting inside my existing corp. network.

host ap9052pc is my destination with an apache server running on port
80 (fedroa core 2, no firewall or SE Linux enabled, no iptables
rules).

static host ip for ap9052pc, resolvable via dns is 138.1.89.6/255.255.252.0

Can connect to http://ap9052pc.domain.com from any client browser.


host ap9005pc is my firewall machine.  Running fedora core 3 (iptables
version 1.2.11).  I do not have SE Linux enabled and I believe all
iptables services are off however I do have the following modules
loaded:

iptable_filter
iptable_nat
ip_conntrack
ip_tables

static host ip for ap9005pc, resolvable via dns is 138.1.88.246/255.255.252.0

using the default example from the howto, iptables -A INPUT -s
127.0.0.1 -p icmp -j DROP, shows 100% packet loss so  iptables in and
of itself does seem to work.

Now, just trying to forward from ap9005pc to ap9052pc...I did the following:

iptables -t nat -A PREROUTING -p tcp -i eth0 -d 138.1.88.246 --dport
80 -j DNAT --to 138.1.89.6:80
iptables -A FORWARD -p tcp -i eth0 -d 138.1.89.6 --dport 80 -j ACCEPT

and then, after some google'ing and reading:

iptables -t nat -A POSTROUTING -s 138.1.89.6 -p tcp --dport 80 -j SNAT
--to 138.1.88.246

now..

nmap ap9005pc -p 80

Interesting ports on ap9005pc.us.oracle.com (138.1.88.246):
PORT   STATE  SERVICE
80/tcp closed http

Available, but forwarded??

From a browser on my client machine (ip is dhcp and is 138.1.91.168),
I call http://ap9005pc.domain.com....never returns....lala land

Here is what is in the tables:

iptable -L

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     udp  --  anywhere             ap9052pc.domain.com udp dpt:http 
ACCEPT     tcp  --  anywhere             ap9052pc.domain.com tcp dpt:http 

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

And for the nat chains:

iptables -t nat -n -L

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       udp  --  0.0.0.0/0            138.1.88.246        udp
dpt:80 to:138.1.89.6:80
DNAT       tcp  --  0.0.0.0/0            138.1.88.246        tcp
dpt:80 to:138.1.89.6:80

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
SNAT       udp  --  138.1.89.6           0.0.0.0/0           udp
dpt:80 to:138.1.88.246
SNAT       tcp  --  138.1.89.6           0.0.0.0/0           tcp
dpt:80 to:138.1.88.246

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         


It's only a theory at the moment, but I suspect my postrouting may be
wrong because I am not on a true class C subnet???

Any guidance would be greatly appreciated.

