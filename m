From: "Matt Riggs" <matt.riggs@beasleyallen.com>
Subject: iptables forwarding problems
Date: Fri, 21 Feb 2003 12:46:58 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <664D40A267DF6C4A8D5DAD9D901D51CF028B64DE@feb.bwamc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

I am confused. I am trying to port forward ftp from a specific host to a =
server on my private network.

I was under the impression that specifying a rule such as $iptables -t =
nat -A PREROUTING -p tcp -s IP -d IP --dport 21 -j DNAT --to IP:21 would =
allow this connection.=20

The Catch ALL rule.
$iptables -A INPUT -j DROP
$iptables -A OUTPUT -j DROP
$iptables -A FORWARD -j DROP

I realize it says to DROP FORWARDs but I was under the assumption that =
since i declared a specific rule, it would DROP everything else( i.e. =
allow that one forward rule)

Am I completely wrong...please explain....=20

Thanks in advance=20

Matt





