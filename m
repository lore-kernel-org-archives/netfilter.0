From: arif <djreef@yahoo.com>
Subject: forwarding rule (internal webserver) HELLPP!!
Date: Mon, 15 Mar 2004 11:10:20 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040315191020.11187.qmail@web10205.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Anyone know why the following rule does not work when
i use SNAT but does when i use MASQUERADE??

/sbin/iptables -A PREROUTING -t nat -p tcp -d 63.x.x.x
--dport 80 -j DNAT --to 10.0.0.3:80

When I use the following rule, the previous rule
works: 
/sbin/iptables -t nat -A POSTROUTING -o eth1 -j
MASQUERADE

but when i do it like this, i just get a connection
refused from the outside:
/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o
eth0 -j SNAT --to-source 63.203.63.246

Both work as far as NAT'ing my internal hosts, but i
cant get the darn forward to work! thanks!! :)

__________________________________
Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
http://mail.yahoo.com

