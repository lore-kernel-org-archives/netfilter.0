From: Aleksander Kamenik <aleksander@krediidiinfo.ee>
Subject: 2 default routes on non router
Date: Thu, 08 Oct 2009 04:33:19 +0300
Message-ID: <4ACD415F.7020402@krediidiinfo.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have a server (srv) with two interfaces. One (IF_INT) is on an 
internal /24 network with a gateway (gw) which provides net access for 
the /24 lan. gw's internal interface is GW_INT.

The second (IF_EXT) is part of a public /28 network and has several IP 
addresses assigned.

Coincidently gw's public interface (GW_EXT) is part of the same /28 
public network as IF_EXT.

The /28 network's gateway (GW_ISP) belongs to the ISP.


          ,-----|GW_INT|
         /      |  gw  |
        /       |GW_EXT|-------,
       /                        \
      /                          \
     /                            \
|IF_INT|                         /------|GW_ISP|----- internet
| srv  |                        /
|IF_EXT|                       /
    \                          /
     \________________________/




I want to use GW_INT as the default route, so connections originating 
from the server would leave IF_INT, go though GW_INT and have GW_EXT's 
IP when connecting the internet using SNAT.

However I also want IF_EXT to be available directly from the internet.

So far it's a standard out of the box setup. I just needed the server to 
be able to answer requests from the net directly through GW_ISP.

I tried to accomplish this by creating a second routing table on the 
server and adding the default route for GW_ISP there.

# ip route add default via $GW_ISP_IP dev $IF_EXT table extnet

Adding a rule to use the table for fwmark 10.

# ip rule add fwmark 10 table extnet

And using iptables CONNMARK to track the incoming connections on IF_EXT 
so I can assign them to extnet when the server replies.




This all works with one bigexception.


If I'm connecting to IF_EXT from an IP not listed in the main routing 
table, the packet is lost at "Routing Decision" [1]. I can connect to 
IF_EXT from GW_EXT or any other machine on the /28 network, but not from 
behing GW_ISP.

Although the route is available as default in the extnet table I have to 
add a internet located PC's route via GW_ISP to the main routing table 
for the PC to be able to connect.

I don't understand why the source IP matters during the "Routing Decision".


I tried marking the incoming packets so they would use the extnet table. 
For testing I tried adding the internet PC in extnet instead of main and 
that would not work also.


1 - http://iptables-tutorial.frozentux.net/images/tables_traverse.jpg

What's the correct solution to this problem?


Regards,

-- 

Aleksander Kamenik
System Administrator
Krediidiinfo AS
an Experian Company
Phone: +372 665 9649
Email: aleksander@krediidiinfo.ee

http://www.krediidiinfo.ee/
http://www.experiangroup.com/
