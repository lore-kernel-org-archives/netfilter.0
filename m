From: Gilles <gilles.ganault@free.fr>
Subject: [1.3.6] "Couldn't find match `string'"?
Date: Thu, 31 Mar 2011 14:06:55 +0200
Message-ID: <qbr8p69r6r6favuori53ct8bepfg8mefeo@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello

	I don't have much experience with iptables, and need to use it on an
appliance running uClinux so I can filter packets.

The appliance provides iptables 1.3.6, and I get this error when
trying to add a rule:
=========
> iptables -A INPUT -p udp -m udp --dport 5060 -m string --string "test" --algo bm -j DROP
iptables v1.3.6: Couldn't find match `string'
=========

Does someone know if it's a bug in that old release, or is the default
settings wrong to use the "-m string" option (in which case: What
should I change in the Makefile)?

Thank you.

