From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: PPTP through iptables FW...
Date: Mon, 1 Jul 2002 09:59:20 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <002601c22107$7f39fe70$3864a8c0@discmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I haven't looked into this, but is there a method to connect to a pptp
server from behind an iptables firewall?  I have seen glimpses of
persons using something called ip_conntrack_pptp (sp?) and that seems it
will fit the bill...not sure..here is ASCII art:

Client-----IPTABLES Firewall------INTERNET--------Remote PPTP
server------Server

I am currently using IPTables 1.2.5


