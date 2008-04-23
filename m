From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: nfconntrack and asymmetric routing
Date: Wed, 23 Apr 2008 10:54:01 +0200
Message-ID: <BAY103-DAV1263F9F3556A592C04C847B2E30@phx.gbl>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi folks,

Unfortunately I have a linux firewall
which see half of packets because of a
bad designed network.
nfconntrack table is full of these entries:

ipv4     2 tcp      6 431303 ESTABLISHED src=172.23.1.21 dst=82.9.69.137
sport=25 dport=4036 packets=2 bytes=256 [UNREPLIED] src=82.9.69.137
dst=172.23.1.21 sport=4036 dport=25 packets=0 bytes=0 mark=0 use=1

because netfilter never see the fin/rst
tcp packets.
They never expires and sometimes linux
logs these messages:

nf_conntrack: table full, dropping packet

Is there a way to tell netfilter to delete
these entries?


