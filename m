From: Martijn Klingens <mklingens@ism.nl>
Subject: Unexpected RSTs?
Date: Fri, 11 Oct 2002 14:34:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210111434.52124.mklingens@ism.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Please consider the following piece of our firewall script's output:

----
* Setting up connection tracking for already-active traffic
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -m state --state RELATED -j ACCEPT
iptables -A FORWARD -m state --state RELATED -j ACCEPT
modprobe ip_conntrack_ftp

[ .. snip creation and activation of custom chains .. ]

* Setting up connection tracking for ACL lan
iptables -A acl_lan -p tcp --tcp-flags RST RST -j log_lan
iptables -A log_lan -p tcp --tcp-flags RST RST -j LOG \
        --log-level debug --log-prefix '* DROP: Unexpected RST * '
----

The last line intrigues me. We drop these packets since quite a while, but 
didn't log them until yesterday. It turns out that almost 15% of my firewall 
log now consists of packets qualifying as 'Unexpected RST' though.

But... isn't the conntrack code at the beginning supposed to take care of 
accepting RSTs if they are associated with an active connection? Isn't a 
packet with RST that passes through the RELATED/ESTABLISHED match a packet 
that is not associated with an active connection and should thus be dropped?

I'm a bit surprised to see this to say the least. It's not a subnet-wide 
portscan at least, the dropped packets definitely seem to indicate legitimate 
traffic.

Thanks in advance for any hints,
-- 
Martijn


