From: "Kimi Sato" <kimi@vdot.net>
Subject: Help! Windows vpn through iptables
Date: Wed, 22 Jun 2005 21:56:30 -0400
Message-ID: <000f01c57796$c65d2500$320aa8c0@home.mixvision.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

VPN connection to Windows 2000 RAS works within iptables without a problem.
Iptables has TCP port 1723 and protocol 47 open, the same way as other ports
such as 80, 25, 443.
Other services such as http, https, smtp works fine.
When I try PPTP vpn from outside of iptables using windows vpn client, it
hangs at verifying user name and password.  I don't have any other ports
open.  Do I need to open some other ports in order for vpn connection to go
through iptables? Any input will be appreciated.
Thanks.


