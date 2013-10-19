From: Tiebing Zhang <tzhang@ncst.com>
Subject: IPSec VPN client and SNAT
Date: Sat, 19 Oct 2013 13:22:18 +0000
Message-ID: <63D56E37DD5D8F49B566E188E684C57E17585B41@VAMAIL2.ncst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi everyone,

I am having an issue with IPsec VPN client serving as a Gateway using SNAT to allow other computers connected to it to pass traffic through the VPN tunnel.  This is my setup

[ 192.168.46.0/24 ] <-------> [ 192.168.46.1  192.168.2.102  192.158.5.200 ] <-----> [ 192.168.5.60 ] <------> [ 192.168.1.81]
     TestPC                                          GW, Linux 3.6 and Shrew VPN Client                        VPN Server                      Remote Test Server

1. GW establish vpn using Shrew Soft with VPN Server. 192.168.2.102 is the "VPN" assigned address. It is able to ping 192.168.1.81 through the VPN tunnel. The 2nd network interface, with address 192.168.46.1, is connected to "TestPC". SNAT/Masquerade runs on GW so that TestPC can use the VPN tunnel.
2. As a VPN client, GW works fine. It can talk to Remote Test Server.
3. The problem is that ping from TestPC to Remote Test Server does not work. Remote Test Server received the ping request and sent back "echo reply". The response was received by the VPN client but was never sent back to TestPC.
4. I traced the packet through the excellent NetFilter packet flow diagram (http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg), and observed that the return packet is "xfrm decoded" correctly and shows up in the "mangle prerouting" table with the correct plaintext source and destination address, which is SRC: 192.168.1.81 DST: 192.168.2.102, but never shows up in the next "nat prerouting" table or any other table following it ( I tried to log it in both "mangle forward" table and "mangle input" table, but nothing showed up.

My SNAT rule looks like this:
iptables -t nat -A POSTROUTING -s 192.168.46.0/24 -j SNAT --to 192.168.2.102

So my questions are:
1. Does Linux kernel-based IPsec VPN supports SNAT? Not having a virtual network interface seems to make SNAT not as straightforward (for example vpnc works fine in above setup because it uses tun/tap device and has a virtual interface). Also early versions of 2.6 kernel seems to require a patch for this work, but I suppose that has been fixed a long time ago.
2. Is there any way to tell what happened to the "reply" packet? I would like to know whether the "de-SNAT" process happened correctly, and also get a log entry if netfilter decided to drop the packet. Right now it seems that the packet just disappeared after "mangle prerouting" table.

Thank you very much for your time. 