From: Sam Gandhi <samgandhi9@gmail.com>
Subject: SYN, ACK, ACK PSH packets getting dropped (?)
Date: Fri, 8 Jul 2011 14:42:00 -0700
Message-ID: <CAOdLEarz-mG6wKMnirJi07xJfW=5A3AZUAV+cwKdbs99K=+p-w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=n4PXg8W+GF2wu2AInjbvf8ZW4pg9di5DC4E+S6zcXlA=;
        b=Wy0Dqu46PT+HnLH0iHmZqWjH0vmneFyex4LL94q4TD6G9yL5t478t5xF13uK4bz27Y
         x2E6uyeHcCZmhmG3VIvZi5fIg48qL1ylpo19CWs+SxUqOlpSAUJdMrZseXAFJGLBWtIK
         Xc6YVwO6N1xojoZW+8rqpkfXgsidNDv5cTg4k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am trying to configure small industrial device that has one ethernet
interface ("internal") and another WLAN interface.

I have attached below shell function I am using configure the iptables
rule below. I have include a rule   $IPT -A OUTPUT  -j LOG
--log-prefix "OU " at the bottom to log any packets that fall through
the OUTPUT chain and log them. And I see following output, should be
worried about this? How do I go about fixing this?  If anyone wants
please do provide any suggestion on improving this iptable rule
further. Basically what I want to do is  accept DNS, NTP, COPS traffic
over wlan0 interface and also allow NFS booting device over eth0.

OU IN= OUT=wlan0 SRC=10.50.3.108 DST=10.12.0.120 LEN=60 TOS=0x00
PREC=0x00 TTL=64 ID=45948 DF PROTO=TCP SPT=42537 DPT=3288 WINDOW=5440
RES=0x00 SYN URGP=0
OU IN= OUT=wlan0 SRC=10.50.3.108 DST=10.30.5.10 LEN=60 TOS=0x00
PREC=0x00 TTL=64 ID=19425 DF PROTO=TCP SPT=44375 DPT=3183 WINDOW=5440
RES=0x00 SYN URGP=0
OU IN= OUT=wlan0 SRC=10.50.3.108 DST=10.30.5.10 LEN=52 TOS=0x00
PREC=0x00 TTL=64 ID=19426 DF PROTO=TCP SPT=44375 DPT=3183 WINDOW=2720
RES=0x00 ACK URGP=0
OU IN= OUT=wlan0 SRC=10.50.3.108 DST=10.30.5.10 LEN=76 TOS=0x00
PREC=0x00 TTL=64 ID=19427 DF PROTO=TCP SPT=44375 DPT=3183 WINDOW=2720
RES=0x00 ACK PSH URGP=0
OU IN= OUT=wlan0 SRC=10.50.3.108 DST=10.30.5.10 LEN=52 TOS=0x00
PREC=0x00 TTL=64 ID=19428 DF PROTO=TCP SPT=44375 DPT=3183 WINDOW=2720
RES=0x00 ACK URGP=0
OU IN= OUT=wlan0 SRC=10.50.3.108 DST=10.30.5.10 LEN=52 TOS=0x00
PREC=0x00 TTL=64 ID=19429 DF PROTO=TCP SPT=44375 DPT=3183 WINDOW=2720
RES=0x00 ACK FIN URGP=0


IPT=/usr/sbin/firewall
#Function to echo 1 to a file
enable ()
{
for file in $@; do echo 1 > $file; done
}

#Function to echo 0 to a file
disable ()
{
for file in $@; do echo 0 > $file; done
}

