From: gabrix <gabrix@gabrix.ath.cx>
Subject: my script !
Date: Thu, 26 Oct 2006 22:29:14 +0200
Message-ID: <45411A9A.6080509@gabrix.ath.cx>
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
To: netfilter <netfilter@lists.netfilter.org>

I would like your opinion on my firewall script.I will also list all
services avialable on each machine in lan and how lan is configured...
keep tight !!!
my lan :
[router-netgear]
|
|
|
[Linuxbox-2eth__firewall_debian_sarge3.1kernel 2.6]
|
|
|[switch8ports]
|
|
|
[1debianbox_courier-pop-popssl-postfix-webserver]
[2debianbox_samba_nfs_proftpd_ircd_webserver]
[3windows_emule]

firewall on linuxbox:

> #!/bin/bash -x
>
>
> #LOAD mODULES
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
> modprobe ip_conntrack_irc
> modprobe ip_nat_irc
>
> # ALCUNE VARIABILI PER INIZIARE
> NET1=192.168.0.0/16
> NET2=192.168.0.0/30
> NET3=192.168.1.0/29
> NET4=192.168.1.0/24
> ROUT=192.168.0.1/32
> ARG0=192.168.0.2/32
> ARG1=192.168.1.1/32
> WWW=192.168.1.4/32
> MAIL=192.168.6/32
> MAC=192.168.0.3/32
> DNS1=85.37.17.11/32
> DNS2=85.38.28.69/32
> IPT=/sbin/iptables
> IF0=eth0
> IF1=eth1
>
> # FLUSH
> echo "0" > /proc/sys/net/ipv4/ip_forward
>
> $IPT -P INPUT ACCEPT
> $IPT -P FORWARD ACCEPT
> $IPT -P OUTPUT ACCEPT
> $IPT -t nat -P PREROUTING ACCEPT
> $IPT -t nat -P POSTROUTING ACCEPT
> $IPT -t nat -P OUTPUT ACCEPT
> $IPT -t mangle -P PREROUTING ACCEPT
> $IPT -t mangle -P POSTROUTING ACCEPT
> $IPT -t mangle -P INPUT ACCEPT
> $IPT -t mangle -P OUTPUT ACCEPT
> $IPT -t mangle -P FORWARD ACCEPT
> $IPT -F
> $IPT -t nat -F
> $IPT -t mangle -F
> $IPT -X
> $IPT -t nat -X
> $IPT -t mangle -X
>
> # DEFAULTS
> $IPT -P INPUT DROP
> $IPT -P OUTPUT DROP
> $IPT -P FORWARD DROP
> $IPT -t mangle -P PREROUTING ACCEPT
> $IPT -t mangle -P OUTPUT ACCEPT
> $IPT -t nat -P PREROUTING ACCEPT
> $IPT -t nat -P POSTROUTING ACCEPT
> $IPT -t nat -P OUTPUT ACCEPT
>
>
> # FREE_LOCALHOST
> $IPT -A INPUT -j ACCEPT -i lo
> $IPT -A INPUT -j ULOG --ulog-prefix "LOCAL_SPOOF:" -i ! lo -s
> 127.0.0.1/255.0.0.0
> $IPT -A INPUT -j DROP -i ! lo -s 127.0.0.1/255.0.0.0
> $IPT -A OUTPUT -j ACCEPT -o lo
>
>
> # LAN eth0
> $IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> $IPT -A INPUT -i $IF0 -s $NET2 -j ACCEPT
> $IPT -A INPUT -i $IF0 -s $MAC -j ACCEPT
> $IPT -A INPUT -i $IF0 -s $NET1 -j ULOG --ulog-prefix " ### ETH0__SPOOF:"
> $IPT -A INPUT -i $IF0 -s $NET1 -j DROP
>
> # LAN eth1
> $IPT -A INPUT -i eth1 -s 192.168.1.0/29 -j ACCEPT
>
> ##
> WW=135,136,137,138,139,445
> $IPT -t nat -I PREROUTING -p tcp -i $IF0 -d $ARG0 -m multiport --dport
> $WW -j DROP
> $IPT -t nat -I PREROUTING -p udp -i $IF0 -d $ARG0 -m multiport --dport
> $WW -j DROP
>
> # MSSQL
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp --dport 1433:1434 -m limit -j
> ULOG --ulog-prefix "Firewalled packet: MSSQL "
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp --dport 1433:1434 -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p udp --dport 1433:1434 -m limit -j
> ULOG --ulog-prefix "Firewalled packet: MSSQL "
> $IPT -t nat -I PREROUTING -i $IF0 -p udp --dport 1433:1434 -j DROP
>
> # Traceroutes depend on finding a rejected port.  DROP the ones it uses
> $IPT -t nat -I PREROUTING -i eth0 -p udp --dport 33434:33523 -j ULOG
> --ulog-prefix "TRACEROUTE_UDP:"
> $IPT -t nat -I PREROUTING -i eth0 -p udp --dport 33434:33523 -j DROP
>
>
> # GNUTELLA NETWORK
> $IPT -t nat -I PREROUTING -i $IF0 -p udp --dport 6346:6348 -d $NET2 -j
> DROP
>
> # PORTS_BLACK_LIST
> PBL=1024,1025,1026,1027,33058,34120,40193
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 -m multiport
> --dports $PBL -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p udp -d $NET2 -m multiport
> --dports $PBL -j DROP
>
> # UDP Traceroute
> $IPT -t nat -I PREROUTING -i $IF0 -p udp -d 192.168.0.0/16 --dport
> 33434:33523 -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p udp -d 192.168.0.0/16 --dport
> 33434:33523 -j ULOG --ulog-prefix "UDP_TRACEROUTES :"
>
>
> #-----------------------------------------------------------------------------------#
> #                                  ICMP
> TYPES                                       #
> #-----------------------------------------------------------------------------------#
> #                                                                                  
> #
> #    0 = Echo Reply, what gets sent back after a type 8 is received
> here            #
> #    3 = Destination Unreachable (inbound) or Fragmentation Needed
> (out) [RFC792]   #
> #    4 = Source Quench tells sending IP to slow down its rate to
> destination        #
> #    5 = Redirect
> [RFC792]                                                          #
> #    6 = Alternate Host
> Address                                                     #
> #    8 = Echo Request used for pinging hosts, but see the note
> above                #
> #    9 = Router Advertisement
> [RFC1256]                                             #
> #   10 = Router Selection
> [RFC1256]                                                 #
> #   11 = Time Exceeded used for traceroute (TTL) or sometimes frag
> packets          #
> #   12 = Parameter Problem is some error or weirdness detected in
> header            #
> #   13 = Timestamp 
> [RFC792]                                                        #
> #   14 = Timestamp Reply 
> [RFC792]                                                  #
> #   15 = Information Request 
> [RFC792]                                              #
> #   16 = Information Reply 
> [RFC792]                                                #
> #   17 = Address Mask Request 
> [RFC950]                                             #
> #   18 = Address Mask Reply 
> [RFC950]                                               #
> #   30 = Traceroute 
> [RFC1393]                                                      #
> #                                                                                  
> #
> #-----------------------------------------------------------------------------------#
>
> # ICMP
> $IPT -t nat -I PREROUTING -i $IF0 -p icmp -d $NET1 -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p icmp --icmp-type 0 -m limit
> --limit 3/s -d $NET1 -j ACCEPT
> $IPT -t nat -I PREROUTING -i $IF0 -p icmp --icmp-type 3 -m limit
> --limit 3/s -d $NET1 -j ACCEPT
>
> # CHECK_FLAGS
> $IPT -t nat -I PREROUTING -i $IF0 -f -d $NET2 -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -f -d $NET2 -j ULOG --ulog-prefix
> "FRAGMENTS:"
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 -m state --state
> INVALID -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 -m state --state
> INVALID -j ULOG --ulog-prefix "INVALID_FLAGS:"
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags ALL
> FIN,URG,PSH -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags ALL
> FIN,URG,PSH -m limit --limit 3/s -j ULOG --ulog-prefix "NMAP-XMAS_SCAN:"
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags SYN,RST
> SYN,RST -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags SYN,RST
> SYN,RST -m limit --limit 3/s -j ULOG --ulog-prefix "SYN/RST_SCAN: "
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags SYN,FIN
> SYN,FIN -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags SYN,FIN
> SYN,FIN -m limit --limit 3/s -j ULOG --ulog-prefix "SYN/FIN_SCAN: "
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags ALL FIN
> -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags ALL FIN
> -m limit --limit 3/s -j ULOG --ulog-prefix "FIN_SCAN:"
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags ALL ALL
> -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags ALL ALL
> -m limit --limit 3/s -j ULOG --ulog-prefix "ALL/ALL__SCAN : "
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags ALL NONE
> -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -p tcp -d $NET2 --tcp-flags ALL NONE
> -m limit --limit 3/s -j ULOG --ulog-prefix "NULL_SCAN: "
>
>
> # _____________ANTISPOOF
>
> cat /home/gabrix/bogon-bn-nonagg.txt |\
> egrep -ve
> "(^127\.|^192\.168\.|^41\.|^73\.|^76\.|^89\.|^90\.|^121\.|^122\.|^123\.\
> |^124\.|^125\.|^126\.|^189\.| ^190\.)"|while read s; do
> $IPT -t nat -I PREROUTING -i $IF0 -s $s -j DROP
> $IPT -t nat -I PREROUTING -i $IF0 -s $s -j ULOG --ulog-prefix
> 'BOGON_SPOOF:'
> done
>
> # Make laptop get into LAN
> #echo
> "-----------------------------------------------------------------------------------------------------"
> #$IPT -t nat -A PREROUTING -i eth0 -p ALL -s 192.168.0.3/32 -d
> 192.168.1.0/24 -j DNAT --to-dest 192.168.1.1
>  
>
> # PREROUTING DNAT ################################# -------------------- >
> # HTTP & HTTPS per .... www.gabrix.ath.cx
> /sbin/iptables -t nat -I PREROUTING -p tcp -i eth0 --dport 80 -d
> 192.168.0.2/32 -j DNAT --to 192.168.1.4:80
> /sbin/iptables -t nat -I PREROUTING -p tcp -i eth0 --dport 443 -d
> 192.168.0.2/32 -j DNAT --to 192.168.1.4:443
> # HTTP ... per .... mail.gabrix.ath.cx
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 --dport 80 -m state --state
> NEW -d 192.168.0.2/32 -j DNAT --to 192.168.1.6:80
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 --dport 443 -m state --state
> NEW -d 192.168.0.2/32 -j DNAT --to 192.168.1.6:443
>
>
>
> # SMTP
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d 192.168.0.2/32 --dport 25
> -j DNAT --to 192.168.1.6:25
>
>
> # INN
> #$IPT -t nat -A PREROUTING -i eth0 -p tcp -d 192.168.0.2/32 --dport
> 119 -j DNAT --to 192.168.1.4:119
>
>
> # IRCD
> IRC=6664:6669
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d 192.168.0.2/32 --dport
> $IRC -j DNAT --to 192.168.1.4:6664-6669
> $IPT -t nat -A PREROUTING -p udp -i $IF0 -d 192.168.0.2/32 --dport
> 32768 -j DNAT --to 192.168.1.4:32768
>
>
> # FTP
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d 192.168.0.2/32 --dport 20
> -j DNAT --to 192.168.1.4:20
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d 192.168.0.2/32 --dport 21
> -j DNAT --to 192.168.1.4:21
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d 192.168.0.2/32 --dport
> 60000:65535 -m state --state ESTABLISHED,RELATED -j DNAT --to
> 192.168.1.4:60000-65534
>
>
> # POP-SSL
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d 192.168.0.2/32 --dport 995
> -j DNAT --to 192.168.1.6:995
> $IPT -t nat -A PREROUTING -p udp -i $IF0 -d 192.168.0.2/32 --dport 995
> -j DNAT --to 192.168.1.6:995
>
>
> # TIM --- DNS
> $IPT -t nat -A PREROUTING -p ALL -i $IF0 -s $DNS1 -d $ARG0 -j DNAT
> --to 192.168.1.6
> $IPT -t nat -A PREROUTING -p ALL -i $IF0 -s $DNS2 -d $ARG0 -j DNAT
> --to 192.168.1.6
>
> #  PROXY
> #$IPT -t nat -I PREROUTING -i $IF1 -p tcp -s $NET3 --dport 80 -j DNAT
> --to 192.168.1.1:8888
>
> # EMULE
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d 192.168.0.2/32 --dport
> 18744 -j DNAT --to 192.168.1.2:18744
> $IPT -t nat -A PREROUTING -p udp -i $IF0 -d 192.168.0.2/32 --dport
> 57692 -j DNAT --to 192.168.1.2:57692
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d 192.168.0.2/32 --dport
> 4711 -j DNAT --to 192.168.1.2:4711
> $IPT -t nat -A PREROUTING -p udp -i $IF0 -d 192.168.0.2/32 --dport
> 4672 -j DNAT --to 192.168.1.2:4672
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d 192.168.0.2/32 --dport
> 4661:4662 -j DNAT --to 192.168.1.2:4661-4662
>
> ##########################################################################################
> #                    INPUT    ARGO      
> SERVICES                                        #
> ##########################################################################################
> # I want broadcats to reach only machines in lan and avoid packets to
> go out in the internet and other #machines
>
> # BROADCASTS
> # ETH0
> $IPT -A INPUT -i $IF0 -d 255.255.255.255/32 -j ULOG --ulog-prefix
> "NET_BROADCASTS:"
> $IPT -A INPUT -i $IF0 -d 255.255.255.255/32 -j DROP
>
> # ETH1
> $IPT -A INPUT -i $IF1 -j ACCEPT -s 192.168.1.0/29 -d 192.168.1.255/29
> $IPT -A INPUT -i $IF1 -j ULOG --ulog-prefix "LAN_BROADCASTS:" -s
> 192.168.1.0/29 -d 192.168.1.255/32
> $IPT -A INPUT -i $IF1 -j DROP -s 192.168.1.0/29 -d 192.168.1.255/32
>
> $IPT -A INPUT -i $IF1 -j ACCEPT -s 192.168.1.0/29 -d 255.255.255.255/29
> $IPT -A INPUT -i $IF1 -j ULOG --ulog-prefix "LAN_NBIOS_BROADCASTS:" -s
> 192.168.1.0/29 -d 255.255.255.255/32
> $IPT -A INPUT -i $IF1 -j DROP -s 192.168.1.0/29 -d 255.255.255.255/32
>
> # MULTICASTS
> $IPT -A INPUT -i $IF0 -j DROP -m state --state NEW -d 224.0.0.0/4 -p ! 6
>
> # INPUT ARGO_SERVICES -----------------------------------------
> # TOR
> $IPT -t nat -A PREROUTING -i $IF0 -p tcp --dport 22 -j REDIRECT
> --to-port 9090
> $IPT -t nat -A PREROUTING -i $IF0 -p tcp --dport 110 -j REDIRECT
> --to-port 9091
> $IPT -A INPUT -i eth0 -p tcp -d 192.168.0.2/32 --dport 9090 -j ACCEPT
> $IPT -A INPUT -i eth0 -p tcp -d 192.168.0.2/32 --dport 9091 -j ACCEPT
>
>
> # Accetto SSH e prevengo bruteforces
> $IPT -A INPUT -i eth0 -p tcp --dport 666 -d 192.168.0.2/32 -m recent
> --update --seconds 60 --hitcount 4 --rttl --name SSH -j ULOG
> --ulog-prefix "SSH_BRUTEFORCE:"
> $IPT -A INPUT -i eth0 -p tcp --dport 666 -d 192.168.0.2/32 -m state
> --state NEW -m recent --set --name SSH -j ACCEPT
>
>
> # TIM_DNS
> $IPT -A INPUT -i eth0 -s $DNS1 -d $ARG0 -j ACCEPT
> $IPT -A INPUT -i eth0 -s $DNS2 -d $ARG0 -j ACCEPT
>
> # DROP Anything else
> $IPT -A INPUT -i $IF0 -p tcp --dport 1:65535 -d $ARG0 -j ULOG
> --ulog-prefix "TCP:"
> $IPT -A INPUT -i $IF0 -p tcp --dport 1:65535 -d $ARG0 -j DROP
> $IPT -A INPUT -i $IF0 -p udp --dport 1:65535 -d $ARG0 -j ULOG
> --ulog-prefix "UDP:"
> $IPT -A INPUT -i $IF0 -p udp --dport 1:65535 -d $ARG0 -j DROP
> $IPT -A INPUT -i $IF0 -p ALL -d $ARG0 -j ULOG --ulog-prefix "#######|
> STOP_ALL_ |######:"
> $IPT -A INPUT -i $IF0 -p ALL -d $ARG0 -j DROP
>
>
> # FORWARD
> #
>
> # 192.168.0.0 NETWORK
> $IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> $IPT -A FORWARD -i eth0 -o eth1 -s 192.168.0.3 -d 192.168.1.0/29 -j ACCEPT
> $IPT -A FORWARD -i eth0 -o eth1 -s $ARG0 -d $NET3 -j ACCEPT
> $IPT -A FORWARD -i eth0 -o eth1 -s $ROUT -d $NET3 -j ACCEPT
> $IPT -A FORWARD -i eth0 -o eth1 -s $NET1 -d $NET4 -j ULOG
> --ulog-prefix "Forward_SPOOF:"
> $IPT -A FORWARD -i eth0 -o eth1 -s $NET1 -d $NET4 -j DROP
>
> # LAN
> $IPT -A FORWARD -i eth1 -o eth0 -s 192.168.1.0/24 -j ACCEPT
>
>
> # # Services FORWARD-------->
>
> # TIM DNS
> $IPT -A FORWARD -s $DNS1 -d 192.168.1.0/24 -j ACCEPT
> $IPT -A FORWARD -s $DNS2 -d 192.168.1.0/24 -j ACCEPT
>  
>
> # FTP
> $IPT -A FORWARD -i eth0 -o eth1 -p tcp -d 192.168.1.4 --dport 20 -j ACCEPT
> $IPT -A FORWARD -i eth0 -o eth1 -p tcp -d 192.168.1.4 --dport 21 -j ACCEPT
> $IPT -A FORWARD -i eth0 -o eth1 -p tcp -d 192.168.1.4 --dport
> 60000:65534 -j ACCEPT
>
>
> # INN
> #$IPT -A FORWARD -i eth0 -o eth1 -p tcp --dport 119 -d 192.168.1.4 -j
> ACCEPT
>  
>
> # SMTP
> $IPT -A FORWARD -i eth0 -o eth1 -p tcp --dport 25 -d 192.168.1.6 -j ACCEPT
>
>
> # IRCD
> IRC=6665:6669
> $IPT -A FORWARD -i eth0 -p tcp --dport $IRC -d 192.168.1.4/32 -j ACCEPT
> $IPT -A FORWARD -i eth0 -p udp --dport 32768 -d 192.168.1.4/32 -j ACCEPT
>
>
> # HTTP
> $IPT -A FORWARD -i eth0 -o eth1 -p tcp --dport 80 -d 192.168.1.4 -j ACCEPT
> $IPT -A FORWARD -i eth0 -o eth1 -p tcp --dport 443 -d 192.168.1.4 -j
> ACCEPT
> $IPT -A FORWARD -i eth0 -o eth1 -p tcp --dport 80 -d 192.168.1.6 -j ACCEPT
> $IPT -A FORWARD -i eth0 -o eth1 -p tcp --dport 443 -d 192.168.1.6 -j
> ACCEPT
>
>
> # POP SSL
> $IPT -A FORWARD -i eth0 -p tcp --dport 995 -d 192.168.1.6 -j ACCEPT
> $IPT -A FORWARD -i eth0 -p udp --dport 995 -d 192.168.1.6 -j ACCEPT
>
> # EMULE
> $IPT -A FORWARD -p tcp -i $IF0 --dport 18744 -d 192.168.1.2 -j ACCEPT
> $IPT -A FORWARD -p udp -i $IF0 --dport 57692 -d 192.168.1.2 -j ACCEPT
> $IPT -A FORWARD -p tcp -i $IF0 --dport 4711 -d 192.168.1.2 -j ACCEPT
> $IPT -A FORWARD -p udp -i $IF0 --dport 4672 -d 192.168.1.2 -j ACCEPT
> $IPT -A FORWARD -p tcp -i $IF0 --dport 4661:4662 -d 192.168.1.2 -j ACCEPT
>
> # OUTPUT
> $IPT -A OUTPUT -o eth0 -s 192.168.0.2/32 -j ACCEPT
> $IPT -A OUTPUT -j ACCEPT -o eth1 -d 192.168.1.0/24
> $IPT -A OUTPUT -s 192.168.0.0/16 -j ACCEPT
> $IPT -A OUTPUT -s 192.168.1.0/24 -j ACCEPT
>
> $IPT -A OUTPUT -p icmp --icmp-type time-exceeded -j DROP
> $IPT -A OUTPUT -p icmp --icmp-type 0 -j DROP
>
> # MASQUERADE
> $IPT -t nat -A POSTROUTING -o eth0 -s 192.168.1.0/24 -j MASQUERADE
>
> echo "1" > /proc/sys/net/ipv4/ip_forward
>
If you have question just ask .... thanks !!!

