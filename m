From: Netravali Ganesh <gnetravali@sonusnet.com>
Subject: Routing the DNS Traffic via specific interface.
Date: Wed, 25 Jan 2012 07:41:37 +0000
Message-ID: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi ..

I have 2 interfaces eth0 and eth1 on the system connected to different subnets. I need to route all the outgoing DNS traffic of the system via eth1 interface. Pls let me know if below IPTABLES rules is proper way ?

Block the output DNS traffic on eth0 interface.

iptables -A FORWARD -p udp -o eth0 --dport 53 -j DROP

Forward output DNS traffic from eth1 interface

iptables -A FORWARD -p udp -o eth1 --dport 53 -j ACCEPT


Thanks
Ganesh


