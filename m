From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: CONNMARK save-mark and restore-mark not working ?
Date: Fri, 18 Feb 2005 03:40:44 -0500
Message-ID: <20050218084044.GA31190@elm.home.idallen.ca>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I think this pair (marking connections with "9"):

    iptables -t mangle -A OUTPUT -j MARK --set-mark 9
    iptables -t mangle -A OUTPUT -j CONNMARK --set-mark 9

should be equivalent to this pair:

    iptables -t mangle -A OUTPUT -j MARK --set-mark 9
    iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

The first pair works - I get mark=9 entries in /proc/net/ip_conntrack .
The second pair does not - I get no marks at all in ip_conntrack.

I think this pair should set packet marks from the ip_conntrack marks:

    iptables -t mangle -A OUTPUT -j CONNMARK --set-mark 9
    iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark

It does not - the packets aren't marked:

Chain OUTPUT (policy ACCEPT 2989 packets, 395K bytes)
 pkts bytes target     prot opt in     out     source               destination         
 1695  178K CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0           CONNMARK set 0x9 
 1695  178K CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0           CONNMARK restore 
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           MARK match 0x9 LOG flags 1 level 7 prefix `IDAMARK ' 
 1695  178K            all  --  *      *       0.0.0.0/0            0.0.0.0/0           MARK match 0x0

What am I missing?

Linux elm 2.6.10-1mdk #2 Sat Jan 29 13:10:11 EST
2005 i686 AMD Athlon(tm) XP 3200+ unknown GNU/Linux

-- 
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
       EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
       College professor (Linux) via: http://teaching.idallen.com/
       Support free and open public digital rights:  http://eff.org/

