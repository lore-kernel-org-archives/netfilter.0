From: "david" <david@suarapembaruan.co.id>
Subject: blocking all traffic in port 137/137
Date: Wed, 16 Jun 2004 15:47:19 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <011701c4537e$891361b0$858310ac@suarapembaruan.com>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108> <1087322336.2054.12.camel@localhost> <1846.64.2.245.108.1087324894.squirrel@64.2.245.108> <200406152004.45544.Antony@Soft-Solutions.co.uk>
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

Dear all,
When i look at "IPTRAF", i see lot of broadcast traffic that using port 137
and 138, how to make rules that can block all traffic in port 137 and 138, i
already try to use this rules but its no works...

iptables -A INPUT -p tcp --dport 137 DROP
iptables -A OUTPUT -p tcp --dport 137 DROP
iptables -A INPUT -p udp --dport 137 DROP
iptables -A OUTPUT -p udp --dport 137 DROP
iptables -A INPUT -p tcp --dport 138 DROP
iptables -A OUTPUT -p tcp --dport 138 DROP
iptables -A INPUT -p udp --dport 138 DROP
iptables -A OUTPUT -p udp --dport 138 DROP
iptables -A INPUT -p icmp DROP

Thank's
David Kandou


