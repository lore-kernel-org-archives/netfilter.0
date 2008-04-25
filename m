From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: nfconntrack and asymmetric routing
Date: Fri, 25 Apr 2008 19:34:46 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804251934090.20150@fbirervta.pbzchgretzou.qr>
References: <BAY103-DAV1263F9F3556A592C04C847B2E30@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY103-DAV1263F9F3556A592C04C847B2E30@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-04-23 10:54, Marco Berizzi wrote:
>
>Unfortunately I have a linux firewall
>which see half of packets because of a
>bad designed network.
>nfconntrack table is full of these entries:
>
>ipv4     2 tcp      6 431303 ESTABLISHED src=172.23.1.21 dst=82.9.69.137
>sport=25 dport=4036 packets=2 bytes=256 [UNREPLIED] src=82.9.69.137
>dst=172.23.1.21 sport=4036 dport=25 packets=0 bytes=0 mark=0 use=1
>
>because netfilter never see the fin/rst
>tcp packets.
>They never expires and sometimes linux
>logs these messages:
>
>nf_conntrack: table full, dropping packet
>
>Is there a way to tell netfilter to delete
>these entries?

Would not it be better to disable connection tracking for
the asymmetrically routed packets?
