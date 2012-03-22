From: "Huebner, Thomas" <thomas.huebner@cassidian.com>
Subject: Bridge IPv6 traffic between 2 interfaces
Date: Thu, 22 Mar 2012 09:27:38 +0100
Message-ID: <BC7EA6E099A4EE4CBC467EBF08ECB8420A4A4636@GSX300A.mxchg.m.corp>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have a computer (A) which is connected on the left side to a private
network (usb0) and on the right side to a stand alone computer (B).


----+         +-----------------+            +-------+
NET |         |      BOX A      |            | BOX B |
 A  +--IPv4---+---  IPv4 in  ---+------IPv4--+       |
    +--IPv6-+ |  IPv6 'arround' | +----IPv6--+       |
    |       | +-----------------+ |          +-------+
----+       +->----<--->----<--->-+


I try to find a way to bridge the IPv6 traffic completely transparent
(including all the ICMPv6 and solicitation stuff), between the
interfaces usb0 and usb1 while the IPv4 traffic is not affected.

I've tried using a brctl which connects the two interfaces perfectly,
but disconnects them from the host A itself. 
Also marking the IPv6 packets with set-mark and routing them using "ip
route" seems not to work.

The iptables ROUTE target using the "--oif" option seems exactly what
I'm looking for, but unfortunatly this target is not available for
ip6tables.

Has anyone an idea or hint?


Thanks

Thomas
