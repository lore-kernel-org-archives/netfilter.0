From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Problem with nat/OUTPUT/DNAT rule
Date: Thu, 11 Nov 2004 23:34:09 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1B43@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

I have been trying to upgrade a RH9 firewall box running 1.2.7a to =
RHEL3.  I applied patch-o-matic pptp-conntrack to the RHEL3 kernel and =
everything "seemed" fine.  I have an automated script that generates =
some baseline firewall rules for some clients.  Anyways, It fails only =
on RHEL3 1.2.7a.  It works on my FC2 and RH9 boxes.
=20
The failure always happens on the nat filter, output chain:
=20
[0:0] -A OUTPUT -d 66.120.18.34 -j DNAT --to-destination 192.198.0.34
=20
Any ideas?
=20
Here are the modules that I an loading:
=20
/sbin/modprobe modprobe ip_conntrack_proto_gre
/sbin/modprobe modprobe ip_conntrack_pptp
/sbin/modprobe modprobe ip_nat_proto_gre
/sbin/modprobe modprobe ip_nat_pptp
/sbin/modprobe modprobe ip_conntrack_irc
/sbin/modprobe modprobe ip_nat_irc
/sbin/modprobe modprobe ip_conntrack_ftp
/sbin/modprobe modprobe ip_nat_ftp
/sbin/modprobe modprobe ip_conntrack_mms
/sbin/modprobe modprobe ip_nat_mms
/sbin/modprobe ipt_LOG
/sbin/modprobe ip_gre
/sbin/modprobe ipt_MASQUERADE
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_conntrack_irc
/sbin/modprobe ip_nat_ftp
/sbin/modprobe iptable_nat

Here is the actual firewall scripts (IP's are bogus):
=20
cat > /etc/sysconfig/iptables << 'EOF'
#************************************************************
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
#Incoming Maps
[0:0] -A PREROUTING -d 66.120.18.34 -j DNAT --to-destination =
192.198.0.34
[0:0] -A PREROUTING -d 66.120.18.35 -j DNAT --to-destination =
192.198.0.35
...
[0:0] -A PREROUTING -d 66.120.18.45 -j DNAT --to-destination =
192.198.0.45
[0:0] -A PREROUTING -d 66.120.18.46 -j DNAT --to-destination =
192.198.0.46
#Outgoing Maps (2 per IP - 1 local translation 1 remote)
[0:0] -A POSTROUTING -o eth0 -s 192.198.0.34 -j SNAT --to-source =
66.120.18.34
[0:0] -A POSTROUTING -d 192.198.0.34 -s 192.198.0.34 -j SNAT --to-source =
66.120.18.34
[0:0] -A POSTROUTING -o eth0 -s 192.198.0.35 -j SNAT --to-source =
66.120.18.35
[0:0] -A POSTROUTING -d 192.198.0.35 -s 192.198.0.35 -j SNAT --to-source =
66.120.18.35
...
[0:0] -A POSTROUTING -o eth0 -s 192.198.0.45 -j SNAT --to-source =
66.120.18.45
[0:0] -A POSTROUTING -d 192.198.0.45 -s 192.198.0.45 -j SNAT --to-source =
66.120.18.45
[0:0] -A POSTROUTING -o eth0 -s 192.198.0.46 -j SNAT --to-source =
66.120.18.46
[0:0] -A POSTROUTING -d 192.198.0.46 -s 192.198.0.46 -j SNAT --to-source =
66.120.18.46
[0:0] -A POSTROUTING -o eth0 -j SNAT --to-source 66.120.18.33
#************************************************************
# <-------- Failes on the next line ------------>
[0:0] -A OUTPUT -d 66.120.18.34 -j DNAT --to-destination 192.198.0.34
[0:0] -A OUTPUT -d 66.120.18.35 -j DNAT --to-destination 192.198.0.35
[0:0] -A OUTPUT -d 66.120.18.36 -j DNAT --to-destination 192.198.0.36
[0:0] -A OUTPUT -d 66.120.18.37 -j DNAT --to-destination 192.198.0.37
[0:0] -A OUTPUT -d 66.120.18.38 -j DNAT --to-destination 192.198.0.38
[0:0] -A OUTPUT -d 66.120.18.39 -j DNAT --to-destination 192.198.0.39
[0:0] -A OUTPUT -d 66.120.18.40 -j DNAT --to-destination 192.198.0.40
[0:0] -A OUTPUT -d 66.120.18.41 -j DNAT --to-destination 192.198.0.41
[0:0] -A OUTPUT -d 66.120.18.42 -j DNAT --to-destination 192.198.0.42
[0:0] -A OUTPUT -d 66.120.18.43 -j DNAT --to-destination 192.198.0.43
[0:0] -A OUTPUT -d 66.120.18.44 -j DNAT --to-destination 192.198.0.44
[0:0] -A OUTPUT -d 66.120.18.45 -j DNAT --to-destination 192.198.0.45
[0:0] -A OUTPUT -d 66.120.18.46 -j DNAT --to-destination 192.198.0.46
COMMIT


