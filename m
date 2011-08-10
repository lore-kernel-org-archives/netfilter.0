From: =?iso-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: AW: Sniffer + Iptables
Date: Wed, 10 Aug 2011 13:28:54 +0000
Message-ID: <515168F006F2D643952F8FFD24F2E0739D6480CA@sonne2.gw.bringe.net>
References: <F39547DD-D193-4529-A40F-88801B58FDD9@me.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F39547DD-D193-4529-A40F-88801B58FDD9@me.com>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Daniele Rossetti <daniele.rossetti@me.com>

Hi,

Daniele Rossetti asked:
> Does someone know how to sniff packets after netfilter chains??
> Because tcpdump works before any chain so it capture packets which
> should be dropped by iptables and I need to sniff only the packets that
> survive iptables filter

I think you want ulogd and its pcap output plugin for that. Basically the idea is to log the packets you're interested in and later on analyze the ulogd logfile with tcpdump.

HTH,
Thomas
