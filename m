From: Chris Etzel <cetzel@iamada.org>
Subject: passive ftp clarification
Date: Tue, 20 Apr 2004 14:36:23 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082496982.4674.6.camel@linux.local>
Reply-To: cetzel@iamada.org
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

This might be a duplicate post - I sent the first from the wrong email
account.

Anyway, 

I have this script below:

#!/bin/bash


#-------------------------------
# updated RC.FIREWALL script 
# with supposed FTP support? HELP!
#-------------------------------


# enable ip_forwarding
echo "1" > /proc/sys/net/ipv4/ip_forward

# added for Passive FTP Compatibility
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp


# Flush tables

iptables -F
iptables -t nat -F


# Set Default policies

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT


iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

BLOCKT="1:1024 5900 5900 2301 2381 3372 5000 1433 1801 2103:2105 3146"
BLOCKU="1:1024 2301 2381 3372 1900 1434 3145 3527"

iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 20:22 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 308 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 90 -j ACCEPT


# BLOCK BAD TCP
for BT in $BLOCKT; do
        iptables -A INPUT -i eth0 -p tcp --dport $BT -j DROP;
done

# BLOCK BAD UDP
for BU in $BLOCKU; do
        iptables -A INPUT -i eth0 -p tcp --dport $BU -j DROP;
done

# END OF SCRIPT

It's pretty basic, and I know its not really too secure, but I am trying
to narrow down this FTP passive problem.

I can login to passive FTP servers, but it hangs at 'ls'. 

Is there something else in my script that I need to add to get ftp-data
to respond correctly ?


Thanks in advance,

Chris


