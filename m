From: Aaron Clausen <maureen-taocow@alberni.net>
Subject: Running iptables on downgraded server (2.4.9 to 2.4.19)
Date: Mon, 25 Nov 2002 10:31:39 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211251026430.586-100000@ts1.alberni.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I posted a query about having problems getting the 2.4.19 kernel with the
patches for 1.2.7a running on a machine currently running a later kernel.  I
didn't get much in the way of responses, so this time I thought I would post
the script that I'm using.  This scripts runs fine on 2.4.9 running iptables
1.2.2, but when I boot into 2.4.19 with iptables 1.2.7a, I get invalid
argument on many of the rules.  This is rather important because we need to
do connection tracking on H323 tracking, and I have never managed to get
anything later than 2.4.19 to patch correctly.

#! /bin/sh
#
# rc.iptables		IP Tables rules for IP accounting and NAT
#

echo Entering /etc/rc.d/rc.iptables...

echo [/etc/rc.d/rc.iptables] Flushing all IPTABLES chains and rules...
/usr/sbin/iptables -F
/usr/sbin/iptables -X
/usr/sbin/iptables -t nat -F
/usr/sbin/iptables -t nat -X
/usr/sbin/iptables -t mangle -F
/usr/sbin/iptables -P FORWARD ACCEPT
/usr/sbin/iptables -P INPUT ACCEPT
/usr/sbin/iptables -P OUTPUT ACCEPT

echo [/etc/rc.d/rc.iptables] Recreating public to private address
mappings...
iptables -t nat -A PREROUTING -i eth0 -d 64.141.7.2 -j DNAT --to 10.102.106.2
iptables -t nat -A POSTROUTING -o eth0 -s 10.102.106.2 -j SNAT --to 64.141.7.2
iptables -t nat -A PREROUTING -i eth0 -d 64.141.7.3 -j DNAT --to 10.101.106.2
iptables -t nat -A POSTROUTING -o eth0 -s 10.101.106.2 -j SNAT --to 64.141.7.3

echo [/etc/rc.d/rc.iptables] Recreating NAT tables...
iptables -t nat -A POSTROUTING -o eth0 -s 10.101.104.0/21 -d 0/0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -s 10.102.104.0/21 -d 0/0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -s 10.103.104.0/21 -d 0/0 -j MASQUERADE

echo [/etc/rc.d/rc.iptables] Recreating IP accounting rules...
/usr/sbin/iptables -N waverid
/usr/sbin/iptables -A FORWARD -j waverid
# Miscellaneous
/usr/sbin/iptables -A waverid -i eth0 -d 64.141.6.19/32
/usr/sbin/iptables -A waverid -i eth1 -s 64.141.6.19/32
/usr/sbin/iptables -A waverid -i eth0 -d 64.141.7.4/32
/usr/sbin/iptables -A waverid -i eth1 -s 64.141.7.4/32

-- 
Aaron Clausen


