From: Esteban <eribicic@sinectis.com>
Subject: upgrade to iptabels from ipchains
Date: 27 May 2003 19:02:11 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054072932.19399.247.camel@dejawu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

i used to have this:

$IPCHAINS -N soporte
$IPCHAINS -A FORWARD -s 10.0.0.0/25  -j soporte
$IPCHAINS -A soporte -s 10.0.1.1 -j MASQUERADE
$IPCHAINS -A soporte -j DENY

how can i do this with iptables?
the idea is to use chains for each group.

thanks!




