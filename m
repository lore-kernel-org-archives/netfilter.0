From: Matthew Schumacher <mschumacher@design-pt.com>
Subject: Iptables statistic module and nth seems broken in 2.6.29.2
Date: Tue, 19 May 2009 20:26:29 -0800
Message-ID: <4A138675.7040004@design-pt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Group,

I have some pretty simple syntax that does nothing more than mark every
nth packet:

iptables -t mangle -A PREROUTING -d x.x.x.x -p tcp --dport 3389 -m
statistic --mode nth --every 4 --packet 0 -m state --state new -j
CONNMARK --set-mark 1

iptables -t mangle -A PREROUTING -d x.x.x.x -p tcp --dport 3389 -m
statistic --mode nth --every 4 --packet 1 -m state --state new -j
CONNMARK --set-mark 2

iptables -t mangle -A PREROUTING -d x.x.x.x -p tcp --dport 3389 -m
statistic --mode nth --every 4 --packet 2 -m state --state new -j
CONNMARK --set-mark 3

iptables -t mangle -A PREROUTING -d x.x.x.x -p tcp --dport 3389 -m
statistic --mode nth --every 4 --packet 3 -m state --state new -j
CONNMARK --set-mark 4

But I'm finding that the packet first rule matched is rarely the first
one like it should be, and rules matched after it are random.  This
output clearly shows that the 4th rule was matched twice before any others.

pkts bytes target     prot opt in     out     source
destination
2   120 CONNMARK   tcp  --  *      *       0.0.0.0/0            x.x.x.x
     tcp dpt:3389 statistic mode nth every 4 packet 3 state NEW CONNMARK
xset 0x4

This should never be since the code shows:

                spin_lock_bh(&nth_lock);
                if (info->u.nth.count++ == info->u.nth.every) {
                        info->u.nth.count = 0;
                        ret = !ret;
                }
                spin_unlock_bh(&nth_lock);

Which means that when the that packet count was 3 to match the 3rd rule,
then the counter should have been incremented, which == the every value
which should have caused the counter to reset.

Anyone know whats up with this module and why it's not working for me?
