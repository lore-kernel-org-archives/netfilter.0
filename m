From: Wichert Akkerman <wichert@wiggy.net>
Subject: 2.6 DNAT does not work?
Date: Wed, 9 Jun 2004 23:26:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040609212606.GB9192@wiggy.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I'm having some problem getting DNAT to work on machines running 2.6
kernels. I tried both 2.6.2 and 2.6.6 and the show the same behaviour.
I am using this iptables rule:L

iptables -t nat -A PREROUTING -p tcp -d 194.109.254.66 --dport 8000 \
	-j DNAT --to-destination 192.168.1.50:443

The destination is reachable from the router. But when I try to connect
to 194.109.254.66:8000 a icmp port unreachable is returned and no
connection attempt to 192.168.1.50 is made.

Wichert.

-- 
Wichert Akkerman <wichert@wiggy.net>    It is simple to make things.
http://www.wiggy.net/                   It is hard to make things simple.

