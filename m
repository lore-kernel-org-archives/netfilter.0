From: "Nigel Clarke" <nigel@forever-networks.com>
Subject: Netfilter firewall cluster
Date: Sat, 30 Nov 2002 10:00:09 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BDEFKJOAPEBPJCGDAGMFMEAFCAAA.nigel@forever-networks.com>
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

Are there any plans to have a stateful cluster netfilter solution? In
addition, can this solution use a software solution for failover and
loadbalancing?

The current VRRP implementation of redundancy is good, but it does not offer
failover for VPNs.

Stonesoft's failover is the only one that offers fail over for VPN devices.



