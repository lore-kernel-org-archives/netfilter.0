From: "Philipp Stader" <me@ph1l.de>
Subject: pptp_conntrack_nat - patch-o-matic-ng-20040409 - kernel 2.4.25
Date: Sun, 11 Apr 2004 02:44:14 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3340.217.83.169.111.1081644254.squirrel@217.83.169.111>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello list,

i downloaded linux 2.4.25 from kernel.org, patch-o-matic-ng-20040409 and
iptables 1.2.9. Unpacked all in /usr/src/ created links linux and iptables
then applied the pptp_conntrack_nat patch which applied without errors.
When  i try to compile the kernel i get the following errors.

net/network.o: In function `pptp_expectfn':
net/network.o(.text+0x3e899): undefined reference to
`ip_ct_gre_keymap_destroy'
net/network.o: In function `pptp_timeout_related':
net/network.o(.text+0x3e8cc): undefined reference to
`ip_ct_gre_keymap_destroy'
net/network.o: In function `conntrack_pptp_help':
net/network.o(.text+0x3ed09): undefined reference to `ip_ct_gre_keymap_add'
net/network.o(.text+0x3ed2e): undefined reference to `ip_ct_gre_keymap_add'
net/network.o(.text+0x3ed96): undefined reference to `ip_ct_gre_keymap_add'
net/network.o(.text+0x3edaa): undefined reference to `ip_ct_gre_keymap_add'
net/network.o(.text+0x3edc8): undefined reference to
`ip_ct_gre_keymap_destroy'
net/network.o: In function `tcp_help':
net/network.o(.text+0x3fd66): undefined reference to
`ip_ct_gre_keymap_change'
net/network.o(.text+0x3fd73): undefined reference to
`ip_ct_gre_keymap_change'

I'd be happy for any suggestions. If you need any more information please
let me know.

Thank you very much in advance,

Kind regards

Phil

