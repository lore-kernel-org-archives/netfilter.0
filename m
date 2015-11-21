From: Roger Price <roger@rogerprice.org>
Subject: iptables: unknown protocol "!" specified
Date: Sat, 21 Nov 2015 21:48:47 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1511211917160.3864@maria.rogerprice.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi, I'm reading the iptables tutorial 1.2.2 by Oskar Andreasson at 
https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html where I 
read:

  Match           -p, --protocol
  Example         iptables -A INPUT -p tcp
  Explanation ... This match can also be inversed with the !
  sign, so --protocol ! tcp would mean to match UDP and ICMP.

So I tried it on openSUSE 13.2 and iptables replied:

  pinta:~ # iptables -A INPUT --protocol ! icmp
  iptables v1.4.21: unknown protocol "!" specified
  Try `iptables -h' or 'iptables --help' for more information.

Escaping the ! as \! makes no difference.  I am doing something wrong. 
Any suggestion as to what it is would be very welcome.

Roger
