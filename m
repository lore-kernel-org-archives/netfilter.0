From: Rohan Almeida <arc_of_descent@gmx.net>
Subject: conntrack ftp module usage
Date: Mon, 30 Sep 2002 20:36:55 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020930203655.57527962.arc_of_descent@gmx.net>
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


Hi List,
I've loaded the ip_nat_ftp and ip_conntrack_ftp modules.
I also have the follwing rule in my firewall:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

This is on a linux box, with 2 interfaces, one public,
one private and doing NATing

Most importantly, ftp from the client's end works fine
But when i do an `lsmod', i see that the ftp modules
are being used.
Is that normal?
what is happening?

Thanx,

--
arc_of_descent

