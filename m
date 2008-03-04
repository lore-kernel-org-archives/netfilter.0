From: "Andrea Bencini" <andrea.bencini@tin.it>
Subject: bridge firewall and iptables.
Date: Tue, 4 Mar 2008 12:38:26 +0100
Message-ID: <004501c87dec$46690260$0200640a@wtlc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

I have a bridge firewall with dhcp server.

I want that only internal-network clients (eth1-bridge side) can use 
dhcp-server (client asks to dhcp-server IP address etc...) and
I want to stop every DHCPDISCOVER-DHCPOFFER-DHCPREQUEST-DHCPACK etc.. 
from/to local-network clients (eth0-bridge side).

How can I put in practise some rules in my bridge firewall (iptables) to do 
this?

I installed FC8;
iptables-1.3.8-6.fc8

My global network:10.100.0.0/24

Internal-network address range (eth1-bridge side) :from 10.100.0.65 to 
10.100.0.78 (I think I can write 10.100.0.64/28).

dhcp configuration: range dynamic-bootp 10.100.0.65 10.100.0.78

ifcfg-eth0 configuration:
DEVICE=eth0
BOOTPROTO=static
HWADDR=00:50:8B:67:82:6F
ONBOOT=yes

ifcfg-eth1 configuration:
DEVICE=eth1
BOOTPROTO=static
HWADDR=00:50:8B:67:68:A4
ONBOOT=yes

Bridge configuration:
brctl addbr br0
brctl addif eth0
brctl addif eth1
ifdown br0
ifconfig br0 10.100.0.55 netmask 255.255.255.0
ifup br0

Can you help me?

Thanks
Andrea 

