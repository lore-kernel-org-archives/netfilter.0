From: Eddie <lists@neteconomist.com>
Subject: IPTABLES for dual homed machine and public IP addresses
Date: 11 Aug 2004 13:27:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092245278.28003.8.camel@thunder.neteconomist.com>
Reply-To: lists@neteconomist.com
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

I am trying to setup a firewall for a LAN that has more than 40 servers
in production. All the production servers have public IP addresses. I
have looked at several scripts available on line to build from and I
have failed to get one that caters for this type of scenario. My
router's internal interface is 65.x.x.1. Does anybody know of a way
around this while keeping my external IP's or must I use private IP's
for my internal machines? Do I have to set up the default gateway on
production servers as my routers internal interface of use my firewall
trusted interface as default gateway?

All help and pointers will be greatly appreciated.

Eddie


