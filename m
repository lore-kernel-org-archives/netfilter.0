From: Sujith Chennupati <sujith.chennupati@gmail.com>
Subject: does the inbound traffic affect the outbound on 2 different
	interfaces
Date: Wed, 22 Dec 2004 09:52:41 +0100
Message-ID: <62916e504122200524d824825@mail.gmail.com>
Reply-To: Sujith Chennupati <sujith.chennupati@gmail.com>
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

hey guys

     i am regulating the traffic to & fro by my network through a
linux gateway , its behaving strange. i regulated Downlink to 2Mbps &
UPlLINK to 500Kbps. both perform well when those are done independent
i.e. one at a time

but when i do both from a client system ..the downlink however
continues at 2mbps but the uplink falls down to 100kbps?

is something wrong with my script or is there some other reason to
explain this ?????

downlink regulated on eth0, uplink on eth1
-----------------------------------------------------------------------------------------------------------------------
tc qdisc del dev eth0 root

tc qdisc add dev eth0 root handle 1: cbq bandwidth 30Mbit cell 8 avpkt
1000 mpu 64

tc class add dev eth0 parent 1:0 classid 1:1 cbq bandwidth 2000kbit
rate 2000kbit allot 1514 cell 8 weight 100kbit prio 2 maxburst 20
avpkt 1000 bounded isolated

tc class add dev eth0 parent 1:1 classid 1:2 cbq bandwidth 2000kbit
rate 300kbit allot 1514 cell 8 weight 30kbit prio 1 maxburst 20 avpkt
1000 split 1:0

tc class add dev eth0 parent 1:1 classid 1:3 cbq bandwidth 2000kbit
rate 300kbit allot 1514 cell 8 weight 30kbit prio 7 maxburst 20 avpkt
1000 split 1:0

tc filter add dev eth0 parent 1: prio 2 protocol ip u32 match ip dst
192.168.8.3 flowid 1:2
tc filter add dev eth0 parent 1: prio 2 protocol ip u32 match ip dst
192.168.8.4 flowid 1:3

tc qdisc del dev eth1 root

tc qdisc add dev eth1 root handle 2: cbq bandwidth 30Mbit cell 8 avpkt
1000 mpu 64
tc class add dev eth1 parent 2:0 classid 2:1 cbq bandwidth 700kbit
rate 700kbit allot 1514 cell 8 weight 70kbit prio 2 maxburst 20 avpkt
1000 bounded isolated
                                                                      
                                                            tc class
add dev eth1 parent 2:1 classid 2:2 cbq bandwidth 700kbit rate 100kbit
allot 1514 cell 8 weight 10kbit prio 1 maxburst 20 avpkt 1000 split
1:0
tc class add dev eth1 parent 2:1 classid 2:3 cbq bandwidth 700kbit
rate 100kbit allot 1514 cell 8 weight 10kbit prio 7 maxburst 20 avpkt
1000 split 1:0

tc filter add dev eth1 parent 2: prio 2 protocol ip u32 match ip src
192.168.8.3 flowid 2:2
tc filter add dev eth1 parent 2: prio 2 protocol ip u32 match ip src
192.168.8.4 flowid 2:3
----------------------------------------------------------------------------------------------------------------------

     expecting some help from any one


                                                 
                                                    -- 
                                                   sujith chandra
chowdhary CHENNUPATI

