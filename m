From: "Storm D. J. Petersen" <stormp@telus.net>
Subject: 2 PPTP clients connecting to the same PPTP server  Iptables-1.2.7a kernel-2.4.20
Date: Mon, 24 Feb 2003 21:06:16 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LKEMIKEDGPBEAFDKINCGAEOIDGAA.stormp@telus.net>
References: <20030224232637.2660.82251.Mailman@kashyyyk>
Reply-To: <stormp@telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030224232637.2660.82251.Mailman@kashyyyk>
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

Hi.

I have 2 client hosts trying to connect to the same pptp server behind my
nat firewall.  I can get one client to connect but when I have two clients
the vpn fails.  I have these modules loaded: ip_conntrack_pptp
ip_conntrack_proto_gre  ip_nat_pptp  ip_nat_proto_gre.

Is it possible to do this?  Can someone point me into the right direction?

Thanks!

S.





