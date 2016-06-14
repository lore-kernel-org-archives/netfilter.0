From: Arunsundar <arun.sundar@sawridgesystems.com>
Subject: Conntrack does not Re-Fragment, defragmented packet while forwarding
Date: Tue, 14 Jun 2016 18:39:57 +0530
Message-ID: <57600225.8000906@sawridgesystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

As per few online documents, conntrack will defragment the received 
packets in Prerouting and it again re-fragment before packet leaves the 
machine. But I observe that conntrack defragments and forward the same 
defragmented packet, re-fragment while forwarding is not happening. 
Details below

Requirement:
Receive the fragmented packets in ingress in interface0, mark the packet 
based on IP and port and the marked packet will be sent via a particular 
TC HTB class as it is received in the interface1. IP forward is enabled.

Procedure followed:
used below commands to mark the packet.
     iptables -t mangle -A PREROUTING -i em1 -d 192.xxx.xxx.xxx -p udp 
--dport xxxx -j MARK --set-mark 0x400
     iptables -t mangle -A PREROUTING -i em1 -d 192.xxx.xxx.xxx -p udp 
--dport xxxx -j CONNMARK --save-mark
     iptables -t mangle -A PREROUTING -i em1 -p udp -d 192.xxx.xxx.xxx 
--dport xxxx -j CONNMARK --restore-mark

These above commands work fine for my requirement. As per these 
commands, Contrack defragment the received packets and mark it correctly 
based on IP and port. But when the packet is forwarded to the next 
interface, the defragmented packet is forwarded as it is instead of 
sending the received packets.

Can some one let me know how to re-fragment the packets after 
defragmentation done by conntrack.

Other Info:
iptables v1.4.21
conntrack v1.4.1
Linux Kernel - 4.4.6


-- 
Regards,
Arunsundar.

