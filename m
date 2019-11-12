From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: Trouble getting SYNPROXY to work.
Date: Tue, 12 Nov 2019 11:37:29 +0300
Message-ID: <3abdbb03-e10c-938f-bfb1-5e10764e1a3f@gmail.com>
References: <3018728.1mgFJ8EcOk@topolinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=VoEIaVV/ffL/FNpqzSA717o8S1SUXYfroKwY96GPZdk=;
        b=Dj8KI2qzG3UzRNTwGNtCDOk+YsTVI7MC4uDt2Jt+vEJjoZ1qPq35jlZgAUOcxvPU90
         E9AnPank+ioLyVS1Gea8vbcFCmN9v3g9OSRPhfNp0Wp8zKZPFjj5pCKuxP99u5oD1uCw
         CckzP93Y+78gKor/JD8fLWhPzISH/QpBSFsq4j3pa3Nmtt/xN36YQnRFEKPOGBMUYlYA
         50TvRLl8HE5reS8+aeWBwJqw+OeEqw+rWzKVUMqRj6vYJq8+gPQKeoHNDXuHz/JOUiBf
         Z/lpEg9KGWF62NuBpK5DcYrwcU1YN2iC6qfxFpcw6jtg/T2L0Qpt9UWIGwZbwM7/aRC2
         vUvg==
In-Reply-To: <3018728.1mgFJ8EcOk@topolinux>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pigi <pigi@frumar.it>, netfilter@vger.kernel.org

Hi Pierluigi,

If you don't have ip address on br0 interface.

You have a routing problem.

Solution:
gw=192.0.2.1
gw_mac=00:00:00:00:00:01
server_or_other_internal_firewall=192.0.2.2
server_or_other_internal_firewall_mac=00:00:00:00:00:02

ip neigh add $gw lladdr $gw_mac dev br0
ip neigh add $server_or_other_internal_firewall lladdr 
$server_or_other_internal_firewall_mac dev br0

ip route add $gw dev br0
ip route add $server_or_other_internal_firewall dev br0
ip route add default via $gw

If you have a IP address on br0 interface then you should check 
net.ipv4.ip_forward sysctl parameters. (value should be 1)

My other advice to you.
1- Use external Ethernet for SYN Proxy.
/usr/sbin/iptables -A INPUT -m physdev --physdev-in $external_iface_eth0 
-p tcp -m tcp -m conntrack --dport 81 --ctstate INVALID,UNTRACKED -j 
SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1323

2- If you set 0 this parameters then you take the better performance.

net.ipv4.tcp_timestamps = 1


3- Last advice.
If you are using HTTPS connection then don't set wscale. And you may use 
mss 1460.

Regards.

Fatih USTA

