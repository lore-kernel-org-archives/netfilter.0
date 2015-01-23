From: Thomas Preissler <thomas@preissler.co.uk>
Subject: Re: Order of iptables vs. ip6tables chains
Date: Fri, 23 Jan 2015 22:51:43 +0000
Message-ID: <20150123225143.GB3522@blackhole.tracing.lan>
References: <20150123223116.GA3522@blackhole.tracing.lan>
 <54C2CD64.5000104@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54C2CD64.5000104@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Noel,

On Fri, Jan 23, 2015 at 11:38:28PM +0100, Noel Kuntze wrote:
> This [1] picture shows where the chains are used.
> Also, IPv4 traffic is only handled by iptables rules and IPv6 traffic
> obviously only by ip6tables rules. iptables only handles ip traffic, not decnet or any
> other fancy layer three protocol.

[1] http://inai.de/images/nf-packet-flow.png

Ah yeah, thanks, I forgot about this picture. 
But where does ip6tables fit in here? Does it first run through the
whole netfilter stack as in [1], and then for v6, or is it doing it
in some mixed way:

1) mangle PREROUTING v4
2) mangle PREROUTING v6
3) mangle INPUT v4
4) mangle INPUT v6
5) filter INPUT v4
6) filter INPUT v6

and so on (I skipped NAT... as there is no v6 NAT (haha - I know)).

(It is late here and I am tired and I just can't remember why I needed
to know that.)


Cheers

Thomas

-- 
www.preissler.co.uk | Twitter: @module0x90 | PGP-Key: 75889415
GPG Fingerprint:  CCBD 153A D257 CA7E A217  FDF7 5928 03D1 7588 9415
