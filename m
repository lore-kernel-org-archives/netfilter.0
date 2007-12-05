From: Peter Van Eeckhoutte <peter.ve@telenet.be>
Subject: route back over same interface - traffic blocked
Date: Wed, 5 Dec 2007 10:28:21 +0100
Message-ID: <C0641B79F7D6A44791BA8FA35BC143F914D61FB242@apollo.corelan.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all,

I have a fedora (core 6) box running iptables (1.3.8), acting as a firewall/router
The server is connected to the internet, and behind the fedora box, there are 2 subnets

Internet - Firewall - Subnet1 - Router - Subnet 2

Subnet1 = 192.168.0.0/24, Firewall : 192.168.0.1, Router = 192.168.0.254
Subnet2 = 192.168.3.0/24, Router : 192.168.3.254

On the firewall, I have created a route to 192.168.3.0/24, pointing to the Router between Subnet1 and Subnet2

Destination    Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.3.0    192.168.0.254   255.255.255.0   U     0      0        0 eth0

I have a rule in iptables, allowing all traffic from 192.168.0.0/24 towards 192.168.3.0/24

When clients from 192.168.0.0/24 try to connect to hosts in 192.168.3.0/24, the packet is sent to their default gateway (which is the firewall).
I would have expected the firewall to forward the packet to the router between 192.168.0.0 and 192.168.3.0
But all I can see in the log is a   "DENY  in=eth0 out=eth0 "

So when the traffic is routed back out over the same interface, traffic appears to be blocked

How can I solve this ?

Thanks

P












This transmission is intended only for use by the intended recipient(s).  If you are not an intended recipient you should not read, disclose, copy, circulate or in any other way use the information contained in this transmission.  The information contained in this transmission may be confidential and/or privileged.  If you have received this transmission in error, please notify the sender immediately and delete this transmission including any attachments.
