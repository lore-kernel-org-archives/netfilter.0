From: Philip Craig <philipc@snapgear.com>
Subject: Re: disabling connection tracking
Date: Fri, 29 Aug 2003 10:32:16 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4E9F10.5030403@snapgear.com>
References: <1061809936028593@lycos-europe.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1061809936028593@lycos-europe.com>
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
To: Kurt Tragant <k.tragant@firemail.de>
Cc: netfilter@lists.netfilter.org

Kurt Tragant wrote:
> I did some tests with connection tracking and decided finally to switch off
> conntrack. So I deselected connection tracking in the kernel. But if I start the
> computer there is still a:
> 
> ip_conntrack version 2.1 (2047 buckets, 16376 max) - 152 bytes per conntrack

You probably have an ip_conntrack module that it is loading still.
Do a lsmod to see.  You'll need to delete it (or you might be able
to add something to /etc/modules.conf).  Look under
/lib/modules/$(KERNELRELEASE)/kernel/net/ipv4/netfilter/

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