firewall_start()
{

	disable /proc/sys/net/ipv4/ip_forward                      # disable
Packet forwarning between interfaces
	enable /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts     # ignore
all ICMP ECHO and TIMESTAMP requests sent to it via
broadcast/multicast
	enable /proc/sys/net/ipv4/conf/all/log_martians           # log
packets with impossible addresses to kernel log
	enable /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses  #
disable logging of bogus responses to broadcast frames
	enable /proc/sys/net/ipv4/conf/all/rp_filter              # do source
validation by reversed path
	disable /proc/sys/net/ipv4/conf/all/send_redirects         # don't
send redirects
	disable /proc/sys/net/ipv4/conf/all/accept_source_route    # don't
accept packets with SRR option
        disable /proc/sys/net/ipv4/conf/*/accept_source_route      #
Disable source routed packets
	enable /proc/sys/net/ipv4/conf/*/rp_filter # we don't allow pkt
coming from one interface going out other interface

	$IPT -F
	$IPT -X
	$IPT -P OUTPUT ACCEPT
	if [ $NFS_BOOT -eq 1 ]; then
		#portmapper
		$IPT -P INPUT ACCEPT
		$IPT -A INPUT -i eth0 -p tcp --sport 111 -j ACCEPT
		$IPT -A INPUT -i eth0 -p udp --sport 111 -j ACCEPT
		# NFS daemon ports
		$IPT -A INPUT -i eth0 -p tcp --sport 2049 -j ACCEPT
		$IPT -A INPUT -i eth0 -p udp --sport 2049 -j ACCEPT
		$IPT -A OUTPUT -o eth0 -p tcp --dport 2049 -j ACCEPT
		$IPT -A OUTPUT -o eth0 -p udp --dport 2049 -j ACCEPT
		# NFS mountd ports
		$IPT -A INPUT -i eth0 -p udp --sport 36371 -j ACCEPT
		$IPT -A INPUT -i eth0 -p tcp --sport 38103 -j ACCEPT
		# NFS status ports
		$IPT -A INPUT -i eth0 -p udp --sport 41291 -j ACCEPT
		$IPT -A INPUT -i eth0 -p tcp --sport 55364 -j ACCEPT
		# NFS lock manager ports
		$IPT -A INPUT -i eth0 -p udp --sport 50707 -j ACCEPT
		$IPT -A INPUT -i eth0 -p tcp --sport 59349 -j ACCEPT
	fi
	$IPT -P INPUT DROP
	$IPT -P FORWARD DROP
	
	#ACCEPT everything on loopback
	$IPT -A INPUT --in-interface lo -j ACCEPT
	$IPT -A OUTPUT --out-interface lo -j ACCEPT

	#Drop spoofed packets, packets with local source IP address coming
from outside.
	$IPT -A INPUT  -i eth0 -s 192.168.137.1 -m recent --set -j DROP

	#Limit ping responses for brute force attack.
	$IPT -A INPUT  -p icmp -m limit --limit 10/second -j ACCEPT
	$IPT -A INPUT  -p icmp -j DROP


	#dictionary attacks on the SSH server port
	#Allow 3 connetions from same source IP in 60 seconds.
	$IPT -A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -m recent --set
	$IPT -A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -m recent
--update --seconds 60 --hitcount 4 -j DROP

	#Allow ssh connection on port 22
	$IPT -A INPUT -p tcp --dport 22 -j ACCEPT

	#protection on telnet
	$IPT -A INPUT -p tcp -m tcp --dport 23 -m state --state NEW -m recent --set
	$IPT -A INPUT -p tcp -m tcp --dport 23 -m state --state NEW -m recent
--update --seconds 60 --hitcount 4 -j DROP
	#allow telnet connection
	$IPT -A INPUT -p tcp --dport 23 -j ACCEPT

	#DNS rules we should probably tighten this bit more to specific DNS server.
	$IPT -I INPUT -p udp --sport 53 --dport 1024:65535 -j ACCEPT
	$IPT -I OUTPUT -p udp --dport 53 --sport 1024:64435 -j ACCEPT
	$IPT -I OUTPUT -p udp --sport 53 --dport 1024:65535 -j ACCEPT

	#NTP client service let it run only over wan interface not eth*
	#$IPT -A OUTPUT --out-interface wlan0 --p udp --dport 123 -j LOG
--log-prefix "NTP output:"
	$IPT -A OUTPUT --out-interface wlan0 -p udp --dport 123 -j ACCEPT
	#$IPT -A INPUT --in-interface wlan0 -p udp --sport 123 -j LOG
--log-prefix "NTP input: "
	$IPT -A INPUT --in-interface wlan0  -p udp --sport 123 -j ACCEPT

	#COPS ports 3183 COPS/TLS 3288 COPS
	$IPT -A INPUT -p tcp  --sport 3183 -m state --state NEW -j ACCEPT
	$IPT -A INPUT -p tcp  --sport 3288 -m state --state NEW -j ACCEPT

	$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

        # log all the rest before dropping just for debugging
        # Drop inbound NETBIOS packet and accept output syslog
        $IPT -A INPUT  --in-interface=eth0 -p udp --sport 138 -j DROP
        $IPT -A INPUT  -j LOG --log-prefix "IN "
        $IPT -A OUTPUT --out-interface=eth0 -p udp --dport 514 -j ACCEPT
        $IPT -A OUTPUT  -j LOG --log-prefix "OU "
        $IPT -A FORWARD -j LOG --log-prefix "FW "
}


Regards,
-Sam
