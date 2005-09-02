From: Tim P <panterafreak@gmail.com>
Subject: Having Issue with iptables on FC4 - can't get it working properly
Date: Fri, 2 Sep 2005 14:01:24 -0400
Message-ID: <a5abf517050902110130101112@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Here is the firewall script I am attempting to use/modify to work
The goal is to forward some services/port back to a system on the niternal=
=20
network while allowing everyone on the internal network access to the=20
internet.

#
#!/bin/sh
#
# Insert the required kernel modules
# commented modules already loaded by os
#/sbin/modprobe ip_conntrack
#/sbin/modprobe iptable_filter
#/sbin/modprobe iptable_mangle
#/sbin/modprobe iptable_nat
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_tables
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REJECT
/sbin/modprobe ipt_MASQUERADE

# Set default policies for packets going through this firewall box
iptables -N PREROUTING
iptables -N POSTROUTING
iptables -t nat -P PREROUTING DROP
iptables -t nat -P POSTROUTING DROP
iptables -P FORWARD DROP

# Set default policies for packet entering this box

iptables -P OUTPUT ALLOW
iptables -P INPUT ALLOW

# Anything coming from our internal network should have only our addresses!
iptables -A FORWARD -i eth1 -s ! $192.168.8.0/24 -j DROP

# Anything coming from the Internet should have a real Internet address
#iptables -A FORWARD -i eth0 -s 192.168.0.0/16 <http://192.168.0.0/16> -j=
=20
DROP
iptables -A FORWARD -i eth0 -s 172.16.0.0/12 <http://172.16.0.0/12> -j DROP
iptables -A FORWARD -i eth0 -s 10.0.0.0/8 <http://10.0.0.0/8> -j DROP

# Note:There are more "reserved" networks, but these are the classical ones=
.

# Block outgoing network filesharing protocols that aren't designed=20
# to leave the LAN

# SMB / Windows filesharing
iptables -A FORWARD -p tcp --sport 137:139 -j DROP
iptables -A FORWARD -p udp --sport 137:139 -j DROP
# NFS Mount Service (TCP/UDP 635)
iptables -A FORWARD -p tcp --sport 635 -j DROP
iptables -A FORWARD -p udp --sport 635 -j DROP
# NFS (TCP/UDP 2049)
iptables -A FORWARD -p tcp --sport 2049 -j DROP
iptables -A FORWARD -p udp --sport 2049 -j DROP
# Portmapper (TCP/UDP 111)
iptables -A FORWARD -p tcp --sport 111 -j DROP
iptables -A FORWARD -p udp --sport 111 -j DROP

# Block incoming syslog, lpr, rsh, rexec...
iptables -A FORWARD -i eth0 -p udp --dport syslog -j DROP
iptables -A FORWARD -i eth0 -p tcp --dport 515 -j DROP
iptables -A FORWARD -i eth0 -p tcp --dport 514 -j DROP
iptables -A FORWARD -i eth0 -p tcp --dport 512 -j DROP

# Transparently redirect web connections from outside to the web server
iptables -t nat -A PREROUTING -i eth0 -d 192.168.8.1
<http://192.168.8.1>-dport 80 -j DNAT --to
192.168.8.96 <http://192.168.8.96>

# Source NAT to get Internet traffic through
# do i need to do something like this?
#$INTERNET =3D 10.0.0.1 <http://10.0.0.1>
#iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to $INTERNET

# Activate the forwarding!
echo 1 >/proc/sys/net/ipv4/ip_forward



When running this script as root (chmod 755 permisions) I get the following=
=20
error:
[root@gtds-vpnserver init.d]# ./masqfirewall.sh
not found.le ip_conntrack_ftp
not found.le ip_tables
not found.le ipt_LOG
not found.le ipt_REJECT
not found.le ipt_MASQUERADE
: command not foundline 14:
iptables: Chain already exists
iptables: Chain already exists
iptables: Bad policy name
iptables: Bad policy name
iptables: Bad policy name
: command not foundline 21:
: command not foundline 23:
iptables: Bad policy name
iptables: Bad policy name
: command not foundline 26:
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
: command not foundline 29:
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
: command not foundline 34:
: command not foundline 36:
: command not foundline 39:
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
: command not foundline 52:
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
'ptables v1.3.0: Invalid target name `DROP
Try `iptables -h' or 'iptables --help' for more information.
: command not foundline 58:
iptables v1.3.0: multiple -d flags not allowed
Try `iptables -h' or 'iptables --help' for more information.
: command not foundline 61:
: command not foundline 66:
: No such file or directory /proc/sys/net/ipv4/ip_forward
: command not foundline 69:
[root@gtds-vpnserver init.d]#


These errors don't make sense as the modprobes work fine from the=20
commandline=20
I have tried about four ready-made firewall scripts from=20
http://www.linuxguruz.com/iptables/ just to see if it was something weird i=
n=20
my script and encounter very similar problems. Has anyone had any luck with=
=20
this on Fedora Core 4 or is there something I am missing? The last time I=
=20
made a firewall/router was when ipchains was the thing to use so I am not=
=20
entirely unfamiliar with the process.

Thanks!
Tim
