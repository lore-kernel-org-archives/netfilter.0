From: Mathias Koehrer <mathias.koehrer@etas.com>
Subject: netfilter-queue: Incorrect UDP checksum computation in
 nfq_udp_compute_checksum_ipv4
Date: Fri, 1 Apr 2016 10:48:02 +0200
Message-ID: <56FE35C2.2070202@etas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

the function nfq_udp_compute_checksum_ipv4 (src/extra/udp.c) does not 
compute the correct UDP checksum.
The issue is caused by the called function checksum_tcpudp_ipv4() 
(src/extra/checksum.c) that uses the hard coded protocol id IPPROTO_TCP 
which is fine for TCP but fails for UDP.
A possible solution might be to pass the protocol id (IPPROTO_TCP / 
IPPROTOC_UDP) as parameter to the function checksum_tcpudp_ipv4().

The very same is also true for the IPv6 versions of these functions.

Any feedback is welcome.

Best regards

Mathias
