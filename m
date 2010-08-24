From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: OFF??? POINT-TO-POINT
Date: Tue, 24 Aug 2010 19:36:06 +0200
Message-ID: <4C740306.1010209@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

  Hi List.

My ISP set up this "IPVPN":

A location:

VLAN4093: ww.xx.yy.zz/30
  Public IP to Internet.
VLAN4094: 192.168.0.2/30
  Endpoint of "VPN" (a tunnel to B)

B location:
192.168.1.2/30 (No VLAN)

I thought that I can set up an point-to-point connection. But this is 
only available for PPP/SLIP/etc. "driven" interfaces.
I can set up the connection with the following lines in my interfaces file:

auto vlan4094
iface vlan4094 inet static
     address 192.168.0.2
     netmask 255.255.255.255
     pointopoint 192.168.1.2
     vlan_raw_device wan3
     up /sbin/ifconfig vlan4094 up arp
     up /sbin/route add -host 192.168.1.2 dev vlan4094
     down /sbin/route del -host 192.168.1.2 dev vlan4094

This works, however the interface just ignores the pointopoint line....

My question is maybe offtopic, but anyone knows a good reason why the 
pointopoint feature is not available on "normal" interfaces?

Thanx,

Swifty
