From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: Odd problem with MIP
Date: Mon, 06 Jan 2003 23:42:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1A76F2.6060604@shortcircuit.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have the following script to generate a firewall. For some reason,
when I have the rules ON, I can not send mail through the mail proxy
running on port 8027 (anti-spam measure).  With the rules disabled
(service iptables stop on RH 7.3 box) I can send mail fine.

Any help is appreciated!

Thanks

- --- Dan Egli

!/bin/bash
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
# $IPT -A INPUT -p tcp -m multiport --dports
smtp,ftp,telnet,ssh,137,138,139,111 -j ACCEPT
$IPT -A INPUT -p tcp -i eth0 -m multiport --dports
telnet,ssh,domain,nntp,ntp,printer,pop3,imap,http,https,netbios-ssn,netbios-dgm
- -
j ACCEPT
$IPT -A INPUT -p tcp -m multiport --dports
netbios-ssn,netbios-dgm,netbios-ns,4000,pgpkeyserver,mysql,sunrpc,rndc,8027
- -j ACCEPT
$IPT -A INPUT -p udp -i eth0 -m multiport --dports
domain,ntp,route,137,138,139 -j ACCEPT
# $IPT -A INPUT -p udp -i eth1 -m multiport --dports 137,138,139,111
- -j ACCEPT
$IPT -A INPUT -i lo -j ACCEPT
# $IPT -A INPUT -p tcp -i eth1 -m multiport --dports 137,138,139,111
- -j ACCEPT
# $IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# $IPT -A INPUT -j LOG --log-prefix "Blocked Packet!: "

$IPT -A FORWARD -i eth0 -j ACCEPT
$IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
# $IPT -A FORWARD -j LOG
# step 5 - enable NAT
# $IPT -t nat -A POSTROUTING -o eth0 -j MASQUERADE


(note some lines are commented out either because they were
experiments, or because they  are for configuration not present  on
the machine YET).


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32) - WinPT 0.7.93

iD8DBQE+GnbsxQEzeXtVwzoRAk51AJ9o95E3XN3md2DvkOommZTDZfLkPACdE7PY
ZTyP8HuDLcbzVfwKUK7lOyo=
=dhIj
-----END PGP SIGNATURE-----


