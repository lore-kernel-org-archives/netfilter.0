From: Amish Chana <amish@3g.co.za>
Subject: bridge-nf-filter-pppoe-tagged not working as expected
Date: Tue, 16 Nov 2021 20:11:08 +0200
Message-ID: <5c23297e-2943-2868-a1c7-acdb3172bd3a@3g.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have a fibre to Ethernet converter from my ISP connected to an 
Ethernet router.
The IP packets between the router and the fibre to ethernet converter 
are encapsulated in PPPoE packets.

I've setup a Linux box with 2 ethernet ports between the fibre to 
ethernet converter and the router.

The configuration is as follows:
brctl addbr br0
brctl addif br0 eth0 eth1
ifconfig br0 up

If I use tcpdump on eth0 and eth1 I can see the PPPoE packets.

I would like to setup a transparent firewall on the Linux box. br0, eth0 
and eth1 are not assigned an IP address and there in no routing table 
(except for the lo interface). I currently have no entries in iptables 
and the default policy for INPUT, OUTPUT and FORWARD is ACCEPT.

My understanding from 
https://ebtables.netfilter.org/documentation/bridge-nf.html is that the 
br_netfilter module with bridge-nf-filter-pppoe-tagged enabled will 
allow me to use iptables to filter the PPPoE traffic.

I start a ping from a computer on the network behind the router.
If I run "echo 1 > bridge-nf-filter-pppoe-tagged" in 
/proc/sys/net/bridge then all PPPoE traffic to the fibre to ethernet 
converter is dropped.
"echo 0 > bridge-nf-filter-pppoe-tagged" is required to allow traffic to 
pass again.

If I enable logging in iptables and netfilter I see that the PPPoE 
packets are received by iptables. It passes through the PREROUTING, 
FORWARD and POSTROUTING chains.
However, the IP packets are not leaving the computer encapsulated in PPPoE.

I've tested with bridge-nf-filter-vlan-tagged and 802.1Q traffic, and IP 
filtering works as expected with packets entering and leaving as expected.

PPPoE packets are not leaving when bridge-nf-filter-pppoe-tagged is enabled.
Any ideas on how I can get it to work.

Thank you,
Amish

