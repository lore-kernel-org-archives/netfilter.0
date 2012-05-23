From: Eric Petit <eric@lapsus.org>
Subject: connlimit and rejected connections staying in conntrack table
Date: Wed, 23 May 2012 17:29:46 +0200
Message-ID: <3558CE94-A347-48A9-8F5F-D10D51390681@lapsus.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am trying to limit the total number of concurrent connections that may be established on a given port. I need additional connection attempts to be explicitly rejected, so I went for something like:

iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 512 --connlimit-mask 0 -j REJECT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

My problem is, when the limit is reached and new connections are rejected, those stay in the conntrack table in a SYN_SENT / UNREPLIED state, and are only cleaned up after 120 seconds (ip_conntrack_tcp_timeout_syn_sent). As such, they are accounted for as active connections by connlimit, and new connections keep being rejected even though the number of established connections is, in fact, lower than the limit that I set. If connections keep coming in at a fast pace, it may just never accept a connection again. I've tried "--reject-with tcp-reset" and the behavior was the same.

Would there be a way to work around it? I was hoping RESET'ed connections would not cause an entry to exist in the conntrack table at all (as if I did a DROP). Otherwise, connlimit would have to know somehow that those are dead connections. Lowering tcp_timeout_syn_sent mitigates the problem, but isn't a definitive solution.

Version details (Debian Squeeze):
Linux 2.6.32-5-amd64
iptables v1.4.8

Thanks,

-- 
Eric