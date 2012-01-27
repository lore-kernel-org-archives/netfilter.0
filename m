From: <abirvalg@lavabit.com>
Subject: can't set mark on icmp with conntrack -U
Date: Fri, 27 Jan 2012 23:05:12 +0000
Message-ID: <20120127230512.56139cfa@wwwwww-701SD>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
As root I try to set marks on all packets originating from my machine with

conntrack -U -s 192.168.1.114 --mark 10

It does set marks on some udp connections but ignores the icmp one.
Upon the issue of this command it lists all updated udp connections with mark=10 and eventually gives
....
conntrack v0.9.14 (conntrack-tools): Operation failed: invalid parameters

conntrack -L shows that all udp connections that preceed in the list the icmp one where updated, but the icmp connection and all udp connections following it in the list were not updated. Seems like conntrack choked on icmp.

Could you please help me.
uname -a
Linux wwwwww-701SD 2.6.35-30-generic #60-Ubuntu SMP Mon Sep 19 20:45:08 UTC 2011 i686 GNU/Linux

P.S.
Please CC me when replying.

