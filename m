From: Jason Opperisano <opie@817west.com>
Subject: Re: SNAT and IPSEC
Date: Thu, 14 Apr 2005 13:01:17 -0400
Message-ID: <20050414170117.GA1994@bender.817west.com>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
	<425C1D5F.7000302@lopsch.com>
	<1113393681.4244.3.camel@fly.in.iantel.com.uy>
	<d3j9vh$tnf$1@sea.gmane.org> <425E783F.5070502@lopsch.com>
	<1113491959.6180.17.camel@fly.in.iantel.com.uy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113491959.6180.17.camel@fly.in.iantel.com.uy>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Apr 14, 2005 at 12:19:18PM -0300, Eduardo Spremolla wrote:
> Are these patches incorporated in some iptables version so far?
> 
> I'm running 1.2.9-2.3.1 now. and do not have development environment in
> that box, as a secure measure.
> 
> Thanks to every body who replayed so far.

the patches in question:

  ipsec-01-output-hooks
  ipsec-02-input-hooks
  ipsec-03-policy-lookup
  ipsec-04-policy-checks

are kernel patches, not iptables userspace patches.

-j

--
"Carter Pewterschmidt: Oh my god. He's violating Sea Breeze.
 Peter: No, he's just awkwardly positioning himself... OK, NOW he's
 violating Sea Breeze."
        --Family Guy

