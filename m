From: "Salim" <salim.si@askey.com.tw>
Subject: PPTP/IPSec multiple clients behind iptables  NAT
Date: Fri, 23 Sep 2005 09:57:55 +0800
Message-ID: <001701c5bfe2$62013e90$205f030a@askeyrd3>
References: <1127361547.43322c0b7a8da@mail.sify.com>
	<Pine.NEB.4.62.0509221923220.22381@otaku.freeshell.org>
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

I am using iptables 1.3.3

I had some problems with multiple clients behind NAT(a simple MASQUERADE
rule is set) connecting to the same VPN server. ONly one client can connect
at a time.
I have enables the CONFIG_IP_NF_PPTP and CONFIG_IP_NF_CT_PROTO_GRE options
in kernel.

I have read a few posts about this issue in the list from as early as in
2003. But could not find a conclusion.

Could you guys please clarify? Is this scenario supported by iptables? If
not, is there a way to get around this issue?

thanks
Salim


