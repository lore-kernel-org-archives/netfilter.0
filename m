From: "Dhyanesh Ramaiya" <dhyanesh@intafrica.com>
Subject: Port forwarding
Date: Thu, 5 Jun 2003 12:48:51 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012501c32b47$abfd4340$0223a8c0@satconet.com>
References: <1054756430.818.32.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054756430.818.32.camel@elendil.intranet.cartel-securite.net>
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

Dear all,

I have a linux router (Redhat 9.0) with iptables 1.2.7a-2. I have setup port
forwarding rules as below to allow SMTP and POP3 to a machine on the
internal network.

iptables -t nat -A PREROUTING -j DNAT -p tcp -d <public_ip> --dport 110 --to
<private_ip>:110
iptables -t nat -A PREROUTING -j DNAT -p tcp -d <public_ip> --dport 25 --to
<private_ip>:25

What happens, is that when I try to telnet port 25 or 110 from the router
itself, it doesn't connect and gives the error "Connection refused".
However, from any other machine on the network it connects. Thinking that
some firewall rules might be blocking the connection, the default policy of
all chains is set to accept.

Dhyanesh Ramaiya
dhyanesh@intafrica.com


