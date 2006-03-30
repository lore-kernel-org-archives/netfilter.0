From: "Carlos Pastorino" <carlos.pastorino@gmail.com>
Subject: Re: It seems I've found why conntrack blocks some packets
Date: Thu, 30 Mar 2006 11:01:31 -0300
Message-ID: <cc4fcc140603300601j169864eexddc8fe3dd06c1a24@mail.gmail.com>
References: <57F9959B46E0FA4D8BA88AEDFBE582901674BC@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE582901674BC@pxtbenexd01.pxt.primeexalia.com>
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
To: "Gary W. Smith" <gary@primeexalia.com>
Cc: netfilter@lists.netfilter.org, Steven M Campbell <Netfilter@scampbell.net>

On 3/30/06, Gary W. Smith <gary@primeexalia.com> wrote:
> Are you by chance doing any rate limiting actions in your firewall or on
> your box?  Is there any type of balanced connection in place?  Port
> rewrites, etc?
>
>
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Carlos
> Pastorino
> Sent: Wednesday, March 29, 2006 9:06 PM
> To: Steven M Campbell
> Cc: netfilter@lists.netfilter.org
> Subject: Re: It seems I've found why conntrack blocks some packets
>
>
> The test showed that blocking pop-ups does not generate the desired
> behavior, because the 3-way handshake completes normally, even for the
> blocked pop-up.
>
> So I dug a little deeper. I checked other connections from the same
> customer, that were also around the same time. They didn't caught my
> attention before because there were no packets blocked FROM the
> webserver. The problem is, this shows that the problem can be in my
> firewall after all. Here are the connections.
>
> First, the blocked packets on the firewall:
>
> Mar 28 14:46:50 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
> SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
26 ID=3D1
> PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
> Mar 28 14:46:56 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
> SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
26 ID=3D1
> PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
> Mar 28 14:47:08 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
> SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
26 ID=3D1
> PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
> Mar 28 14:47:32 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
> SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
26 ID=3D1
> PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
> Mar 28 14:48:20 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
> SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
26 ID=3D1
> PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
> Mar 28 14:57:34 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
> SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
26 ID=3D1
> PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK RST URGP=3D0
>
> and now the tcpdump on the webserver:
>
> 14:46:46.153552 customerip.2184 > webserverip.80: S [tcp sum ok]
> 290916053:290916053(0) win 65535 <mss 1460,nop,nop,sackOK> (DF) (ttl
> 120, id 41051, len 48)
> 14:46:46.153561 webserverip.80 > customerip.2184: S [tcp sum ok]
> 4139392508:4139392508(0) ack 290916054 win 5840 <mss
> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> 14:46:50.527630 webserverip.80 > customerip.2184: S [tcp sum ok]
> 4139392508:4139392508(0) ack 290916054 win 5840 <mss
> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> 14:46:56.527621 webserverip.80 > customerip.2184: S [tcp sum ok]
> 4139392508:4139392508(0) ack 290916054 win 5840 <mss
> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> 14:47:08.527607 webserverip.80 > customerip.2184: S [tcp sum ok]
> 4139392508:4139392508(0) ack 290916054 win 5840 <mss
> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> 14:47:32.727574 webserverip.80 > customerip.2184: S [tcp sum ok]
> 4139392508:4139392508(0) ack 290916054 win 5840 <mss
> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> 14:48:20.927521 webserverip.80 > customerip.2184: S [tcp sum ok]
> 4139392508:4139392508(0) ack 290916054 win 5840 <mss
> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
>
> As you can see, here even the ACKs that were supposed to complete the
> 3-way handshake are getting blocked.
>
> What could possibly be the reason for this?
>
> Regards,
>
> Carlos
>
>


Hi Gary,

Nope. No rate limiting, no balance and no port rewrites. Here's my
firewall script (showing just the FORWARD table and a few other
things):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

#!/bin/sh

[VARIABLE DEFINITIONS SUPRESSED]

/sbin/depmod -a

/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
/sbin/modprobe ip_tables
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REJECT
/sbin/modprobe ipt_state
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
#/sbin/modprobe ip_conntrack_irc
#/sbin/modprobe ip_nat_irc
#/sbin/modprobe ipt_MASQUERADE
#/sbin/modprobe ipt_owner

echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/tcp_syncookies
echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
echo "0" > /proc/sys/net/ipv4/conf/all/log_martians
echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter

