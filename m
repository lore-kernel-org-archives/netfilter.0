From: Vlad Adomnicai <vlada@xana.ro>
Subject: Two computers with same MAC
Date: Tue, 25 May 2004 06:21:36 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40B2BBC0.1080709@xana.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
   I have a problem on a local LAN.
   I have tested and seen that two computers with the same IP and MAC 
can use the network at the same time with no problems. I'm interested in 
a way to allow only the right owner of the ip and mac to pass through a 
linux router and on to the internet.

    ROUTER   ---> SW   ----> Client1
                                  |
                                  --------->Client2.

   If client2 changes first it's MAC to the one of the Client1, then 
changes the IP to the one of the Client1's computer, none of the 
computers will get an IP Conflict and both computers will pass through 
the router insetead of a iptables rule set on forward.
    itpables -A FORWARD -o eth1 -s IP1 -m mac --mac-source MAC1 -j ACCEPT
    iptables -A FORWARD -o eth1 -j REJECT

  Any one knows a way to stop Client2 from passsing the router? (both 
Client1 and Client2 are running windows).
  I have thought to serveral solutions but each one of them has drawbacks.
   1. VPN access for clients:  allowing only 1 connection form an IP the 
problem is solved. The trouble is that the network is big (400-800 
users) and for local traffic the routers CPU's will be greatly overcome 
(about 100 clients / router).
   2. Somehow tinkering with the IP options from clients and marking 
them in a certain way then from iptables detecting the special marking ( 
like using unused fields from the ethernet packet or something like 
this). I don't know if it is possible from linux, and if it is possible 
from windows for all the packets it sends. If it is possible, then even 
if Client2 will try to replicate the change, if I change the value each 
5 minutes let's say and change also the rules each 5 minutes on the 
router, I can make it impossible for him to pass the router for more 
than 5 minutes before having to look again for the value.
   3. Managed Switches with MAC set on their ports. This ideea is very 
expensive.
   4. Something done to the switch or a certain brand of switches that 
doesn't allow this to happen.

  I welcome gladly and advice possible. ( I would prefere a solution 
based on iptables and IP options (maybe TTL changes if it can be done 
for the entire windows system).


Vlad Adomnicai


