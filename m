From: "Christian H. Kuhn" <christian.kuhn@qno.de>
Subject: H.323 Masquerading
Date: Fri, 11 Oct 2002 17:29:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021011152949.GM10468@qno.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.samba.org>

Hi,

Problem: small network, debian sarge router, kernel 2.4.19 from
kernel.org (not the debian version), iptables. 2 Clients, one Debian
sid or Win98SE, the other Win2k. NetMeeting on both Win-Clients.

On http://www.gnomemeeting.org/faq.php i found a link to
http://roeder.goe.net/~koepi/newnat.html. I downloaded the patch and
followed the instructions: vanilla kernel 2.4.19 unpacked to
/usr/src/linux (not really, but symlink set), iptables 1.2.7a
downloaded and unpacked, kernel patched, in KERNEL_DIR make
menuconfig, in iptables/ make KERNEL_DIR=/usr/src/linux BINDIR=/sbin
LIBDIR=/lib MANDIR=/usr/share/man, make install with same parameters,
in KERNEL_DIR make dep clean bzImage modules modules_install. No
errors, router is running after reboot.

Modules loaded:
ns:~# lsmod
Module                  Size  Used by    Not tainted
ip_nat_h323             3068   0  (unused)
ip_conntrack_h323       2976   1  [ip_nat_h323]
ipt_MASQUERADE          1688   1  (autoclean)
ipt_LOG                 3160   1  (autoclean)
ipt_state                600   1  (autoclean)
iptable_filter          1672   1  (autoclean)
ip_nat_ftp              3280   0  (unused)
iptable_nat            18840   3  [ip_nat_h323 ipt_MASQUERADE ip_nat_ftp]
ip_conntrack_irc        3152   0  (unused)
ip_conntrack_ftp        3984   1  [ip_nat_ftp]
ip_conntrack           23744   5  [ip_nat_h323 ip_conntrack_h323 ipt_MASQUERADE ipt_state ip_nat_ftp iptable_nat ip_conntrack_irc ip_conntrack_ftp]
ip_tables              12728   7  [ipt_MASQUERADE ipt_LOG ipt_state iptable_filter iptable_nat]

I connect with NetMeeting from one Client to an ILS server. The entry
in the directory appears. I can call other people, but only chat is
possible, no sound or video. I cannot be called from other people.  In
/var/log/syslog, i find:

Oct 11 17:12:40 ns kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock_R71150de5 readlocked
Oct 11 17:12:40 ns kernel: ASSERT ip_nat_core.c:739 &ip_conntrack_lock not readlocked
Oct 11 17:12:40 ns kernel: ASSERT ip_nat_core.c:739 &ip_conntrack_lock not readlocked
Oct 11 17:12:40 ns kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked

repeated ad infinitum.

Masquerading is set up with:

FWVER=0.01
echo -e "\n\nLoading simple rc.firewall version $FWVER..\n"
IPTABLES=/sbin/iptables
EXTIF="ppp0"
INTIF="eth1"
echo "   External Interface:  $EXTIF"
echo "   Internal Interface:  $INTIF"
echo -en "   loading modules: "
echo "  - Verifying that all kernel modules are ok"
/sbin/depmod -a
echo -en "ip_tables, "
/sbin/insmod ip_tables
echo -en "ip_conntrack, "
/sbin/insmod ip_conntrack
echo -en "ip_conntrack_ftp, "
/sbin/insmod ip_conntrack_ftp
echo -en "ip_conntrack_irc, "
/sbin/insmod ip_conntrack_irc
echo -en "ip_conntrack_h323, "
/sbin/insmod ip_conntrack_h323
echo -en "iptable_nat, "
/sbin/insmod iptable_nat
echo -en "ip_nat_ftp, "
/sbin/insmod ip_nat_ftp
echo -en "ip_nat_h323, "
/sbin/insmod ip_nat_h323
echo ".  Done loading modules."
echo "   enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "   enabling DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
echo "   clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F
echo "   FWD: Allow all connections OUT and only existing and related ones IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG
echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
echo -e "\nrc.firewall-2.4 v$FWVER done.\n"

Any hints?

TIA,
Chris
-- 
http://www.qno.de
ICQ 57840861

