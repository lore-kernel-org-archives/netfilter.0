From: "black@arbbs.net" <black@arbbs.net>
Subject: RE: Destination Nat
Date: Fri, 04 Jun 2004 10:14:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40c09fdd.53.2397.470918728@arbbs.net>
Reply-To: black@arbbs.net
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> What are the other rules?

iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp \
 --dport 22 -j DNAT --to 192.168.1.81:22

iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp \
 --dport 22 -j DNAT --to 192.168.1.82:22

iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp \
 --dport 22 -j DNAT --to 192.168.1.83:22

iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp \
 --dport 22 -j DNAT --to 192.168.1.88:22

john


