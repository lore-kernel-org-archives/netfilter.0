From: Alex Samad - Yieldbroker <Alex.Samad@yieldbroker.com>
Subject: RE: help with cluster and/or clusterip
Date: Tue, 18 Dec 2012 04:30:17 +0000
Message-ID: <A3FB5D9FD28C50429DF7692DC31054E604BA741B@DC1INTADCW8201.yieldbroker.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

[snip]

> >
> 
> Thought I would add some more
> 
> I retested the clusterip.
> 
> So I have something like
> 
> /sbin/iptables -A CLUSTER -i $DEV -d $VIP -j CLUSTERIP --new --clustermac
> $MMAC --total-nodes $MND --local-node $ND --hashmode sourceip-
> sourceport --hash-init $CLHASH /sbin/iptables -A CLUSTER -i $DEV -d $VIP -p
> tcp -m multiport --dport 10000,10001 -j ACCEPT
> 
> The line in INPUT is
> -p tcp -d $IP -j CLUSTER
> 
> So I am seeing packets hit the first line and it seems like it stops if the packets
> don't match.
> 
> But now I think I have another problem, which the list might be able to help
> with.
> 
> 
> These are VM's on different ESXi hosts. And the switch doesn't send packets
> to both host and thus the packets don't get to both VM's
> 
> Strangely when I get on another VM on the same vlan it can ping both vm's

So I have progressed further.
I am sticking with clusterip... until somebody show / explains why cluster module is better ....
My default gateway had the wrong mac associated with the ip address, I had the VIP assigned to the nic before I had the CLUSTERIP iptables line. So arp request where being answered with the mac of the nic not the maddr ! so I cleared the switched arp table for that entry and now I am getting packets to both machines.

And tcpdump sees all the inbound packets.  The line in iptables consumes the packet if it fails ie not for this machine.  The interesting thing is seeing all the reply packets from the test machine go to second node ( the one that is not handling the link ... oh well)

Now  when I try to make a https connection so 

Client -> router -> cluster vlan 

I can see the tree way hand shake syn, syn/ack, ack. Well from the client side

But on the server side I have this
tcp        0      0 10.32.21.30:10001           10.172.207.133:60123        SYN_RECV

tcpdump has the ack ... but some reason it's not making it up the stack 


So many steps forward....

A

> 
> Thanks
> Alex
> 
> And seasons greats/cheer to all !
