From: Andy Loukes <andy@navaho.co.uk>
Subject: physdev and snat problems
Date: Thu, 04 Dec 2003 11:51:28 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Navaho-3.6.11-1070538688.150630000@navaho.co.uk>
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

I'm using iptables 1.2.9 and kernel 2.6.0-test11..

I may be doing something really stupid but if I do this:
iptables -t nat -A POSTROUTING -m physdev --physdev-out eth1 -j SNAT --to-source x.x.x.x

I get:
iptables: Invalid argument

but if I just use ACCEPT as the target it works fine, although doesn't do what I want..

I've got the bridging an physdev options turned on (otherwise I couldn't use the ACCEPT target)..

Is this a bug, or am I misunderstanding something?

-- 
Andy Loukes

http://www.navaho.co.uk/





