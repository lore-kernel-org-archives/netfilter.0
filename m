From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: pptp conntrack requirements (was Re: ip_conntrack_pptp and inbound
 PPTP/GRE)
Date: Thu, 5 Aug 2004 10:41:15 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0408051012120.31760-100000@e-smith.charlieb.ott.istop.com>
References: <4111B04A.4090801@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4111B04A.4090801@snapgear.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org


On Thu, 5 Aug 2004, Philip Craig wrote:

> Is there any reason you are still using 2.4.18?  It is quite likely
> that this kernel is lacking patches that are required for PPTP
> connection tracking.

Do you happen to know what the prerequisites are? I'll do what digging I 
can into what I have, but it could short cut the process if you know 
specifics.

Meanwhile I'll grab a 2.4.18 kernel, and apply patch-o-matic, and see how 
that matches what I have.

Thanks

---
Charlie


