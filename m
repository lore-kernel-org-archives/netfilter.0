From: Magnus Solvang <magnus@solvang.net>
Subject: Re: ping from 'wrong' ip-address
Date: Thu, 27 Feb 2003 16:09:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030227150925.GC30319@first.knowledge.no>
References: <20030226141351.GA23528@first.knowledge.no>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030226141351.GA23528@first.knowledge.no>
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
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Quoting Magnus Solvang (magnus@solvang.net):
| A 1/8 subnet (32-64). Pinging had suddenly changed from using the correct
| ip-address for the external interface to use the ip-address for the first
| alias for this interface (eth1:0). I can't ping outside anymore.
| The ip-address for eth1:0 was previously a machine on the network, that
| now has been moved to a reserved ip-address on the LAN.

This problem disappeared when setting the correct GATEWAYDEV in
/etc/sysconfig/network. Iptables only did what I told it to.

- M

