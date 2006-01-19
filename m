From: "LinuXKiD" <gregoriandres@yahoo.com.ar>
Subject: RE: vpn masquerading
Date: Thu, 19 Jan 2006 11:02:26 -0300
Message-ID: <NHBBLNDNFKDMKNNKGOMMKEPNOBAA.gregoriandres@yahoo.com.ar>
References: <65494.193.173.147.3.1137677788.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65494.193.173.147.3.1137677788.squirrel@webmail.sterenborg.info>
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
To: netfilter <netfilter@lists.netfilter.org>



Hi.


-> On Thu, January 19, 2006 13:58, LinuXKiD wrote:
-> >
-> > Hi,
-> >
-> > I've a small lan with linux router debian:
-> > 	- 2.4.28 kernel
-> > 	- iptables 1.3.0
-> > 	- pptp patch-o-matic-ng and others patchs
-> > 	- Adsl internet connection.
-> >
-> > Lan share internet connection with MASQUERADE (iptables nat)
-> > and I've loaded modules pptp and gre (conntrack and nat)
-> >
-> > lsmod:
-> >
-> > Module                  Size  Used by    Not tainted
-> 
-> ...
-> 
-> > ip_nat_proto_gre        1508   0  (unused)
-> > ip_nat_pptp             2572   0  (unused)
-> 
-> I'm not sure ; perhaps you need to unload ip_nat_pptp. I thought you
-> needed this when *you* run a PPTP server *behind* the firewall.

Thank you, but PPTP server is located on Internet, not behind firewall.


-> For me, pptp masq stopped working when I loaded ip_nat_pptp, but I
-> must say that was about 2 years ago.
-> 
-> ...
-> 
-> > ip_conntrack_pptp       2832   1  [ip_nat_pptp]
-> > ip_conntrack_proto_gre    2676   0  [ip_nat_pptp ip_conntrack_pptp]
-> 
-> ...
-> 
-> > well... the problem is when two , or more lan hosts want to access
-> > same vpn server with pptp "microsoft vpn protocol"
-> >
-> > Only one host can connect to VPN simultaneously
-> 
-> And.. What rules do you have so far concerning pptp ?
-> 
-> 
-> Gr,
-> Rob
-> 
-> 
-> 

