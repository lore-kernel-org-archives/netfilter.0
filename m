From: "Nicolas Olivier" <nolivier@alphalink.fr>
Subject: ip_conntrack_ftp trouble with active connection
Date: Tue, 12 Jul 2005 18:20:25 +0200
Message-ID: <42D3EDC9.1060201@alphalink.fr>
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


Hi,

I previously posted a message related to this trouble, but I think the architecture was kind of weird, and so I tried to simplify it.

So I've got a machine with two interfaces.
- eth0: 10.10.50.1 network 10.10.50.0/24
- eth1: 10.0.44.99 network 10.0.44.0/24
- the default gateway for this machine is 10.0.44.1

An OpenVPN daemon is running on this machine, and the only peer connected for the moment arrives with the IP 172.16.0.1.
All the traffic from this peer is routed via the gateway 10.10.50.4 (routes are isolated via: "ip rule add from 172.16.0.1 lookup table 1" and "ip
route add default via 10.10.50.4 table 1").
The machine 10.10.50.4 does its own stuff, and then sends back some traffic masqueraded.
Finally, the traffic is sent to the default gateway 10.0.44.1.

The problem is for ftp connections from the OpenVPN peer:
- with passive ftp connections: works like a charm
- with active ftp connections: the first attempt fails, but entries are created in ip_conntrack table and on the second attempt the connection succeeds

Here is the output for an active ftp connection:

First attempt:

tcp      6 117 TIME_WAIT src=10.10.50.4 dst=192.168.0.1 sport=37241 dport=21 src=192.168.0.1 dst=10.0.44.99 sport=21 dport=37241 [ASSURED] use=1 mark=0
tcp      6 117 TIME_WAIT src=172.16.0.1 dst=192.168.0.1 sport=37241 dport=21 src=192.168.0.1 dst=172.16.0.1 sport=21 dport=37241 [ASSURED] use=1 mark=0
EXPECTING: - use=1 proto=6 src=192.168.0.1 dst=172.16.0.1 sport=0 dport=37242

The ftp client (lftp) waits 30s and tries a second attempt, which succeeds:

tcp      6 87 TIME_WAIT src=10.10.50.4 dst=192.168.0.1 sport=37241 dport=21 src=192.168.0.1 dst=10.0.44.99 sport=21 dport=37241 [ASSURED] use=1 mark=0
tcp      6 431997 ESTABLISHED src=10.10.50.4 dst=192.168.0.1 sport=37243 dport=21 src=192.168.0.1 dst=10.0.44.99 sport=21 dport=37243 [ASSURED] use=2
mark=0
tcp      6 117 TIME_WAIT src=172.16.0.1 dst=192.168.0.1 sport=37244 dport=32803 src=192.168.0.1 dst=172.16.0.1 sport=32803 dport=37244 [ASSURED] use=1
mark=0
tcp      6 431997 ESTABLISHED src=172.16.0.1 dst=192.168.0.1 sport=37243 dport=21 src=192.168.0.1 dst=172.16.0.1 sport=21 dport=37243 [ASSURED] use=2
mark=0
tcp      6 117 TIME_WAIT src=10.10.50.4 dst=192.168.0.1 sport=37244 dport=32803 src=192.168.0.1 dst=10.0.44.99 sport=32803 dport=37244 [ASSURED] use=1
mark=0
tcp      6 87 TIME_WAIT src=172.16.0.1 dst=192.168.0.1 sport=37241 dport=21 src=192.168.0.1 dst=172.16.0.1 sport=21 dport=37241 [ASSURED] use=1 mark=0
EXPECTING: - use=1 proto=6 src=192.168.0.1 dst=172.16.0.1 sport=0 dport=37242


If anyone has an advice, it would be greatly appreciated.

Sincerely,
Nicolas Olivier