On 11.11.2019 23:46, Pigi wrote:
> Hi all,
>   long post, so please apologize.
>
> I'm having a hard time getting SYNPROXY working on my ( iptables based ) firewall.
>
> It's quite some time I've noticed that may servers ( in DMZ ) are under SYN flood attack and readed almost every link I've found to make this target working with no chance.
>
>
>           |
>           | Internet ( eth0 )
>           |
>      +---------+
>      |         +----- br0 (bridge for openvpn tun )
>      |         |
>      |  Fw     +----- DMZ ( eth1 )
>      |         |
>      +---------+
>           |
>           | Internal net ( eth2 )
>           |
>
>
> Easy setup, as you can see.
>
> I have a bunch of rule ( INPUT OUTPUT FORWARD and NAT ) that are currently working, but I can't get in any way this three rules to work:
>
> /usr/sbin/iptables -t raw -I PREROUTING -i br0 -p tcp -m tcp --syn --dport 81 -j CT --notrack
> /usr/sbin/iptables -A INPUT -i br0  -p tcp -m tcp -m conntrack --dport 81 --ctstate INVALID,UNTRACKED -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1323
> /usr/sbin/iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
>
> If I enable them, I can see the SYN packet ( from the br0 interface ) that enter the interface, but no SYN+ACK reply exiting:
>
> root@firewall:~# iptables -t raw -L -v -n
> Chain PREROUTING (policy ACCEPT 418 packets, 67307 bytes)
>   pkts bytes target     prot opt in     out     source               destination
>      0     0 CT         tcp  --  br0    *       0.0.0.0/0            0.0.0.0/0            tcp dpt:81 flags:0x17/0x02 CT notrack
>
> root@firewall:~# iptables  -L INPUT -v -n
> Chain INPUT (policy DROP 0 packets, 0 bytes)
>   pkts bytes target     prot opt in     out     source               destination
>      0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
>     17  1776 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
>      0     0 SYNPROXY   tcp  --  br0    *       0.0.0.0/0            0.0.0.0/0            tcp dpt:81 ctstate INVALID,UNTRACKED SYNPROXY sack-perm timestamp wscale 7 mss 1323
>      0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
>
> other_host# telnet 10.0.1.51 81
> Trying 10.0.1.51...
> telnet: connect to address 10.0.1.51: Connection timed out
>
>
> The SYNPROXY get triggered:
>
> root@firewall:~# iptables -t raw -L -v -n
> Chain PREROUTING (policy ACCEPT 1453 packets, 360K bytes)
>   pkts bytes target     prot opt in     out     source               destination
>      4   240 CT         tcp  --  br0    *       0.0.0.0/0            0.0.0.0/0            tcp dpt:81 flags:0x17/0x02 CT notrack
>
> root@firewall:~# iptables  -L INPUT -v -n
> Chain INPUT (policy DROP 0 packets, 0 bytes)
>   pkts bytes target     prot opt in     out     source               destination
>    247  164K ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
>    587  219K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
>      3   180 SYNPROXY   tcp  --  br0    *       0.0.0.0/0            0.0.0.0/0            tcp dpt:81 ctstate INVALID,UNTRACKED SYNPROXY sack-perm timestamp wscale 7 mss 1323
>     22  1000 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
>
> but also tcpdump confirm no SYN+ACK exit to the client:
>
>
> root@firewall:~# tcpdump -n -i br0 port 81
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on br0, link-type EN10MB (Ethernet), capture size 262144 bytes
>
>
> 14:39:32.755800 IP 10.0.1.18.32886 > 10.0.1.51.81: Flags [S], seq 521240151, win 29200, options [mss 1323,sackOK,TS val 2209244648 ecr 0,nop,wscale 7], length 0
> 14:39:33.784981 IP 10.0.1.18.32886 > 10.0.1.51.81: Flags [S], seq 521240151, win 29200, options [mss 1323,sackOK,TS val 2209245678 ecr 0,nop,wscale 7], length 0
>
>
> Values for the SYNPROXY are derived from tcpdump:
>
> root@firewall:~# tcpdump -pni br0 port 81
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on br0, link-type EN10MB (Ethernet), capture size 262144 bytes
> 14:46:49.704573 IP 10.0.1.18.32922 > 10.0.1.51.81: Flags [S], seq 60519528, win 29200, options [mss 1323,sackOK,TS val 2209681605 ecr 0,nop,wscale 7], length 0
> 14:46:50.704828 IP 10.0.1.18.32922 > 10.0.1.51.81: Flags [S], seq 60519528, win 29200, options [mss 1323,sackOK,TS val 2209682606 ecr 0,nop,wscale 7], length 0
> ^C
>
> The same thing happen on every interface I'm trying ( eth0 eth1 eth2 ) so it's not a problem on bridged interface
>
> If I remove the SYNPROXY rules, everything works:
>
>
> other_host# telnet 10.0.1.51 81
> Trying 10.0.1.51...
> Connected to 10.0.1.51.
> Escape character is '^]'.
> ^]
> telnet> c
> Connection closed.
>
> root@firewall:~# tcpdump -n -i br0 port 81
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on br0, link-type EN10MB (Ethernet), capture size 262144 bytes
> 14:49:00.998297 IP 10.0.1.18.32934 > 10.0.1.51.81: Flags [S], seq 1887031231, win 29200, options [mss 1323,sackOK,TS val 2209812901 ecr 0,nop,wscale 7], length 0
> 14:49:00.998517 IP 10.0.1.51.81 > 10.0.1.18.32934: Flags [S.], seq 3980734030, ack 1887031232, win 28960, options [mss 1460,sackOK,TS val 288190452 ecr 2209812901,nop,wscale 7], length 0
> 14:49:01.006907 IP 10.0.1.18.32934 > 10.0.1.51.81: Flags [.], ack 1, win 229, options [nop,nop,TS val 2209812910 ecr 288190452], length 0
>
>
> sysctl stuffs should be fine:
>
> net.netfilter.nf_conntrack_tcp_loose = 0
> net.ipv4.tcp_timestamps = 1
> net.ipv4.conf.default.rp_filter = 1
>
> Kernel is ( almost ) new one
>
> root@firewall:~# uname -a
> Linux firewall.frumar.it 4.19.81-v7+ #1 SMP Sat Nov 2 00:21:44 CET 2019 armv7l BCM2835 GNU/Linux
>
>
> ipt_SYNPROXY is loaded:
>
> root@firewall:~# lsmod | grep SYN
> ipt_SYNPROXY           16384  0
> nf_synproxy_core       16384  1 ipt_SYNPROXY
> x_tables               32768  16 xt_state,xt_LOG,xt_multiport,xt_owner,xt_nat,ipt_SYNPROXY,iptable_mangle,ip_tables,iptable_filter,xt_string,xt_tcpudp,iptable_raw,xt_recent,xt_connlimit,xt_CT,xt_conntrack
> nf_conntrack          135168  12 xt_state,nf_conncount,xt_nat,ipt_SYNPROXY,nf_conntrack_ftp,nf_nat_ftp,xt_connlimit,xt_CT,xt_conntrack,nf_synproxy_core,nf_nat_ipv4,nf_nat
>
>
> Also TRACE shows that the SYNPROXY get triggered:
>
> root@firewall# iptables -t raw -L -v -n
> Chain PREROUTING (policy ACCEPT 915 packets, 358K bytes)
> num   pkts bytes target     prot opt in     out     source               destination
> 1        2   120 TRACE      tcp  --  br0    *       0.0.0.0/0            0.0.0.0/0            tcp dpt:82
> 2        2   120 CT         tcp  --  br0    *       0.0.0.0/0            0.0.0.0/0            tcp dpt:82 flags:0x17/0x02 CT notrack
>
> Chain OUTPUT (policy ACCEPT 407 packets, 259K bytes)
> num   pkts bytes target     prot opt in     out     source               destination
>
>
> root@firewall# iptables -L INPUT -v -n
> Chain INPUT (policy DROP 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source               destination
> 1       78 81472 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
> 2      358  103K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
> 3        2   120 SYNPROXY   tcp  --  br0    *       0.0.0.0/0            0.0.0.0/0            tcp dpt:82 state INVALID,UNTRACKED SYNPROXY sack-perm timestamp wscale 7 mss 1460
> 4       11   452 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            state INVALID
> 5        0     0 ACCEPT     tcp  --  *      *       10.0.1.18            10.0.1.51            tcp dpt:82  /* Ntp da dmz
> ...
> ...
>
> And from the logs:
>
> raw:PREROUTING:rule:2      IN=br0 OUT= SRC=10.0.1.18 DST=10.0.1.51 ID=36524 DF PROTO=TCP SPT=53404 DPT=82 SEQ=3633093572 ACK=0 WINDOW=29200 RES=0x00
> raw:PREROUTING:policy:3    IN=br0 OUT= SRC=10.0.1.18 DST=10.0.1.51 ID=36524 DF PROTO=TCP SPT=53404 DPT=82 SEQ=3633093572 ACK=0 WINDOW=29200 RES=0x00
> mangle:PREROUTING:policy:1 IN=br0 OUT= SRC=10.0.1.18 DST=10.0.1.51 ID=36524 DF PROTO=TCP SPT=53404 DPT=82 SEQ=3633093572 ACK=0 WINDOW=29200 RES=0x00
> mangle:INPUT:policy:1      IN=br0 OUT= SRC=10.0.1.18 DST=10.0.1.51 ID=36524 DF PROTO=TCP SPT=53404 DPT=82 SEQ=3633093572 ACK=0 WINDOW=29200 RES=0x00
> filter:INPUT:rule:3        IN=br0 OUT= SRC=10.0.1.18 DST=10.0.1.51 ID=36524 DF PROTO=TCP SPT=53404 DPT=82 SEQ=3633093572 ACK=0 WINDOW=29200 RES=0x00
>
> As you can see, the packet get caught in rule 2 of raw table, PREEROUTING chain:
> 2        2   120 CT         tcp  --  br0    *       0.0.0.0/0            0.0.0.0/0            tcp dpt:82 flags:0x17/0x02 CT
>
> then from rule 3 of the filter table, INPUT chain
> 3        2   120 SYNPROXY   tcp  --  br0    *       0.0.0.0/0            0.0.0.0/0            tcp dpt:82 state INVALID,UNTRACKED SYNPROXY sack-perm timestamp wscale 7 mss 1460
>
> but ( as already told ) no syn+ack goes out.
>
>
> Any idea on what to check ?
>
>
> Thx, and apologize for my bad english.
>
>
> Pierluigi
