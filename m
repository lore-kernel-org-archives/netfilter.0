From: "AKholod" <scom_andrey@mail.ru>
Subject: How can Iget multiple outgoing VPN (pptp) connections with iptables
	and snat?
Date: Wed, 6 Apr 2005 15:52:46 +0300
Message-ID: <E1DJA1r-000IoU-00.scom_andrey-mail-ru@mx1.mail.ru>
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

I have problem. Multiple clients in our corporate network need access to
remote network by VPN - PPTP protocol, VPN gate to the remote network is
CISCO router with VPN support. I study many forums and find four solutions
for setup VPN connection:

1) VPN masquerading for old kernel - 2.0, 2.2

2) Special external program - pptpproxy

3) I find links to iptables extensions -
<http://cvs.netfilter.org/netfilter-extensions/helpers/pptp/> ip_nat_pptp,
ip_conntrack_pptp, ip_nat_proto_gre, ip_conntrack_proto_gre, but I don't
find any sources for this modules.

4) Add next rules in iptables startup script:

 

$IPTABLES -A FORWARD -p tcp --dport 1723 -i $LAN_IFACE -j ACCEPT

$IPTABLES -A FORWARD -p 47 -i $LAN_IFACE -j ACCEPT

 

And finally I have question: "How CORRECT (RECOMMENDED BY DEVELOPERS) way
for setup iptables version 1.2.11 and Linux kernel 2.6 for admission
multiple outgoing PPTP VPN connections?"

 

Best regards,

Andrey Kholod

