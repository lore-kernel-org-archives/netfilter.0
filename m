From: edwardspl@ita.org.mo
Subject: Firewall setting
Date: Sat, 08 Sep 2007 19:56:08 +0800
Message-ID: <46E28DD8.1040404@ita.org.mo>
Reply-To: For users of Fedora <fedora-list@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <fedora-list-bounces@redhat.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/fedora-list>
List-Post: <mailto:fedora-list@redhat.com>
List-Help: <mailto:fedora-list-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=subscribe>
Sender: fedora-list-bounces@redhat.com
Errors-To: fedora-list-bounces@redhat.com
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "fedora-list@redhat.com" <fedora-list@redhat.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Dear All,

For the Firewall setting, how can we use the ftp and ssh service ?

For file 1 :

#!/bin/bash

modprobe ip_tables
modprobe ip_nat_ftp
modprobe ip_conntrack
modprobe ip_conntrack_ftp

iptables -F
iptables -X
iptables -F -t nat
iptables -X -t nat
iptables -F -t mangle
iptables -X -t mangle

iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -P OUTPUT ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t mangle -P PREROUTING ACCEPT
iptables -t mangle -P POSTROUTING ACCEPT
iptables -t mangle -P INPUT ACCEPT
iptables -t mangle -P OUTPUT ACCEPT
iptables -t mangle -P FORWARD ACCEPT

For file2

iptables -P INPUT DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

Edward.

-- 
fedora-list mailing list
fedora-list@redhat.com
To unsubscribe: https://www.redhat.com/mailman/listinfo/fedora-list
