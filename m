From: Philip Craig <philipc@snapgear.com>
Subject: Re: pptp-conntrack-nat.
Date: Wed, 05 May 2004 13:24:16 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40985E60.5030607@snapgear.com>
References: <2BE915A69EF4D2119A0800805FF5E0501F14EA44@brspm201.exbr01.exch.eds.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2BE915A69EF4D2119A0800805FF5E0501F14EA44@brspm201.exbr01.exch.eds.com>
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
To: "Ampugnani, Fernando" <fernando.ampugnani@eds.com>
Cc: netfilter@lists.netfilter.org

Ampugnani, Fernando wrote:
> Hi all,
> 	I tried apply the patch pptp conntrack on 3 different kernel
> versions. None of them worked for me. I tried on 2.4.14, 2.4.21 and 2.4.26.
> The patch is not getting applied cleanly on any of these.Could anyone please
> tell me with which kernel version this patch works?

It will work with any recent 2.4 kernel.  So definitely 2.4.26,
probably 2.4.21, and definitely not 2.4.14.

> This is the output that I can see:
> Welcome to Patch-o-matic (1.14)!
> Kernel:         /usr/src/linux
> Iptables:       /usr/src/iptables
> Each patch is a new feature: many have minimal impact, some do not.
> Almost every one has bugs, so don't apply what you don't need!
> -----------------------------------------------------
> Already applied:
> Not all requirements fulfilled for pptp-conntrack-nat, skipping:
>  This patch is missing Config.in for 2.4.x
> Excellent! Source trees are ready for compilation.
> Thanks in advance.

This is a known problem with the 20040302 pom-ng, and has been
fixed in CVS.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


