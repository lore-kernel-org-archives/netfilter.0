From: Jason Romo <jason@romos.net>
Subject: PPTP nat and conntrack patch with patch-o-matic
Date: Fri, 04 Nov 2005 02:45:18 -0600
Message-ID: <BF907BBE.2682%jason@romos.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I am trying to resolve an issue with the patch-o-matic in regards to the
pptp nat and conntrack patch.  I am using kernel 2.6.12.3 on many different
processors.  I have the problem across the board.  I can compile, but I can
load the module.  I get an error in dmesg:

ip_conntrack_pptp: Unknown symbol __ip_conntrack_expect_find
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_inbound
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_expectfn
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_exp_gre
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_outbound


Does any one know which patch-o-matic would work with the 2.6.12.3 kernel?
I am using patch-o-matic 20050913? Or how to resolve this issue?

Regards,
Jason


