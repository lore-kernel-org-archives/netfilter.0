From: Ricardo Faria <ricardo.faria@fe.up.pt>
Subject: Ebtables build frames howto
Date: Tue, 19 May 2009 01:22:39 +0100
Message-ID: <4A11FBCF.3000605@fe.up.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I' new in this and i was searching for something that could solve my
problem.
I am doing a network with several terminal machines ( this have IPs) and
to connect all i have a layer 2 network made by computers that are going
to route the traffic using MPLS. I need to know, in this middle
computers, the neightbours MAC to build the path between the terminal
machines ( that have IPS). My problem is that ARP need to associate a
MAC to a IP, which i do not have in this middle  computers.
So i was wondering if ebtables could help me build a "arp" table, i.e.,
the computer PC2 that is connected to one final terminal PC1 ( that has
an IP) sends back to the network, in broadcast, a specific frame with is
own  PC2-MAC, and the terminal PC1 MAC-IP pair. The PC3 listen to this
frame and stores that the route to the IP of PC1 is using PC2. PC3 does
exactly the same and so on. PC4 does the as PC2 when PC5 connects to it.
I want to know if ebtables could help me build specific frames and how
to send them to the network and how to catch them.


EX.:

   PC1----------PC2--------PC3------PC4--------PC5
(MAC/IP)   (MAC)    (MAC)  (MAC)   (MAC/IP)




If someone could help me i would appreciated.
Thank you and sorry for the bad spelling english.

