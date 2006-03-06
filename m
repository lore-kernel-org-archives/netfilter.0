From: Andre Bender <andre.bender@gmx.de>
Subject: Routing via multiple active PPP devices
Date: Mon, 06 Mar 2006 08:34:48 +0100
Message-ID: <440BE618.4000604@gmx.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

for a mobile application we are using multiple internet connections 
(mostly ppp) to achive a high aviability. Normaly there are at least two 
open connections (e.g. eth0 and ppp0). Assuming the default route is set 
correct for use with eth0.

The software I'm writing is opening various sockets and binding them to 
the devices. Sending via eth0 is working flawlesly but sending via ppp0 
does not send at all.


Setup:
eth0      Link encap:Ethernet  HWaddr 00:D0:93:07:D5:BE
           inet addr:192.168.255.157  Bcast:192.168.255.255  	
		Mask:255.255.252.0
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

ppp0      Link encap:Point-Point Protocol
           inet addr:80.187.43.97  P-t-P:192.168.202.1
		Mask:255.255.255.255
           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1

Destination     Gateway         Genmask         Flags Iface
192.168.202.1   *               255.255.255.255 UH    ppp0
192.168.252.0   *               255.255.252.0   U     eth0
default         192.168.252.1   0.0.0.0         UG    eth0

My Question is: How do to setup route/iptables so a packet sent via a 
socket bound to eth0 is sent via eth0 and a packet sent on ppp0 is sent 
there?
I guess it has something to do with source routing but I couldn't figure 
out from the examples found on the net.

TIA
Andre

