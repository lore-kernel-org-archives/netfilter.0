From: andy thomas <tds@virt1.netstat-a.net>
Subject: Using iptables to anonymize incoming IP addresses
Date: Wed, 30 Sep 2009 15:14:33 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0909301456490.29957@virt1.netstat-a.net>
Reply-To: andy@time-domain.co.uk
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I would like to set up a Linux router with two NICs, one connected to the
public Internet and the other NIC having the IP address 192.168.1.1
connected to a private 192.1.68.1.0/24 network. The routing would be
arranged so that all incoming packets from the public network with TCP
port 80 (ie, web traffic) are forwarded to a webserver on the private LAN
with IP address 192.168.1.2 - so far so good and this can be done with
DNAT.

But, I want all the packets received by the webserver to appear to be
coming from the address 192.168.1.1, not the external public IP address
they really came from, eg the apache logs will show all page requests as
coming from 192.168.1.1. Can this be done with iptables?

Andy
