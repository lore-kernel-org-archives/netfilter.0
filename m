From: Patrick Mauritz  <oxygene@studentenbude.ath.cx>
Subject: pptp patch
Date: Wed, 15 Oct 2003 13:29:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031015112934.GA7317@t-stueck>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

hello,

I have a problem with the pptp patch from latest p-o-m, trying to
forward external pptp clients to a firewalled pptp server (win2k server).

clients <-> router <-> win2k server


iptables setup on router:

ip_{nat,conntrack}_{proto_gre,pptp} are loaded,
1723 is DNATed from external to the server
MASQUERADE is any to any

when trying to connect to the server, the connection is dropped after 115 to 119 seconds.

the connection lasts longer when I DNAT GRE protocol manually (and withou the pptp helpers), though that obviously only works for one user at a time.


I have no idea what further information I could provide, but I'll provide everything asked for. please Cc: as I'm not on the list.

TIA,
patrick mauritz

