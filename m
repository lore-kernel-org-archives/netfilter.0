From: George Agnelli <george@mattandgeorge.com>
Subject: Log output going to screen
Date: Wed, 16 Oct 2002 21:41:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B9D38D9C.45F%george@mattandgeorge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Does anyone know why my logs are occasionally being dumped to screen as well
as to the messages file? How can I stop this happening?

This is what I am currently logging:

iptables -A INPUT  -i eth1 -j LOG
iptables -A OUTPUT -o eth1 -j LOG
iptables -A FORWARD  -i eth1 -o eth0 -j LOG
iptables -A FORWARD  -i eth0 -o eth1 -j LOG

George


