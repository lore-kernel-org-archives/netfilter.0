From: Jim Redman <jim@ergotech.com>
Subject: UDP Redirects
Date: Mon, 15 Sep 2003 18:07:14 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030916000714.GC3213@charizard>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a system that is sending UDP packets to port 995 at about 100 
packets/second.  I want to redirect these to 1995 so that I can listen 
on an unpriveledged port.  So I:

iptables -t nat -A PREROUTING -p udp --dport 995 \
     -j REDIRECT --to-port 1995

This seems to work some of the time, but most of the time not.  It 
seems to work better when the connection is across a VPN which limits 
that packets to about 5-10/second.  So I assume that I've hit some 
limit, however this (and a number of variants) don't seem to help:

iptables -t nat -I PREROUTING -m limit --limit 1000/s \
     --limit-burst 1000 -j ACCEPT

Am I missing something obvious?  Any suggestions?

Thanks,

Jim

-- 

Jim Redman
(505) 662 5156 x85
http://www.ergotech.com

