From: Mrunal Upadhyay <m.upadhyay@sta.samsung.com>
Subject: Set DSCP field for ipv6 packets using ip6tables command
Date: Wed, 25 Jan 2012 13:35:11 -0600
Message-ID: <083EE18768D966439D1223E96B690A910629868A65@staex7mb2.telecom.sna.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I am currently trying to set DSCP fields for IPV4 and IPV6 packets with the version 1.3.7 of iptables using Linux kernel 2.6.35.7.

I am able to set the DSCP fields to desired values for the IPV4 packets by the following command:

iptables -t mangle -I OUTPUT -p udp --dport 10000:30000 -j DSCP --set-dscp-class EF

However when I am trying to fire the same command for IPV6 packets, is does not recognize the target DSCP.

So my questions are 
Is there any way to set the TRAFFIC CLASS/ TOS/ DSCP field using ip6tables command for ipv6 packets?
Are there any extensions/modules already developed or being developed for ipv6 packets that I can use to alter the DSCP field?

Thank You,
Mrunal

