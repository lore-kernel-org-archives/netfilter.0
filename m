From: Philip Craig <philipc@snapgear.com>
Subject: Re: pptp conntrack requirements (was Re: ip_conntrack_pptp and inbound
 PPTP/GRE)
Date: Fri, 06 Aug 2004 10:50:01 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4112D5B9.60207@snapgear.com>
References: <Pine.LNX.4.44.0408051012120.31760-100000@e-smith.charlieb.ott.istop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0408051012120.31760-100000@e-smith.charlieb.ott.istop.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Cc: netfilter@lists.netfilter.org

Charlie Brady wrote:
> Do you happen to know what the prerequisites are? I'll do what digging I 
> can into what I have, but it could short cut the process if you know 
> specifics.
> 
> Meanwhile I'll grab a 2.4.18 kernel, and apply patch-o-matic, and see how 
> that matches what I have.

The patches were spread out over various kernels up until around 2.4.23.
You should be able to obtain these from the old version of patch-o-matic
(ie not patch-o-matic-ng).  Just apply everything in the submitted
directory.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


