From: <enosp.netmeeting@onlinehome.de>
Subject: Packet loss at routing to own machine
Date: Mon,  9 Feb 2004 19:52:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6747028$10763525044027d5f82f55f0.43608586@config13.schlund.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_10763525044027d5f82f55f0.43608586";
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org


This is a multi-part message in MIME format.

------_=_NextPart_10763525044027d5f82f55f0.43608586
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline

Please see attached file!

------_=_NextPart_10763525044027d5f82f55f0.43608586
Content-Type: text/plain; name=udp-packet-loss.txt
Content-Disposition: attachment; filename="udp-packet-loss.txt"

Packet loss at routing to own machine!



I have following test configuration to measure udp round trip time:

(ADR is set to 192.168)

                                             |--------| 

|---------|eth1 (ADR.1.2)<---->(ADR.1.1) eth1|router 1|eth0 (ADR.3.1)<-   

|Test PC  |           cross cable 1          |--------|                |

|reflect. |                                                   cross    |

|         |                                                   cable 3  |

|send/rec.|                                  |--------|                |

|---------|eth0 (ADR.2.2)<---->(ADR.2.1) eth1|router 2|eth1 (ADR.3.2)<-

                      cross cable 2          |--------|



The linux routers 1 and 2 have activated forwarding.

On the Test PC is running an udp Sender program, which sends udp packets from 

eth0 (192.168.2.2) over the routers 2 and 1 to eth1 (192.168.1.2) on the Test PC.

An udp reflector program receiving the packets on eth1 sends it back over both

routers to eth0 where the packets arrive.

With etheral it can be seen, that the reflected packets arrive at eth0 of the

Test PC, but the receive call of the send/receive program does not get the packets.



When the Sender program and the reflector program run on separate machines,

it works fine.



To avoid an internal shortcut,

(udp packets sent from eth0 to eth1 over the loop back interface)

I shut down the loop back interface with 

ifconfig lo down



Following routing table entries were set:

route add -host 192.168.1.1 dev eth1

route add -host 192.168.2.2 gw 192.168.1.1 dev eth1

route add -host 192.168.2.1 dev eth0

route add -host 192.168.1.2 gw 192.168.2.1 dev eth0



All other routing entries were deleted.



Who throws away the received udp packets, when the send/receive program

and the reflector program runs on the same machine ?



Have I to set iptables rules, if so, which rules have I to use ? 



Many thanks in advace for your help ...    



------_=_NextPart_10763525044027d5f82f55f0.43608586--


