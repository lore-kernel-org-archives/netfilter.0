From: Randy Thornton <randy@circadence.com>
Subject: checksum issue with xtables-addons RAWNAT
Date: Thu, 6 Feb 2014 09:31:20 -0700
Message-ID: <C64F36CD7E08D64DBEF606F50981DC8E0CCE2F3B58@SERVER02.circadence.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


I'm trying to use RAWSNAT and RAWDNAT commands to route traffic through a proxy.  It works correctly for IPV4 traffic, but fails on IPV6 traffic.  The IP addresses are modified correctly, but the IP checksum is incorrect and the destination refuses the packets.

Command that redirects the outgoing packets:
ip6tables -t raw -A OUTPUT  -p tcp -d fd00:192:168:200::100 --dport 80  -j RAWDNAT --to-destination fd00:172:168:0::11

I'm running xtables-addons-1.47.1 on Centos 6 with the latest kernel 2.6.32-431.3.1.el6.x86_64.

Has anyone used these commands successfully with IPV6 connections?  
Has this been fixed in a later release of xtables-addons?  If so, can anyone point me to the fix?

Randy Thornton
Circadence
randy@circadence.com
