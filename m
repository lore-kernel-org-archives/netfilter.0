From: Dataforce <Dataforce@Home.dataforce.org.uk>
Subject: Possible Simple Configuration gone wrong
Date: Sun, 03 Oct 2004 23:12:21 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41607945.8040802@Home.dataforce.org.uk>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I was just wondering, how would i go about setting up iptables rules as 
follows:

Here is my network setup

the iptables machine has the ip 82.133.x.x on eth1, and 192.168.0.5 on eth0

(82.133.x.x) [Internet]----[iptables]----[Machine 1] (192.168.0.6)
                                 |--------[Machine 2] (192.168.0.2)
                                 `--------[Other Machines]

I setup a port forward as follows:
iptables -A PREROUTING -t nat -i eth0 -p tcp --dst 82.133.x.x --dport 
3389 -j DNAT --to 192.168.0.6:3389

iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 3389 -j DNAT --to 
192.168.0.6:3389

iptables -t nat -A POSTROUTING --dst 192.168.0.6 -p tcp --dport 3389 -j 
SNAT --to-source 82.133.x.x

iptables -A POSTROUTING -t nat -j MASQUERADE

now, this allows machine2 AND internet clients to connect to port 3389 
on 82.133.x.x and get to machine1

however, according to machine1, all clients appear to have come from 
192.168.0.5

I would like it setup so that lan clients appear to come from 
192.168.0.5 (so that packets get routed correctly 
[machine1]--[iptables]--[machine2] not [machine1]--[machine2]) where as 
packets from the internet appear to come from the correct ip.

i have tried replacing
iptables -A POSTROUTING -t nat -j MASQUERADE

with

iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -j SNAT --to-source 
82.133.x.x

iptables -t nat -A POSTROUTING -s ! 192.168.0.0/16 -j MASQUERADE

(suggested by a friend)

and vice versa (swapping the !) however it either prevents external 
connections compeltey or gives the same effect as before.

is what i would like possible with iptables? or will i jsut have to live 
with all clients appearing as 192.168.0.5

thanks

-DF

