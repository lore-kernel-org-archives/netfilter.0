From: Daniele Rossetti <daniele.rossetti@me.com>
Subject: Sniffer + Iptables
Date: Wed, 10 Aug 2011 13:22:08 +0200
Message-ID: <F39547DD-D193-4529-A40F-88801B58FDD9@me.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello people!
Does someone know how to sniff packets after netfilter chains??
Because tcpdump works before any chain so it capture packets which should be dropped by iptables and I need to sniff only the packets that survive iptables filter
