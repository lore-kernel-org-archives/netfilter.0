From: "FAIR, ED" <ef7193@att.com>
Subject: SNMP mangling anybody?
Date: Wed, 29 Nov 2017 16:27:26 +0000
Message-ID: <038581F89849074CAFDAFA8E4AE887F41F76D74C@GAALPA1MSGUSRBF.ITServices.sbc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

Are there any members here successfully mangling SNMP requests/replies (udp 161)?  I'm trying to policy-route my outbound SNMP requests, but my efforts have been unsuccessful to date.  I'd like to hear how you do it.

I have two interfaces in play; I do not have routing turned on; bond0.1 is used for the default route (main table); I would like to policy-route just the locally-generated SNMP requests via bond0.2 towards a NAT device.  So I use:

	ip route add to unicast default table 7 via 192.168.168.7 dev bond0.2 src 192.168.168.3   #192.168.168.7 is a NAT server, 192.168.168.3 is the address assigned to bond0.2
	iptables -t mangle -A OUTPUT -p udp --dport 161 -j MARK --set-mark 256
	ip rule add priority 9999 type unicast fwmark 256 table 7
	ip route flush cache table 7

In the above configuration, the SNMP requests correctly egress via bond0.2 - the policy-routing is having some effect - but the requests retain the bond0.1 address in the IP SRC - the policy-routing doesn't update the IP SRC as I had hoped.  

For testing, I'm using net-snmp-utils "snmpget" command, with no "clientaddr" specified.

Thanks in Advance!
