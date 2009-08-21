From: Egon Burgener <egon.burgener@terreactive.ch>
Subject: conntrackd external cache does not contain NAT information
Date: Fri, 21 Aug 2009 11:16:32 +0200
Message-ID: <3E64FDDA-1B89-4548-8A52-B7D15BCF3E40@terreactive.ch>
Mime-Version: 1.0 (Apple Message framework v935.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hi

I am building a firewall with
   kernel 2.6.29.6
   iptables 2.4.4
   conntrack-tools 0.9.13 (FTFW mode)
   heartbeat version 1

conntrack synchronisation works fine except NAT traffic. If I do
conntrackd -i on the active node I see the NAT information in it:

tcp      6 ESTABLISHED src=192.168.12.20 dst=12.129.147.65 sport=2403  
dport=80 src=12.129.147.65 dst=84.73.54.61 sport=80 dport=2403  
[ASSURED] [active since 48s]

On the standby node I am missing the NAT information (conntrackd -e):

tcp      6 ESTABLISHED src=192.168.12.20 dst=12.129.147.65 sport=2403  
dport=80 [ASSURED] [active since 91s]

Has anybody a hint?

Thx
Egon
-- 
-----------------------------------------------------------------------------------------
addr://Kasinostrasse 30, CH-5001 Aarau   fon://++41 62 823 9355
http://www.terreactive.com                             fax://++41 62  
823 9356
------------------------------------------------------------------------------------------
Wir sichern Ihren Erfolg.                                 terreActive AG
------------------------------------------------------------------------------------------
