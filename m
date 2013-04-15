From: "markus lottmann" <LottvomSchlott@gmx.de>
Subject: EPERM instead of ENETUNREACH for "to unreachable" route
Date: Mon, 15 Apr 2013 15:28:16 +0200 (CEST)
Message-ID: <trinity-0ed09791-dae7-40db-b90e-85e114c79679-1366032496429@3capp-gmx-bs01>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi everyone,

I am trying to set up a quite complex routing in which the packets from my software are tos marked and should then leave the system via different interfaces based on this marking. I thereby ran into a problem with a route which goes "to unreachable". The returned error code is EPERM instead of ENETUNREACH and I do not understand why. I broke down the setup to a minimum for the mailing list request to ease the discussion.
The setup is:

ip route shows:
default via 10.0.0.1 dev eth0
10.0.0/24 dev eth0 proto kernel scope link src 10.0.0.2

ip rule shows:
form all lookup local
from all fwmark 0x1 lookup 101
form all lookup main
from all lookup default

ip route show table 101 shows:
unreachable default

iptables only one entry and the default behaviour is set to ACCEPT for all tables:
iptabltes -t mangle -A OUTPUT -m tos --tos 0x1 -j MARK --set-mark 0x1

In this setup the command: ping -Q 1 8.8.8.8 yields EPERM instead of the expected ENETUNREACH. Does anyone have an explanation for this? The only thing I found in a web search was that EPERM is returned if an OUTPUT rule in the filter table is dropping packets.

Greetings,
Markus
