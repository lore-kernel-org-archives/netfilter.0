From: Paul Flinders <paul.flinders@cdesolutions.com>
Subject: ip_nat_pptp
Date: Tue, 21 Jan 2003 21:48:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E2DC018.1000708@cdesolutions.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm using a RedHat 8 box as the gateway/firewall on my home network 
(2.4.20 kernel
from the phoebe beta plus the 20030119 snapshot of patch-o-matic and 
iptables-1.2.7a)

It's working fine but one thing is puzzling me. I expected to use the 
ip_nat_pptp module
so that I can use the office VPN. However if I load that module I can't 
connect. If I just
have ip_conntrack_pptp loaded I can connect with no problems.

Can anyone explain what's going on. When is ip_nat_pptp needed?


