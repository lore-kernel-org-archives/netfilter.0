From: Fabio De Paolis <fabiodepaolis@naxe.it>
Subject: NAT Port Forward problem in a not so simple network
Date: Tue, 15 Apr 2008 11:48:24 +0200
Message-ID: <480479E8.3040904@naxe.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello to all,

I have a NAT/Forward problem and I'm unable to solve, any help will be 
greatly appreciated.

I have a service that runs on a server that has no public IP, another 
server with the public IP should forward the port to it.

Scenario:

/--------\
|A:Cisco1|
\--------/
   .
   ............   
   .          .
/--------\  /--------\
|B:Cisco2|  |C:HPpro1|
\--------/  \--------/
   .
   .
/--------\
|D:Works1|
\--------/

Cisco1: Router where I can change nothing
Cisco2: Router where I can make very little changes
HPpro1: Server with Linux (Debian) and IPTables where I can change all 
*HELP HERE*
Works1: Workstation with a service listening on port 8080 TCP

A: Cisco1:
It has several public IPs and it redirect 1 IP on HPpro (all ports and 
protocols)
LAN interface has 192.168.0.1, all works well here.
It has a port forward cisco rule that works (tested) it is:
ip nat inside source static 192.168.0.11 $PUBLICIP extendable (it is 
like NETMAP)

B: Cisco2:
It is used to let Workstation surf on the net
WAN interface has 192.168.0.2
LAN interface has 192.168.1.1, workstation are 192.168.1.2-20
It has a port forward cisco rule that works (tested) it is:
ip nat inside source static tcp 192.168.1.2 8080 192.168.0.2 8080 extendable

C: HPpro1: *HELP HERE*
It is a production server with many services on it
I would like to use its IP to test some application on a workstation 
instead of the production server
ETH0: 192.168.0.11
I need that it forward every packet that comes on 192.168.0.11:8080 
(from 192.168.0.1) to 192.168.0.2

D: Works1
It has a service listening on port 8080
ETH0: 192.168.1.2


Lets say that everything works fine if I try to connect to
192.168.0.2:8080 (from 192.168.0.6 for example) I access to 
192.168.1.2:8080 without problem

I need to access even connecting to 192.168.0.11:8080 (that is the IP 
with where if forwarded the public IP)


My try was this:
I create a simple port forward like this
DNAT tcp -- 0.0.0.0/0 192.168.0.11 tcp spts:1024:65535 dpt:41080 
flags:0x17/0x02 state NEW to:192.168.0.2

It does not work, I sniffed all the packets on the hub/switch and I see 
that:
#, Source IP, Source MAC, Destination IP, Destionation MAC, Protocol, Info
1, 192.168.0.1, Cisco1, 192.168.0.11, HPpro1, TCP, 1234 > 8080 [SYN] 
Seq=0 Len=0 MSS=1460
2, 192.168.0.1, HPpro1, 192.168.0.02, Cisco2, TCP, 1234 > 8080 [SYN] 
Seq=0 Len=0 MSS=1460
3, 192.168.0.2, Cisco2, 192.168.0.01, Cisco1, TCP, 8080 > 1234 [SYN, 
ACK] Seq=780620 Ack=1 Len=0 MSS=1460
4, 192.168.0.1, Cisco1, 192.168.0.02, Cisco2, TCP, 1234 > 8080 [RST] 
Seq=1 Len=0

Packet 1 is the SYN request from Cisco1 to HPpro1
Packet 2 is strange, HPpro1 forwards to Cisco2 using the IP of Cisco1
Packet 3 Cisco2 does his job and the give the reply to Cisco1
Packet 4 Cisco1 reset the communication, perhaps because he wait a reply 
from HPpro1 and not Cisco2?


Sorry for long message but it was to better explain the problem

Many thanks for you help

