From: Michael Crider <mcrider@hoecoop.org>
Subject: NAT rule
Date: Wed, 16 Jul 2008 11:12:35 -0500
Message-ID: <487E1DF3.1090203@hoecoop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am attempting to set up a LAN-to-LAN VPN using ipsec-tools for one of 
our vendors to access a server behind our firewall. However, the local 
IP address of the server (192.168.10.xx) conflicts with a local address 
at the vendor's network. They suggested using NAT to transform the 
server address to 192.168.101.xx and hooking the VPN to the 
192.168.101.0/24 network. I would like to run the VPN on the same 
machine with the firewall (which uses netfilter 1.3.5-4 on CentOS 5.2).  
We need to be able to initiate a connection from either end of the VPN. 
Could anybody recommend iptables rules that would set up the address 
translation?
-- 
Michael Crider

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

