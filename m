From: George Agnelli <george@mattandgeorge.com>
Subject: Iptables and GRE/PPTP
Date: Mon, 14 Oct 2002 13:02:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B9D070DA.3D0F%george@mattandgeorge.com>
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
To: netfilter users <netfilter@lists.netfilter.org>

Dear All,

Can anyone explain why when connecting an internal win2k VPN client through
an iptables firewall/gateway to an external VPN server, authentication
should time out? I believe PPTP uses the GRE protocol (47) for
authentication? So if I have flushed all the tables, set a default policy of
ACCEPT for everything and set up masquerading then in theory it should work,
right? Or must I explicitly ACCEPT these protocols/ports?

George


