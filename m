From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: netfilter-queue: Incorrect UDP checksum computation in
 nfq_udp_compute_checksum_ipv4
Date: Fri, 1 Apr 2016 12:44:31 +0200
Message-ID: <20160401104431.GA1318@salvia>
References: <56FE35C2.2070202@etas.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FE35C2.2070202@etas.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Koehrer <mathias.koehrer@etas.com>
Cc: netfilter@vger.kernel.org

On Fri, Apr 01, 2016 at 10:48:02AM +0200, Mathias Koehrer wrote:
> Hi all,
> 
> the function nfq_udp_compute_checksum_ipv4 (src/extra/udp.c) does not
> compute the correct UDP checksum.
> The issue is caused by the called function checksum_tcpudp_ipv4()
> (src/extra/checksum.c) that uses the hard coded protocol id IPPROTO_TCP
> which is fine for TCP but fails for UDP.
> A possible solution might be to pass the protocol id (IPPROTO_TCP /
> IPPROTOC_UDP) as parameter to the function checksum_tcpudp_ipv4().
> 
> The very same is also true for the IPv6 versions of these functions.
> 
> Any feedback is welcome.

Would you send us a patch to fix this? Thanks!
