From: "Ramamurthy S" <ramams@gmail.com>
Subject: Need help in duplicating the SNMP trap packets
Date: Thu, 6 Jul 2006 09:27:19 +0530
Message-ID: <ecc2c39a0607052057t63ce9d4cna30d66dab047f364@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

In one of our projects we are using two products with two different
SNMP stacks (one in C and other in Java) on the same Linux box. C SNMP
stack is used to listen for traps from some old generation devices and
Java SNMP stack is used to listen for traps from new generation
devices. Is it possible to configure iptables to copy (duplicate)
packets coming in to UDP port 162 to another port (say 1620) on the
same box? In otherwords, both 162 and 1620 should receive all the SNMP
traps coming in to the system.

If I use REDIRECT target, I will be able to receive traps only on the
redirected port, but not on 162.

I also tried to forward port 162 to two diffetent ports (one for C and
other for Java SNMP) as follows. In this case packets are getting
forwarded to only one port (1620).

iptables -t nat -A PREROUTING -p udp --dport 162 -j REDIRECT
--to-ports 1620-1621

BTW, I looked at the ROUTE target in netfilter site. However, we may
not be able to install kernel patches in customer environments (they
may not allow it).

Thanks in advance,
Rama

