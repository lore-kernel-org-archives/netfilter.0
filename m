From: =?iso-8859-1?Q?Thomas_B=F6hme?= <T.Boehme@mc-wetter.de>
Subject: Problems with natted FTP connections
Date: Wed, 15 Jun 2005 14:03:21 +0200
Message-ID: <827F4DA483EF5F42B31E2E19E1A31127E8F220@redmond.berlin.mc-wetter.de>
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

Hello,

I have a Firewall running on a Debian Sarge with iptables 1.2.11-10 and =
vanilla kernel 2.6.11.12. The ip_conntrack_ftp and ip_nat_ftp modules =
are compiled into the kernel (loadable module support is disabled).

Wenn I want to download files from my local net which is SNATed using =
FTP. After some files I get an error like this:

ftp> mget *
mget R1121320.ZIP?
200 Port command successful.
150 Opening data connection for R1121320.ZIP (3960 bytes).
226 Transfer ok
3960 bytes received in 0.07 secs (57.4 kB/s)
mget R1121325.ZIP?
200 Port command successful.
150 Opening data connection for R1121325.ZIP (4183 bytes).
226 Transfer ok
4183 bytes received in 0.05 secs (90.7 kB/s)
mget R1121330.ZIP?
200 Port command successful.
500 Unknown command.

When I add logging rules to log the traffic I see many ACK and SYN =
packages on any download but the last attempt show no SYN package.


Here is my firewall rule set:

###   localnet <-->  eth0 - firewall - eth2 <--> INET


#!/bin/sh
IPTABLES=3D/sbin/iptables
INT=3Deth0
EXT=3Deth2
IP_INT=3D172.18.0.0./16

$IPTABLES -F    # flush all chains
$IPTABLES -X    # remove all non-buildin chains

$IPTABLES -t nat -F    # flush all nat chains
$IPTABLES -t nat -X    # remove all non-buildin nat chains

$IPTABLES -P INPUT   ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -P OUTPUT  ACCEPT

echo -n "Enabling IP Spoof Protection ... "
for i in /proc/sys/net/ipv4/conf/*/rp_filter;do
    echo "1" > $i
done

echo -n "Enabling Syn Flood Protection ... "
echo "1" > /proc/sys/net/ipv4/tcp_syncookies


echo -n "Ignoring Broadcast Echo Requests ... "
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts


echo -n "Enabling IP Forwarding ... "
echo "1" > /proc/sys/net/ipv4/ip_forward

#######################
# Enable masquerading #
#######################
echo "Enable inet masquerading"
$IPTABLES -t nat -A POSTROUTING -s $IP_INT -o $EXT -j MASQUERADE

# accept all packages
$IPTABLES -A INPUT  -j ACCEPT
$IPTABLES -A OUTPUT  -j ACCEPT
$IPTABLES -A FORWARD -j ACCEPT



On a debian woody with 2.4.26 vanilla kernel and iptables =
1.2.6a-5.0woody2 everything works with the same IP-Tables script. I used =
that kernel config and build all modules into the 2.6.11.12 kernel.

CONFIG_IP_NF_FTP=3Dy
CONFIG_IP_NF_TFTP=3Dy
CONFIG_IP_NF_NAT_FTP=3Dy
CONFIG_IP_NF_NAT_TFTP=3Dy

The ftp download on my firewall itself works but not from internal, so =
it must be be related to ftp-NAT/CONNTRACK.

Who can help me?



Regards,
Thomas

