From: Alex Samad - Yieldbroker <Alex.Samad@yieldbroker.com>
Subject: help with cluster and/or clusterip
Date: Tue, 18 Dec 2012 00:40:56 +0000
Message-ID: <A3FB5D9FD28C50429DF7692DC31054E604BA6CEC@DC1INTADCW8201.yieldbroker.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

I have been spending some time trying to get clusterip and just recently cluster working.  Seems like there are not many people using this !

Basically I have 2 machines (centos 6.3)
10.32.21.31 node1
10.32.21.32 node2
10.32.21.30 VIP multi cast addr 01:00:5e:20:15:1e


I will start with clusterip way

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:CLUSTER - [0:0]
-A INPUT -m state --state INVALID -j DROP
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
# Allow from any where
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
# Cluster IP Check
-A INPUT -j CLUSTER
# cluster
-A CLUSTER -d 10.32.21.30 -i eth0 -p tcp -m multiport  --dport 10000,10001  -j CLUSTERIP --new --clustermac 01:00:5e:20:15:1e --total-nodes 2 --local-node 1 --hashmode sourceip-sourceport --hash-init 0x12341234

With the change for local-node to 2 for node 2. This is about the same 


I tried this setup, I attempted to do a telnet 10.32.21.30 10001 from a remote machine and I see packets arrive on both nodes.. okay, I would have thought I should only see it on one node. But maybe iptables sees it on both and it should get blocked at this line.  but I get ICMP rejects coming back from both nodes..

I actually like CLUSTERIP over cluster because I have access to the /proc/net/ipt_CLUSTERIP/10.32.21.30 where I can dynamically add and remove which nodes are accepted

-m cluster way

Well I didn't get very far with this
I used a setup scripts to install these lines
                /sbin/iptables -A PRECLUSTER -t mangle -i $DEV -d $VIP -m cluster --cluster-total-nodes $MND --cluster-local-node $ND --cluster-hash-seed $CLHASH -j MARK --set-mark $IPTMARK
                /sbin/iptables -A PRECLUSTER -t mangle -i $DEV -d $VIP -m mark ! --mark $IPTMARK

And add my m mac
               /sbin/ip maddr add $MMAC dev $DEV 

But pings are not working via the switch ... I haven't done the arptables changes ... but they are not needed for the CLUSTERIP... I haven't investigated any further. Because I noticed that there is not /proc interface to handle the local node.

My aim was to use rgmanager or hearbeat to assign iptable nodes to each server depending on weather the other server was up or not !  
If I have to change iptables lines in mange that seems to be are rathe archaic method considering we the /proc method for clusterip

The only reason I started to look at -m cluster is because I read that clusterip was deprecated and this new method was the way forward...

So I have come to the list to see if I can get some help to fix this :)

Thanks




