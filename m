From: "Alexander Stieglecker" <a.stieglecker@gmx.net>
Subject: Re: anyone know how to use clusterip
Date: Wed, 20 Apr 2005 11:43:10 +0200
Message-ID: <000001c5458d$5e476650$aa28abc1@Vagabond>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: 'Bryan Waters' <bryanw@abwaters.com>
Cc: 'Jason Joines' <support@bus.okstate.edu>, netfilter@lists.netfilter.org

Hi Bryan,

I experimented with CLUSTERIP using 2 nodes.
The traffic is distributed using Multicast-MAC-addresses over N-Nodes =
(e.g.
webservers). One node decides to ACCEPT the incoming packet. All others =
DROP
the packet (based on the srcip of the packet and the local node number).
There is also a failover mechanism if one or more nodes die.

My starting commands were:

Node1:
iptables -A INPUT -d 10.0.0.1 -p tcp --dport 80 -j CLUSTERIP --new
--hashmode sourceip --clustermac 01:23:45:67:89:AB --total-nodes 2
--local-node 1

Node2:
iptables -A INPUT -d 10.0.0.1 -p tcp --dport 80 -j CLUSTERIP --new
--hashmode sourceip --clustermac 01:23:45:67:89:AB --total-nodes 2
--local-node 2

It's important that the clustermac parameter is a MULTICAST-MAC-address.
CLUSTERIP replies with this multicast mac to ARP-requests containing ip
10.0.0.1 . This makes the switch to flood the packets on all ports. Each
node decides itself if it wants to drop the incoming packet based in the
hash of the srcip (respectively srcip-srcport/srcip-srcport-destport).
Be sure to enter at least "-d 10.0.0.1" as a standard match.
After you've entered the commands take a look at the proc-fs using

cat /proc/net/ipt_CLUSTERIP/10.0.0.1

This shows you for how many node numbers the local node feels =
responsible.
You can add a node using the command:

echo "+1" > /proc/net/ipt_CLUSTERIP/10.0.0.1

or remove one using the same command but with "-1"

A daemon like heartbeat could be used to do these commands when one node
fails.

I also discovered some problems:

*Each node replies to an ARP-request with the clustermac but after a =
while
it sends an ARR-request itself containing its NIC-MAC which destroys the
IP-Clustermac mapping on the clients. (Fixed thos using ARP-Tables)
*Problems using FTP (two TCP-connections)



