From: Dino Dragovic <dragovic@gfos.hr>
Subject: vpn and pptp
Date: Fri, 20 Feb 2004 17:17:37 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0402201702020.23080@most.gfos.hr>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I have linux Debian (2.4.24 kernel) firewall with nat and iptables.On my
private network there is MS w2000 pptp server. I can connect to it using pptp
from Internet (PPTP) but from only one client at the time.Is it
possible and how to connect through firewall several clients
simultaneously to vpn server? Iptables verison is 1.2.6a-5
When I try to connect while there is already one connection I get
"Verifying username and password" until connection times out.

tx



