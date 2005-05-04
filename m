From: jonathan <support-squid@bfinance.fr>
Subject: squid + clamp-mss-to-pmtu
Date: Wed, 04 May 2005 17:09:13 +0200
Message-ID: <1115219353.2802.11.camel@localhost.localdomain>
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

Hi,
I have a problem with squid and iptables.
I have to use "TCPMSS --clamp-mss-to-pmtu" to adapt the mtu with the ISP
requirement, but since I have installed the squid proxy, it seems like
the iptables chains below doesn't work. 

$iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN /
-j TCPMSS --clamp-mss-to-pmtu

$iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN /
-j TCPMSS --clamp-mss-to-pmtu

Some websites still are unaccessible.

Is there a way to make it work?

thanks


