From: jn@angel.cz
Subject: SNAT of icmp: fragmentation-needed
Date: Tue, 4 Jun 2002 17:30:02 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206041715120.27892-100000@albert.ha-vel.cz>
Reply-To: jn@angel.cz
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


Hi,

I would like to SNAT icmp fragmentation-needed messages that have source
address from private network range (RFC1918), I have tried something like:

iptables -t nat  -I POSTROUTING -j SNAT --to real_address -p icmp  \
--icmp-type fragmentation-needed -s 192.168.0.0/16

but it does not work. I think that because these packets are part of
valid TCP connection, they are somehow processed by ip_conntrack
module and do not pass this rule....

any idea?

jn


