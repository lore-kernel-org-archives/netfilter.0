From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridge Transparent Proxy
Date: Tue, 22 May 2007 11:09:28 -0500
Message-ID: <465315B8.1070304@riverviewtech.net>
References: <C2785BE6.1C244%robert@leblancnet.us>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C2785BE6.1C244%robert@leblancnet.us>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 05/22/07 09:35, Robert LeBlanc wrote:
> You will need to look at ebtables. Bridging will bypass iptables. Ebtables
> is much like iptables, but there are some subtle differences that may choke
> you up. Haven't worked much with it though.

You can configure the kernel to apply IPTables Net Filters (Layer 3) to 
EBTables bridged (Layer 2) traffic.

To quote the (2.6.8.1) kernel source:
"""
CONFIG_BRIDGE_NETFILTER - Enabling this option will let arptables resp. 
iptables see bridged ARP resp. IP traffic. If you want a bridging 
firewall, you probably want this option enabled.

Enabling or disabling this option doesn't enable or disable ebtables.
"""




Grant. . . .

