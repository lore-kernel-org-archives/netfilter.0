From: Noah Slater <nslater@gmail.com>
Subject: Problem with APT-GET (ftp) and iptables
Date: Thu, 23 Dec 2004 17:59:21 +0000
Message-ID: <9ea1c1180412230959363e647c@mail.gmail.com>
Reply-To: Noah Slater <nslater@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I have a question regarding iptables and apt-get. I have a shell
script which is included at the bottom of this email which sets up
iptables for me. The only problem is that it is not managing to track
apt-get's ftp connections and prevents me from using it. I have
included a tail of /var/log/messages and the output when I try to run
apt-get.

It seems to be failing to let ftp connections back into my box.

I would be more than appreciative if someone could point out where I
am going wrong.

Thank you very much,
Noah Slater


----------------------------------------------------------------------
root@achilles:/home/noah $ apt-get update
Get:1 ftp://mirror.bytemark.co.uk stable/main Packages
Hit http://security.debian.org stable/updates/main Packages
Hit http://security.debian.org stable/updates/main Release
Hit http://security.debian.org stable/updates/contrib Packages
Hit http://security.debian.org stable/updates/contrib Release
30% [1 Packages 0]
----------------------------------------------------------------------

(At this point it indefinitely hangs...)

----------------------------------------------------------------------
tail /var/log/messages
----------------------------------------------------------------------
Dec 23 17:45:18 achilles kernel: conntrack_ftp: partial 227  2850985299+27
Dec 23 17:45:18 achilles kernel: Dropped by default:IN=eth0 OUT=
MAC=fe:fd:50:44:58:07:fe:ff:00:00:00:01:08:00 SRC=212.13.210.26
DST=80.68.88.7 LEN=60 TOS=0x00 PREC=0x00 TTL=62 ID=16672 DF PROTO=TCP
SPT=53792 DPT=1220 WINDOW=5840 RES=0x00 SYN URGP=0
Dec 23 17:45:21 achilles kernel: Dropped by default:IN=eth0 OUT=
MAC=fe:fd:50:44:58:07:fe:ff:00:00:00:01:08:00 SRC=212.13.210.26
DST=80.68.88.7 LEN=60 TOS=0x00 PREC=0x00 TTL=62 ID=16673 DF PROTO=TCP
SPT=53792 DPT=1220 WINDOW=5840 RES=0x00 SYN URGP=0
Dec 23 17:45:23 achilles kernel: Dropped by default:IN=eth0 OUT=
MAC=fe:fd:50:44:58:07:fe:ff:00:00:00:01:08:00 SRC=212.13.210.26
DST=80.68.88.7 LEN=60 TOS=0x00 PREC=0x00 TTL=62 ID=40928 DF PROTO=TCP
SPT=53782 DPT=1217 WINDOW=5840 RES=0x00 SYN URGP=0
Dec 23 17:45:27 achilles kernel: Dropped by default:IN=eth0 OUT=
MAC=fe:fd:50:44:58:07:fe:ff:00:00:00:01:08:00 SRC=212.13.210.26
DST=80.68.88.7 LEN=60 TOS=0x00 PREC=0x00 TTL=62 ID=16674 DF PROTO=TCP
SPT=53792 DPT=1220 WINDOW=5840 RES=0x00 SYN URGP=0
Dec 23 17:45:39 achilles kernel: Dropped by default:IN=eth0 OUT=
MAC=fe:fd:50:44:58:07:fe:ff:00:00:00:01:08:00 SRC=212.13.210.26
DST=80.68.88.7 LEN=60 TOS=0x00 PREC=0x00 TTL=62 ID=16675 DF PROTO=TCP
SPT=53792 DPT=1220 WINDOW=5840 RES=0x00 SYN URGP=0
Dec 23 17:45:47 achilles kernel: Dropped by default:IN=eth0 OUT=
MAC=fe:fd:50:44:58:07:fe:ff:00:00:00:01:08:00 SRC=212.13.210.26
DST=80.68.88.7 LEN=60 TOS=0x00 PREC=0x00 TTL=62 ID=40929 DF PROTO=TCP
SPT=53782 DPT=1217 WINDOW=5840 RES=0x00 SYN URGP=0
----------------------------------------------------------------------


