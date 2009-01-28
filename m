From: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Subject: Blocking outgoing 802.11 ACKs
Date: Wed, 28 Jan 2009 02:41:22 -0800 (PST)
Message-ID: <441977.39906.qm@web31604.mail.mud.yahoo.com>
Reply-To: kpele_ntua@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: kpele_ntua@yahoo.com

Hi all,

I have two nodes communicating via their wireless interfaces.  Let us assume that node A sends packets to node B.  Once node B is receiving the packets, he transmits the 802.11 ACK frame.  What I want to do is to prevent node B from sending this ACK frames once every two packets for example. 

One indirect way I have thought about is setting the following rule to node B:

iptables -A INPUT -i ath0 -m limit --limit _SPECIFIED-LIMIT_ -s _NODE'S A IP_ -j DROP

However,  I am not sure if this prevents the 802.11 ACKs from being transmitted.  This has to do with the place where the above rule is being enforced.

Do you have any comments or suggestions on how I can achieve what I am trying to?

Thanks,
Kostas


      
