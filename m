From: Philip Craig <philipc@snapgear.com>
Subject: Re: Can not apply ip_conntrack_pptp to 2.4.26 kernel
Date: Thu, 20 May 2004 09:49:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40ABF288.7000809@snapgear.com>
References: <web-73360234@tut.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-73360234@tut.by>
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
To: Alexander Dudko <octo@tut.by>
Cc: netfilter@lists.netfilter.org

Alexander Dudko wrote:
> After reboot, MASQUERADE and NAT targets do not work.
> What should I do?

This typically happens if you don't rebuild iptables.
Are you sure your path is set to use the iptables you just built?

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