----------------------------------------------------------------------
FILE: iptables-setup
----------------------------------------------------------------------
#! /bin/sh

IPTABLES=/sbin/iptables
test -x $IPTABLES || exit 5

echo -n "Loading packet filters... "

# Flush old rules and chains

    $IPTABLES --flush
    $IPTABLES --delete-chain

# Set default deny policies

    $IPTABLES -P INPUT   DROP
    $IPTABLES -P FORWARD DROP
    $IPTABLES -P OUTPUT  DROP

# Give free reign to loopback interfaces

    $IPTABLES -A INPUT  -i lo -j ACCEPT
    $IPTABLES -A OUTPUT -o lo -j ACCEPT

# Rudimentary anti-IP-spoofing drops

    $IPTABLES -A INPUT -s 255.0.0.0/8    -j LOG  --log-prefix "Spoofed
source IP!"
    $IPTABLES -A INPUT -s 255.0.0.0/8    -j DROP
    $IPTABLES -A INPUT -s 0.0.0.0/8      -j LOG  --log-prefix "Spoofed
source IP!"
    $IPTABLES -A INPUT -s 0.0.0.0/8      -j DROP
    $IPTABLES -A INPUT -s 127.0.0.0/8    -j LOG  --log-prefix "Spoofed
source IP!"
    $IPTABLES -A INPUT -s 127.0.0.0/8    -j DROP
    $IPTABLES -A INPUT -s 192.168.0.0/16 -j LOG  --log-prefix "Spoofed
source IP!"
    $IPTABLES -A INPUT -s 192.168.0.0/16 -j DROP
    $IPTABLES -A INPUT -s 172.16.0.0/12  -j LOG  --log-prefix "Spoofed
source IP!"
    $IPTABLES -A INPUT -s 172.16.0.0/12  -j DROP
    $IPTABLES -A INPUT -s 10.0.0.0/8     -j LOG  --log-prefix "Spoofed
source IP!"
    $IPTABLES -A INPUT -s 10.0.0.0/8     -j DROP
    $IPTABLES -A INPUT -s 80.68.88.7     -j LOG  --log-prefix "Spoofed our IP!"
    $IPTABLES -A INPUT -s 80.68.88.7     -j DROP

# Tell netfilter all TCP sessions begin with SYN

    $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j LOG 
--log-prefix "Stealth scan attempt?"
    $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# INBOUND Policy

        # Accept inbound packets that are part of previously accepted
sessions
        $IPTABLES -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED

        # Accept inbound packets which initiate SSH sessions
        $IPTABLES -A INPUT -p tcp -j ACCEPT --dport 22 -m state --state NEW

        # Log anything not accepted above
        $IPTABLES -A INPUT -j LOG --log-prefix "Dropped by default:"

# OUTBOUND Policy

        # If it's part of an aproved connection, let it out
        $IPTABLES -I OUTPUT 1 -m state --state RELATED,ESTABLISHED -j ACCEPT

        # Allow outbound packets which initiate HTTP sessions
        $IPTABLES -A OUTPUT -p tcp -j ACCEPT --dport 80 -m state --state NEW

        # Allow outbound packets which initiate FTP sessions
        $IPTABLES -A OUTPUT -p tcp -j ACCEPT --dport 21 -m state --state NEW

        # Allow outbound DNS queries to resolve IPs
        $IPTABLES -A OUTPUT -p udp --dport 53 -m state --state NEW -j ACCEPT

        # Log anything not accepted above
        $IPTABLES -A OUTPUT -j LOG --log-prefix "Dropped by default:"

echo "Done!"
----------------------------------------------------------------------

