From: The Media Server <info@themediaserver.com>
Subject: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Thu, 15 Jan 2015 17:34:29 -0500
Message-ID: <CAJb3rWB_G6AkHAcTP2uCYFzL_VLPG5rgw5cnvyf+qCafF+QtXQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi I can't get my PREROUTING iptables rule to mark my packets via
--set-mark on Ubuntu

iptables -t mangle -A PREROUTING -p tcp --sport 80 -j MARK --set-mark 2
rule add fwmark 2 table 2

iptables -t mangle -A PREROUTING -j MARK --set-mark 2
iptables -t mangle -A INPUT -j MARK --set-mark 2
iptables -t nat -A INPUT -j MARK --set-mark 2
iptables -t nat -A PREROUTING -j MARK --set-mark 2

None of the above pass trough the table2

but this does pass trough the table 2 with this rule:
ip rule add from 192.168.2.0/24 table 2

----
Is there a problem marking packets in Ubuntu 14.04.1 LTS and iptables v1.4.21?

Thks!
