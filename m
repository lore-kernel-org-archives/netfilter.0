From: "Sathi" <sathiyan@gmx.net>
Subject: need to forward req between same network ip within same machine
Date: Thu, 20 Jun 2002 18:44:04 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <026701c2185c$5da22340$870110ac@samsi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.samba.org>

Hello All,

I have a Redhat linux box with two NIC which i am going to use as firewall
machine.

Foe some reason i want to assign a ip address for these 2 NIC in same
network say

eth0: 10.10.10.1/24----------> to router
eth1: 10.10.10.2/24<---------- from client

eth0 and eth1 are connected in different switch

All clients are connected through eth1.I did not want any masquerading to
happen here.i want to just forward the request from eth1 to eth0 and
response from eth0 to eth1

i test with these rules as

iptables -A FORWARD -i eth1 -o eth0 -p all -s 10.10.10.0/24 -d 0/0 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p all -s 0/0 -d 10.10.10.0/24 -j ACCEPT

but this doesn't work
clients are unable to connect internet

I enabled ip_forward in kernel also.

What should be the exact rule to make clients use internet through this
linux box.

Do i need to change anything do with routing table
What should be a entry in the routing table

Thanks
Sathi


