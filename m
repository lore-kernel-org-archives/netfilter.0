From: "Eric Estes" <Eric_Estes@aspensquare.com>
Subject: RE: bridge firewall and iptables.
Date: Tue, 4 Mar 2008 07:41:53 -0500
Message-ID: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7E924@ASM220.aspen.com>
References: <004501c87dec$46690260$0200640a@wtlc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <004501c87dec$46690260$0200640a@wtlc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Andrea Bencini
> Sent: Tuesday, March 04, 2008 6:38 AM
> To: netfilter@vger.kernel.org
> Subject: bridge firewall and iptables.
> 
> I have a bridge firewall with dhcp server.
> 
> I want that only internal-network clients (eth1-bridge side) can use
> dhcp-server (client asks to dhcp-server IP address etc...) and
> I want to stop every DHCPDISCOVER-DHCPOFFER-DHCPREQUEST-DHCPACK etc..
> from/to local-network clients (eth0-bridge side).
> 
> How can I put in practise some rules in my bridge firewall (iptables)
to
> do
> this?
> 
> I installed FC8;
> iptables-1.3.8-6.fc8
> 
> My global network:10.100.0.0/24
> 
> Internal-network address range (eth1-bridge side) :from 10.100.0.65 to
> 10.100.0.78 (I think I can write 10.100.0.64/28).
> 
> dhcp configuration: range dynamic-bootp 10.100.0.65 10.100.0.78
> 
> ifcfg-eth0 configuration:
> DEVICE=eth0
> BOOTPROTO=static
> HWADDR=00:50:8B:67:82:6F
> ONBOOT=yes
> 
> ifcfg-eth1 configuration:
> DEVICE=eth1
> BOOTPROTO=static
> HWADDR=00:50:8B:67:68:A4
> ONBOOT=yes
> 
> Bridge configuration:
> brctl addbr br0
> brctl addif eth0
> brctl addif eth1
> ifdown br0
> ifconfig br0 10.100.0.55 netmask 255.255.255.0
> ifup br0
> 
> Can you help me?
> 
> Thanks
> Andrea
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



I have a similar setup and I ended up using ebtables to take care of
that.

ebtables -A INPUT --in-interface eth0 --protocol ipv4 --ip-protocol udp
--ip-source-port 67:68 -j DROP
ebtables -A INPUT --in-interface eth0 --protocol ipv4 --ip-protocol udp
--ip-destination-port 67:68 -j DROP
ebtables -A FORWARD --in-interface eth0 --protocol ipv4 --ip-protocol
udp --ip-destination-port 67:68 -j DROP
ebtables -A FORWARD --in-interface eth0 --protocol ipv4 --ip-protocol
udp --ip-source-port 67:68 -j DROP
