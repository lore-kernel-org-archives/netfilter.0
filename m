From: "Jet" <yenjet.chan@eglobal.com.my>
Subject: NAT only - No connection tracking
Date: Mon, 11 Nov 2002 18:56:51 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ff01c28971$0a0429f0$0bc8c80a@dolphin>
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
To: "netfilter@lists" <netfilter@lists.netfilter.org>

Hi all,

How can I make my iptable to do just NAT, no connection tracking?

No matter how hard I tried to configure netfilter to load only iptable_nat,
it will load ip_conntrack too.

Basically, I want to make my iptable to become a NAT device without stateful
inspection.
It this possible?

.//Jet