$IPTABLES -F
$IPTABLES -X
$IPTABLES -t nat -F
$IPTABLES -t nat -X
$IPTABLES -t mangle -F
$IPTABLES -t mangle -X

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -N pre_analysis

$IPTABLES -A pre_analysis -p TCP --tcp-flags SYN,ACK SYN,ACK -m state
--state NEW -j LOG --log-prefix "syn-ack-new: "
$IPTABLES -A pre_analysis -p TCP --tcp-flags SYN,ACK SYN,ACK -m state
--state NEW -j REJECT --reject-with tcp-reset

$IPTABLES -A pre_analysis -p TCP ! --syn -m state --state NEW -j LOG
--log-prefix "new-not-syn: "
$IPTABLES -A pre_analysis -p TCP ! --syn -m state --state NEW -j DROP

[INPUT TABLE SUPRESSED]

[OUTPUT TABLE SUPRESSED]

# FORWARD TABLE

$IPTABLES -A FORWARD -p ALL -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -p ICMP -i $DMZ_IFACE -s $DMZ_RANGE -j ACCEPT

$IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
-d $0/0 --syn --dport domain -j ACCEPT
$IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
-d 0/0 --syn --dport ftp -j ACCEPT
$IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
-d 0/0 --syn --dport http -j ACCEPT
$IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
-d 0/0 --syn --dport smtp -j ACCEPT
$IPTABLES -A FORWARD -p UDP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
-d 0/0 --dport domain -j ACCEPT
$IPTABLES -A FORWARD -p UDP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
-d 0/0 --dport ntp -j ACCEPT

$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 10.0.0.0/8 -j LOG
--log-prefix "spoofed: "
$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 10.0.0.0/8 -j DROP
$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 172.16.0.0/12 -j LOG
--log-prefix "spoofed: "
$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 172.16.0.0/12 -j DROP
$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 192.168.0.0/16 -j LOG
--log-prefix "spoofed: "
$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 192.168.0.0/16 -j DROP
$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 127.0.0.0/8 -j LOG
--log-prefix "spoofed: "
$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 127.0.0.0/8 -j DROP
$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 169.254.0.0/16 -j LOG
--log-prefix "spoofed: "
$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -s 169.254.0.0/16 -j DROP

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -s 0/0 -j pre_analysis

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -s 0/0 -d
$DMZ_RANGE --syn --dport ssh -j ACCEPT
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -s
$MONITORING -d $DMZ_RANGE --dport snmp -j ACCEPT
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -s
$MONITORING -d $DMZ_RANGE -j ACCEPT
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -s 0/0 -d
$DMZ_RANGE -j DROP

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -s
$MONITORING -d $DMZ_WEBSERVER --syn --dport ftp -j ACCEPT
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -s 0/0 -d
$DMZ_WEBSERVER --syn --dport http -j ACCEPT
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -s 0/0 -d
$DMZ_WEBSERVER --syn --dport https -j ACCEPT

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -s 0/0 -d
$DMZ_MAILSERVER --syn --dport auth -j REJECT --reject-with tcp-reset
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -s 0/0 -d
$DMZ_MAILSERVER --syn --dport pop3 -j ACCEPT
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -s 0/0 -d
$DMZ_MAILSERVER --syn --dport smtp -j ACCEPT

[SOME FORWARD LINES SUPPRESSED]

$IPTABLES -A FORWARD -j LOG --log-prefix "FORWARD blocked: "

service iptables save

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Also, a few diagnostics about the firewall server, which is:
Pentium 4
512 MB RAM
Fedora Core 3
iptables-1.2.11-3.1.FC3

top output:
top - 10:57:51 up 6 days,  3:04,  3 users,  load average: 0.00, 0.00, 0.00
Tasks:  65 total,   1 running,  64 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.2% us,  0.0% sy,  0.0% ni, 99.7% id,  0.0% wa,  0.0% hi,  0.2% s=
i
Mem:    513644k total,   446352k used,    67292k free,   206144k buffers
Swap:  1052152k total,      192k used,  1051960k free,   118336k cached

ifconfig output on INET_IFACE:
          RX packets:5399773 errors:0 dropped:0 overruns:0 frame:0
          TX packets:6578080 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:820222396 (782.2 MiB)  TX bytes:2120245609 (1.9 GiB)

ifconfig output on DMZ_IFACE:
          RX packets:7193253 errors:0 dropped:0 overruns:8 frame:0
          TX packets:6176877 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:2338744002 (2.1 GiB)  TX bytes:2625446017 (2.4 GiB)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

So, could there be anything wrong in the script above?

