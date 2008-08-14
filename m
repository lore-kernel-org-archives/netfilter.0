From: "Stephen Isard" <y8ju2p902@sneakemail.com>
Subject: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 14:51:49 -0400 (EDT)
Message-ID: <19894-78618@sneakemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm wondering whether there are iptables rules that will permit cups 
snmp printer discovery to operate without creating a serious security 
risk.

Cups printer discovery works by sending a broadcast from a high numbered 
port (a different one each time) to the snmp port (161) of every device 
on the local network.  Printers are then supposed to send back replies 
from their port 161 to the high numbered port on the computer that the 
broadcast came from.  Since the replies are to a broadcast, they are not 
treated as ESTABLISHED or RELATED by iptables rules.  My question is 
really whether there is some way of identifying replies to such a 
broadcast, so that I don't have to let through all udp packets from port 
161 of any machine on the local network to all high numbered ports on my 
machine, at any time, which looks as if it might be unsafe, especially 
when I can't be certain that the local network is absolutely secure 
against break-ins.

Thanks.
