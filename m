From: "Christian H. Kuhn" <qno-netfilter@qno.de>
Subject: H.323 masquerading
Date: Fri, 11 Oct 2002 18:12:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021011161234.GR10468@qno.de>
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

Problem: small network, Debian sarge router, kernel 2.4.19, iptables. Two clients,
one Debian sid or Win98SE, the other Win2k. NetMeeting on both Win
clients.

On http://www.gnomemeeting.org/faq.php i found a link to
http://roeder.goe.net/~koepi/newnat.html. I downloaded the patch, the
kernel 2.4.19 from kernel.org and iptables-1.2.7a. I unpacked all,
patched and configured the kernel, compiled and installed iptables
(setting paths so that the debian files are overwritten), compiled and
installed the kernel. After rebooting, everything seems to be fine.

Masquerading is set up as follows:

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

http, ftp, icq, ... are working. When trying NetMeeting, i can log
onto an ils server. When connecting to other people, i see in
/var/log/syslog:

Oct 11 17:12:40 ns kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock_R71150de5 readlocked
Oct 11 17:12:40 ns kernel: ASSERT ip_nat_core.c:739 &ip_conntrack_lock not readlocked
Oct 11 17:12:40 ns kernel: ASSERT ip_nat_core.c:739 &ip_conntrack_lock not readlocked
Oct 11 17:12:40 ns kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked

repeated ad infinitum. I can connect and chat, but no
video/audio. Other people cannot call me.

Any hints?

Kind regards,
Chris
-- 
http://www.qno.de
ICQ 57840861

