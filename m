From: Jason Opperisano <opie@817west.com>
Subject: Re: Nat before routing decision
Date: Mon, 15 Nov 2004 09:51:25 -0500
Message-ID: <1100530284.3405.11.camel@hubcap.ljm.dom>
References: <F3587E1621849A48851F432E5DF9805823A358@xw2k-frambx-04.ads.dlh.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F3587E1621849A48851F432E5DF9805823A358@xw2k-frambx-04.ads.dlh.de>
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
To: netfilter@lists.netfilter.org

On Mon, 2004-11-15 at 06:44, thomas.elsaesser@lhsystems.com wrote:
> Dear all,
> 
> I need src nat before the packet go to the routing decision.
> How can i do it.
> 
> Kind Regards
> 
> Thomas

well, SNAT is only valid in POSTROUTING of the NAT table.  if you need
to apply alternate routing to a packet and translate it's source, you
can follow the theory of:

1) mark packet in PREROUTING of MANGLE
2) route based on MARK
3) SNAT packet in POSTROUTING of NAT

-j

--
"Another day, another box of stolen pens."
	--The Simpsons


