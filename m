From: david@lang.hm
Subject: need to send packet out when I have the destination ip address as
 a clusterIP
Date: Sat, 12 Sep 2009 22:08:47 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.0909122158320.1361@asgard.lang.hm>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am using the clusterip target to have several sets of machines all 
receive copies of syslog messages. to do this I have defined one VIP and 
MAC combination and have it defined on multiple machines.

this is working perfectly for log messages comeing from other machines.

but I have a need for the machines that have the clusterIP defined on them 
to send messages out over the wire so that they are received by other 
machines that have the same clusterIP defined.

what appears to be happening is that the IP stack is detecting that the 
address is local and just delivering it locally instead of putting it on 
the wire to be dealt with properly

is there a way to force this type of traffic to go out over the wire?

some config info to give a concrete example


VIP 1.1.1.1 MAC 01:02:03:04:05:06

system 1
real IP 1.1.1.2
clusterIP local-node 1 total-nodes 1

system 2
real IP 1.1.1.3
clusterIP local-node 1 total-nodes 2

system 3
real IP 1.1.1.4
clusterIP local-node 2 total-nodes 2

system 4 (syslog relay)
real IP 1.1.1.5


when system 4 sends UDP syslog messages
   system 1 sees and records all of them
   system 2 sees and records approximatly half of them
   system 3 sees and records approximatly half of them

so far so good

however is systems 1-3 send a syslog message, the local machine sees it 
and neither of the other two systems see it.

what I would like to see happen is a packet get out on the wire with a 
source IP of the local box's real IP and a destination of 1.1.1.1 that 
then gets received and processed as like the packets sent from system 4.

how can I make this happen?

David Lang

P.S. I already have things configured so that the systems don't both send 
and receive the same message so there's no potential of a message loop.

