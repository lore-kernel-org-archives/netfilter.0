From: "Dan Egli" <dan@shortcircuit.dyndns.org>
Subject: Samba blocked?
Date: Tue, 26 Nov 2002 14:05:31 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c2958f$d3fadbd0$1e00a8c0@yamatto>
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

Ok. I'm a fair bit confused here. I'm trying to setup a IPtables filter set
that will block certain ports and allow others. It seems to work perfectly
for anything other than Samba. If I try:

smbclient //myserver/shared1, it fails to connect. But using the IP in place
of it:
smbclient //192.168.0.2/shared1 works just fine. I am specifically allowing
NetBIOS-ns, NetBIOS-ssn, and NetBIOS-dgm. Still no go. What's wrong?

Thanks!
-- Dan

tables:

#!/bin/bash
IPT=/sbin/iptables
# step 1 - ensure iptables are loaded
modprobe ip_conntrack_ftp
# that should pull in all dependant modules
#step 2  SET DEFAULT POLICY

$IPT -P INPUT DROP
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD DROP

# step 3 FLUSH THE TABLES
$IPT -F INPUT
$IPT -F OUTPUT
$IPT -F FORWARD
$IPT -t nat -F PREROUTING
$IPT -t nat -F POSTROUTING
$IPT -t nat -F OUTPUT

# setp 4 - setup rules
$IPT -A INPUT -p tcp -m multiport --dports smtp,ftp,telnet,ssh -j ACCEPT
$IPT -A INPUT -p tcp -i eth0 -m multiport --dports
telnet,ssh,domain,nntp,ntp,printer,pop3,imap,http,https,netbios-ns,netbios-d
gm,netbios-ssn -j ACCEPT
$IPT -A INPUT -p udp -i eth0 -m multiport --dports
domain,ntp,netbios-ns,netbios-dgm,netbios-ssn -j ACCEPT
$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A INPUT -j LOG

$IPT -A FORWARD -i eth0 -j ACCEPT
$IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A FORWARD -j LOG
# step 5 - enable NAT
$IPT -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 64.122.31.38
# step 6 - setup the proc files for a propper firewall

echo 1 > /proc/sys/net/ipv4/ip_forward


P.S. With these rules, it should only log packets that are failing, and I
see the packets on port 137 in the log, so I don't know what's wrong.


