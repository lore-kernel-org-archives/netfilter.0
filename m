From: "Carlos Montero" <cmom0020@endrino.cnice.mecd.es>
Subject: "-p ICMP -m state --state RELATED" works????
Date: Mon, 19 Jul 2004 17:34:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <cdfrrl$hq4$1@sea.gmane.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi people, i=B4m configuring a firewall with iptables and have a little
trouble. I want filter the icmp packets type 3 and 11
(destination-unreachable and time-exceeded). I want that the firewall block
all packets of this type that don=B4t be RELATED to another connection. I
tried with this rule:

iptables -A -p icmp --icmp-type 3 -m state --state RELATED -j ACCEPT

but this don=B4t work. I hace tried all combinations of state value (
NEW,ESTABLISHED,RELATED) but nothing seems work.
However, the icmp type echo-reply and echo-request works fine with state
control (NEW and ESTABLISHED):
iptables -A INPUT -p icmp --icmp-type 8 -m state --state NEW -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 0 -m state --state ESTABLISHED -j
ACCEPT

 Is it possible only a type of icmp packets works with state control? Is it
a bug? I hope someone can help me, than you.

Carlos.




