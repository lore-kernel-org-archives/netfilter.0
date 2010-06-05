From: Thanasis <thanasis@asyr.hopto.org>
Subject: prevent iptables LOG target from flooding dmesg
Date: Sat, 05 Jun 2010 23:42:21 +0300
Message-ID: <4C0AB6AD.104@asyr.hopto.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

The subject says it all.
I have set up logging like so :
--------------------------------------------------------------------------------------------------------------------
iptables -A INPUT -m state --state INVALID -j LOG --log-prefix "DROP
INVALID " --log-ip-options --log-tcp-options
iptables -A INPUT -i $INTIF ! -s $LAN -j LOG --log-prefix "SPOOFED PKT "
iptables -A INPUT ! -i lo -j LOG --log-prefix "DROP " --log-ip-options
--log-tcp-options
iptables -A OUTPUT -m state --state INVALID -j LOG --log-prefix "DROP
INVALID " --log-ip-options --log-tcp-options
iptables -A OUTPUT ! -o lo -j LOG --log-prefix "DROP " --log-ip-options
--log-tcp-options
iptables -A FORWARD -m state --state INVALID -j LOG --log-prefix "DROP
INVALID " --log-ip-options --log-tcp-options
iptables -A FORWARD -i $INTIF ! -s $LAN -j LOG --log-prefix "SPOOFED PKT "
iptables -A FORWARD ! -i lo -j LOG --log-prefix "DROP " --log-ip-options
--log-tcp-options
--------------------------------------------------------------------------------------------------------------------
and dmesg is flooded by DROP log messages etc.
I have NETFILTER_NETLINK_LOG [=m]
in the kenel config, but I don't know how to use it,
(and what the module name is).
Any pointers/help will be much appreciated.


