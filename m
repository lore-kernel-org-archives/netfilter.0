From: Sylvan Andrew - NIDS <sylvan@nids.com.nf>
Subject: Another way of doing? --state NEW -j DROP
Date: Mon, 03 Nov 2008 14:06:03 +1130
Message-ID: <1225679763.2479.34.camel@sylv>
Reply-To: sylvan@nids.com.nf
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org



Hello One and All, 

 I am sure this might be an easy answer for someone. Could you please
enlighten me ?

I am using the rule below to drop any inbound connections into my .0.3
Class which by default allows any Outbound connections. Plus if the
connection is already established than those outside connections are ok
as well.

iptables -A INPUT -d 192.168.3.0/24 -m state --state NEW -j DROP

However I am now using a router that doesn't support the -m state
--state NEW rule.(crappy GUI thing) :-( Could someone please tell me another way using
iptables to drop any new inbound connections but allow everything else
outbound and the established connection replys to get back into the .0.3
Class ? What is the most secure/easiest way ?

Many Thanks for your help !

Kind Regards

Sylvan 












