From: Philip Craig <philipc@snapgear.com>
Subject: Re: disabling connection tracking
Date: Fri, 29 Aug 2003 18:22:59 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4F0D63.9050301@snapgear.com>
References: <1061809936028593@lycos-europe.com> <3F4E9F10.5030403@snapgear.com> <200308290810.12734.k.tragant@firemail.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200308290810.12734.k.tragant@firemail.de>
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
To: k.tragant@firemail.de
Cc: netfilter@lists.netfilter.org

k.tragant@firemail.de wrote:
> # CONFIG_MODULES is not set
> 
> #   IP: Netfilter Configuration
> CONFIG_IP_NF_IPTABLES=y
> CONFIG_IP_NF_MATCH_MULTIPORT=y
> CONFIG_IP_NF_FILTER=y
> CONFIG_IP_NF_TARGET_REJECT=y
> CONFIG_IP_NF_TARGET_LOG=y

I built a kernel with this config, and it didn't have ip_conntrack.

> Maybe there are other ideas?

Just a couple of things to track down exactly where the problem is:

grep tells me that net/ipv4/netfilter/ip_conntrack_core.c is the only
place in the kernel that "ip_conntrack version" appears, so check if
net/ipv4/netfilter/ip_conntrack_core.o exists.  If it does, then double
check your config, or look in net/ipv4/netfilter/Makefile to work out
what is causing it to be compiled.

If it doesn't exist, then cat /proc/version to ensure you are running
the new kernel.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


