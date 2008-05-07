From: "eial@cs.bgu.ac.il" <eial@cs.bgu.ac.il>
Subject: accept rule not working.
Date: Wed, 7 May 2008 18:14:43 +0300 (IDT)
Message-ID: <200805071514.m47FEhxC008001@indigo.cs.bgu.ac.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I've created this rule:
/sbin/iptables -A INPUT -i eth0 -p tcp -m state --state NEW --sport 80 -s 192.168.113.94 -j ACCEPT

but the firewall still blocks it, I guess there is a typo somewhere but I cant seem to be able to find it
any hints?

thanks


