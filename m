From: Philip Craig <philipc@snapgear.com>
Subject: Re: pptp_conntrack_nat - patch-o-matic-ng-20040409 - kernel 2.4.25
Date: Tue, 13 Apr 2004 12:25:09 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407B4F85.70109@snapgear.com>
References: <3340.217.83.169.111.1081644254.squirrel@217.83.169.111>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3340.217.83.169.111.1081644254.squirrel@217.83.169.111>
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
To: Philipp Stader <me@ph1l.de>
Cc: netfilter@lists.netfilter.org

Philipp Stader wrote:
> i downloaded linux 2.4.25 from kernel.org, patch-o-matic-ng-20040409 and
> iptables 1.2.9. Unpacked all in /usr/src/ created links linux and iptables
> then applied the pptp_conntrack_nat patch which applied without errors.
> When  i try to compile the kernel i get the following errors.
> 
> net/network.o: In function `pptp_expectfn':
> net/network.o(.text+0x3e899): undefined reference to
> `ip_ct_gre_keymap_destroy'
> net/network.o: In function `pptp_timeout_related':
> net/network.o(.text+0x3e8cc): undefined reference to
> `ip_ct_gre_keymap_destroy'
> net/network.o: In function `conntrack_pptp_help':
> net/network.o(.text+0x3ed09): undefined reference to `ip_ct_gre_keymap_add'
> net/network.o(.text+0x3ed2e): undefined reference to `ip_ct_gre_keymap_add'
> net/network.o(.text+0x3ed96): undefined reference to `ip_ct_gre_keymap_add'
> net/network.o(.text+0x3edaa): undefined reference to `ip_ct_gre_keymap_add'
> net/network.o(.text+0x3edc8): undefined reference to
> `ip_ct_gre_keymap_destroy'
> net/network.o: In function `tcp_help':
> net/network.o(.text+0x3fd66): undefined reference to
> `ip_ct_gre_keymap_change'
> net/network.o(.text+0x3fd73): undefined reference to
> `ip_ct_gre_keymap_change'

This patch should fix that:

http://lists.netfilter.org/pipermail/netfilter-devel/2004-March/014618.html

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


