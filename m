From: "James D. Parra" <JamesP@MusicReports.com>
Subject: VPN (PPTP) Port forwarding on RH 8.0 (Kernel 2.4.18-14)
Date: Fri, 11 Apr 2003 11:26:16 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9EC6A5A6B11DA843A551CC9AD9323FAC2FC4@exchange.musicreports.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hello,

I am setting up a firewall using iptables and I would like to add an entry
that would allow PPTP to be rerouted to an internal Win2k VPN server.

Do I need to make any changes in the kernel to allow the handling of this
type of packet?  What would the iptable entry look like since I would need
port 1723 TCP/UDP with the protocol 47 to pass through? How can I see if
forwarding is enabled in the kernel?  Is there anything else I might also
need to get this to work?

NAT is working well, but I can't get port forwarding to pass through to the
internal servers; http, port 80, for example.

Thank you in advance for your help.

James D. Parra
JamesP@MusicReports.com



