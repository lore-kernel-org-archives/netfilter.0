From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: Re: DNATing back to the same network
Date: Thu, 13 Jan 2005 17:49:40 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0501131747220.2774-100000@e-smith.charlieb.ott.istop.com>
References: <Pine.LNX.4.58.0501132116240.18066@duplo.agenda.si>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0501132116240.18066@duplo.agenda.si>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: danci@agenda.si
Cc: Don Hughes <support@microtechniques.com>, netfilter@lists.netfilter.org


On Thu, 13 Jan 2005 danci@agenda.si wrote:

> On Thu, 13 Jan 2005, Don Hughes wrote:
> 
> > I have a POSTROUTING rule for any internal traffic to SNAT it so 
> > that it returns back to the router instead of directly to the 
> > user.
> 
> That's exactly what I did a few minutes ago! :)
> 
> Are there any other implications this SNAT rule could add?

Yes, your router will be blamed for any attacks on the server which 
originate inside the LAN. You likely won't have any logs to refute such 
claims.

---
Charlie


