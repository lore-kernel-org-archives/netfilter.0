From: vinod K D <vinodpiravom@yahoo.com>
Subject: Route packets from an interface to another
Date: Mon, 10 Sep 2007 05:18:48 -0700 (PDT)
Message-ID: <930617.62310.qm@web33307.mail.mud.yahoo.com>
Reply-To: vinod.k.d@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: NetfilterList <netfilter@lists.netfilter.org>

First of all, I'll explain my network setup.
 
 My gateway has two network interfaces: eth0 & eth1. 
 
 eth0 (192.168.1.1) is connected to public network and
eth1(10.0.1.1) is connected to LAN.
 
 MyServer, which is in the LAN, has ip 10.0.1.2.
 
 I created a virtual interface eth0:0 (192.168.1.2) in
the gateway.
 Using ipvsadm, I can route the packets, destined for
this IP address and a port,  to myServer.
 
 And in myServer, I enabled ip_forwarding and assigned
192.168.1.2 for the loopback interface. 
 So my server application receives and serves the
packets properly. 
 
 The problem is in the return path. (Remember the
packets have source addres 192.168.1.2). While they
reach the gateway, the packets are being dropped. 
 
 (I think, the reason is nothing but the address
192.168.1.2 is assigned to the gateway. Hence router
assumes the packets are traversing though a loop.)
 
 I can't use masquerading, because I need to get the
source & destination IPs of the packets.
 
 Can anyone suggest a way to redirect packets from an
interface to another (ie, eth1 to eth0) without making
any change in the packet header.
 
 PS: The latest versions of netfilter doen't have
inbuilt ipt_ROUTE module. Else my life would be cool.
 
 Thanks,
 Vinod


       
____________________________________________________________________________________
Sick sense of humor? Visit Yahoo! TV's 
Comedy with an Edge to see what's on, when. 
http://tv.yahoo.com/collections/222

