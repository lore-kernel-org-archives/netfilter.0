From: Garison Piatt <todo@garisonpiatt.com>
Subject: Well, it works, but...
Date: Tue, 27 Apr 2004 10:24:32 -1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20040427101125.03638320@mail.garisonpiatt.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've got the following working -- which is to say, it no longer crashes the 
system.  I can get in through ssh, web documents work fine, but FTP is 
still s-l-o-w.   I generally have time for a nice lunch before it comes 
back with a directory listing.  Any idea what's going on?  Obviously 
there's something I haven't done right, but I don't know what.   Don't be 
afraid to ask if I've done something that "every intelligent person" knows 
needs to be done.  When it comes to stuff like this, I'm really a moron.


Thanks,
-garison

#!/bin/sh
#
# IP Firewall script for iptables
echo "Define IP Firewall"
# Command definitions
echo " setup..."
IPT="/sbin/iptables"
IPT="/sbin/iptables"
IPTR="/sbin/iptables-restore"
IPTS="/sbin/iptables-save"
INSMOD="/sbin/modprobe"
DEPMOD="/sbin/depmod"
# Pre-load modules
echo " load modules..."
$DEPMOD -a
$INSMOD ip_tables
$INSMOD ip_conntrack
$INSMOD ip_conntrack_ftp
$INSMOD iptable_filter
$INSMOD ipt_state
# Set default drop policy on all tables
echo " clear policies..."
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP
echo " define tables..."
# Allow replies out for anything which comes in
$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# Allow the machine to do its own DNS lookups
$IPT -A OUTPUT -p tcp --dport 53 -j ACCEPT
$IPT -A OUTPUT -p udp --dport 53 -j ACCEPT
# Allow replies in for anything which goes out (eg DNS)
$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# Allow the world to access by HTTP
$IPT -A INPUT -p tcp --dport 80 -j ACCEPT
# Allow the world to access by FTP
$IPT -A INPUT -p tcp --dport 20 -j ACCEPT
$IPT -A INPUT -p tcp --dport 21 -j ACCEPT
# Allow the world to access by SSH
$IPT -A INPUT -p tcp --dport 22 -j ACCEPT
echo "Done."


