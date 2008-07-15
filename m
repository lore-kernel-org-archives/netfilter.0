From: "Andrea Bencini" <andrea.bencini@tin.it>
Subject: icmp-redirect
Date: Tue, 15 Jul 2008 22:25:33 +0200
Message-ID: <004c01c8e6b8$f215b920$0200640a@wtlc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

I have a local network (10.100.0.0/24) and my default gateway is a firewall 
(fw;eth0=10.100.0.1) with linux OS and netfilter.
In the same network I have an other gateway (linux OS and netfilter) to 
connect a local subnetwork (10.6.70.0/24). Gateway eth0 is 10.100.0.241 and 
gateway eth1 is 10.6.70.241.
In the local network (10.100.0.0/24) I have windows client (XP prof) and 
default gateway of these is 10.100.0.1.
I want implement "icmp redirect" in the firewall (default gateway); What do 
I have to add or to change in my firewall?

Thanks
Andrea

