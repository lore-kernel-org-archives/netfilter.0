From: Krunk <krunkalot@hotpop.com>
Subject: Curious problem with my iptable rules.....detailed post inside,
	help appreciated.
Date: Fri, 16 Apr 2004 18:35:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082158518.4759.40.camel@james>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Setup: 
I have one external NIC (ppp0) and two internal NIC's (eth1, eth2). I
also have two rule sets. The first a bare minimum "get it up and going
script" I used for testing and my main rule set. 

Problem: 
After a fresh start-up if I initialize my basic rule set everything
works perfectly. If I than initialize my main rule set (which deletes
all chains and flushes all rules) it still works perfectly. However if I
initialize my main script first. eth1 can access the internet, but eth2
cannot. All internal connections are still up everyone can ping everyone
else, etc., etc. Even odder is if I clear all rules and Policies and
delete all chains than load the bare minimum script, it doesn't work
either. The only thing I've found is to do a hard reboot (which makes me
get that funny feeling like I've done something sacreligious, hehe),
load the minimum and than load the main script. 

I would very much appreciate if anyone could troubleshoot my scripts. 

Thanks in advance.

#######Begin minimum script ########
 1 #!/bin/bash
      2 IPTABLES='/sbin/iptables'
      3
      4 # Set interface values
      5 EXTIF='ppp0'
      6 INTIF1='eth1'
      7 INTIF2='eth2'
      8
      9 # enable ip forwarding in the kernel
     10 /bin/echo 1 > /proc/sys/net/ipv4/ip_forward
     11
     12 # flush rules and delete chains
     13 iptables -F
     14 iptables -X
     15
     16 # enable masquerading to allow LAN internet access
     17 $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
     18
     19 # forward LAN traffic from $INTIF1 to Internet interface $EXTIF
     20 $IPTABLES -A FORWARD -i $INTIF1 -o $EXTIF -m state --state NEW,ESTABLISHED -j ACCEPT
     21
     22 # forward LAN traffic from $INTIF2 to Internet interace $EXTIF
     23 $IPTABLES -A FORWARD -i $INTIF2 -o $EXTIF -m state --state NEW,ESTABLISHED -j ACCEPT
     24
     25 #echo -e "       - Allowing access to the SSH server"
     26 $IPTABLES -A INPUT --protocol tcp --dport 22 -j ACCEPT
     27
     28 #echo -e "       - Allowing access to the HTTP server"
     29 $IPTABLES -A INPUT --protocol tcp --dport 80 -j ACCEPT
     30
     31 # block out all other Internet access on $EXTIF
     32 $IPTABLES -A INPUT -i $EXTIF -m state --state NEW,INVALID -j DROP
     33 $IPTABLES -A FORWARD -i $EXTIF -m state --state NEW,INVALID -j DROP

########Begin Main Script########
 1 #!/bin/bash
      2 # rc.fwsoho: SOHO IP Tables rule set
      3 # Copyright 2003 Bob Toxen.  All rights reserved.
      4 # See book "Real World Linux Security 2nd ed" for terms of use
      5
      6 # uncomment to output all commands executed
      7 #set -v
      8
      9 # External interface
     10 EXTIF=ppp0
     11 # Internal interface
     12 INTIF1=eth1
     13 INTIF2=eth2
     14
     15 # Loop device/localhost
     16 LPDIF=lo
     17 LPDIP=127.0.0.1
     18 LPDMSK=255.0.0.0
     19 LPDNET="$LPDIP/$LPDMSK"
     20
     21 # Text tools variables
     22 IPT='/sbin/iptables'
     23 IFC='/sbin/ifconfig'
     24 G='/bin/grep'
     25 SED='/bin/sed'
     26
     27 # Last but not least, the users
     28
     29 # Deny than accept: this keeps holes from opening up
     30 # while we close ports and such
     31
     32 $IPT        -P INPUT       DROP
     33 $IPT        -P OUTPUT      DROP
     34 $IPT        -P FORWARD     DROP
     35
     36 $IPT -t nat -P PREROUTING  DROP
     37 $IPT -t nat -P POSTROUTING DROP
     38 $IPT -t nat -P OUTPUT      DROP
     39
     40 # Flush all existing chains and erase personal chains
     41 CHAINS=`cat /proc/net/ip_tables_names 2>/dev/null`
     42 for i in $CHAINS;
     43 do
     44     $IPT -t $i -F
     45 done
     46
     47 for i in $CHAINS;
     48 do
     49     $IPT -t $i -X
     50 done
     51
     52 echo 1 > /proc/sys/net/ipv4/tcp_syncookies
     53 echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
  54
     55 # Source Address Verification
     56 for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
     57         echo 1 > $f
     58 done
     59 # Disable IP source routing and ICMP redirects
     60 for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
     61         echo 0 > $f
     62 done
     63 for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
     64         echo 0 > $f
     65 done
     66
     67 echo 1 > /proc/sys/net/ipv4/ip_forward
     68
     69
     70 # Setting up external interface environment variables
     71 EXTIP="`$IFC $EXTIF|$G addr:|$SED 's/.*addr:\([^ ]*\) .*/\1/'`"
     72 #EXTBC="`$IFC $EXTIF|$G Bcast:|$SED 's/.*Bcast:\([^ ]*\) .*/\1/'`"
     73 EXTBC="255.255.255.255"
     74 EXTMSK="`$IFC $EXTIF|$G Mask:|$SED 's/.*Mask:\([^ ]*\)/\1/'`"
     75 EXTNET="$EXTIP/$EXTMSK"
     76 echo "EXTIP=$EXTIP EXTBC=$EXTBC EXTMSK=$EXTMSK EXTNET=$EXTNET"
     77
     78 # Due to absence of EXTBC I manually set it to 255.255.255.255
     79 # this (hopefully) will server the same purpose
     80
     81
     82 # Setting up environment variables for internal interface one
     83 INTIP1="`$IFC $INTIF1|$G addr:|$SED 's/.*addr:\([^ ]*\) .*/\1/'`"
     84 INTBC1="`$IFC $INTIF1|$G Bcast:|$SED 's/.*Bcast:\([^ ]*\) .*/\1/'`"
     85 INTMSK1="`$IFC $INTIF1|$G Mask:|$SED 's/.*Mask:\([^ ]*\)/\1/'`"
     86 INTNET1="$INTIP1/$INTMSK1"
     87 echo "INTIP1=$INTIP1 INTBC1=$INTBC1 INTMSK1=$INTMSK1 INTNET1=$INTNET1"
     88
     89 #Setting up environment variables for internal interface two
     90 INTIP2="`$IFC $INTIF2|$G addr:|$SED 's/.*addr:\([^ ]*\) .*/\1/'`"
     91 INTBC2="`$IFC $INTIF2|$G Bcast:|$SED 's/.*Bcast:\([^ ]*\) .*/\1/'`"
     92 INTMSK2="`$IFC $INTIF2|$G Mask:|$SED 's/.*Mask:\([^ ]*\)/\1/'`"
     93 INTNET2="$INTIP2/$INTMSK2"
     94 echo "INTIP2=$INTIP2 INTBC2=$INTBC2 INTMSK2=$INTMSK2 INTNET2=$INTNET2"
     95
     96 #INITIP="$INTIP1 $INTIP2"
     97 #INTBC="$INTBC1 $INTBC2"
     98 #INTMSK="$INTMSK1 $INTMSK2"
     99 #INTNET="$INTNET1 $INTNET2"
    100
    101 # We are now going to create a few custom chains that will result in
    102 # logging of dropped packets. This will enable us to avoid having to
    103 # enter a log command prior to every drop we wish to log. The
    104 # first will be first log drops the other will log rejects.
    105
    106 # Do not complain if chain already exists (so restart is clean)
       106 # Do not complain if chain already exists (so restart is clean)
    107 $IPT -N DROPl   2> /dev/null
    108 $IPT -A DROPl   -j LOG --log-prefix 'DROPl:'
    109 $IPT -A DROPl   -j DROP
    110
    111 $IPT -N REJECTl 2> /dev/null
    112 $IPT -A REJECTl -j LOG --log-prefix 'REJECTl:'
    113 $IPT -A REJECTl -j REJECT
    114
    115 # Now we are going to accept all traffic from our loopback device
    116 # if the IP matches any of our interfaces.
    117
    118 $IPT -A INPUT   -i $LPDIF -s   $LPDIP  -j ACCEPT
    119 $IPT -A INPUT   -i $LPDIF -s   $EXTIP  -j ACCEPT
    120 $IPT -A INPUT   -i $LPDIF -s   $INTIP1  -j ACCEPT
    121 $IPT -A INPUT   -i $LPDIF -s   $INTIP2  -j ACCEPT
    122
    123 # Added to enable cups management: lo to lo communication
    124 $IPT -A OUTPUT  -o $LPDIF -d $LPDIP  -j ACCEPT
    125 $IPT -A INPUT   -i $LPDIF -s $LPDIP  -j ACCEPT
    126
    127 # Blocking Broadcasts
    128 $IPT -A INPUT   -i $EXTIF   -d   $EXTBC     -j DROPl
    129 $IPT -A INPUT   -i $INTIF1  -d   $INTBC1    -j DROPl
    130 $IPT -A INPUT   -i $INTIF2  -d   $INTBC2    -j DROPl
    131 $IPT -A OUTPUT  -o $EXTIF   -d   $EXTBC     -j DROPl
    132 $IPT -A OUTPUT  -o $INTIF1  -d   $INTBC1    -j DROPl
    133 $IPT -A OUTPUT  -o $INTIF2  -d   $INTBC2    -j DROPl
    134 $IPT -A FORWARD -o $EXTIF   -d   $EXTBC     -j DROPl
    135 $IPT -A FORWARD -o $INTIF1  -d   $INTBC1    -j DROPl
    136 $IPT -A FORWARD -o $INTIF2  -d   $INTBC2    -j DROPl
    137
    138 # Block WAN access to internal network
    139 # This also stops nefarious crackers from using our network as a
    140 # launching point to attack other people
    141 # iptables translation:
    142 # "if input going into  our external interface does not originate from our isp assigned
    143 # ip address, drop it like a hot potato
    144
    145 $IPT -A INPUT   -i $EXTIF -d ! $EXTIP  -j DROPl
    146
    147 # Now we will block internal addresses originating from anything but our
    148 # two predefined interfaces.....just remember that if you jack your
    149 # your laptop or another pc into one of these NIC's directly, you'll need
    150 # to ensure that they either have the same ip or that you add a line explicitly
    151 # that IP as well
    152
    153 # Interface one/internal net one
    154 $IPT -A INPUT   -i $INTIF1 -s ! $INTNET1 -j DROPl
    155 $IPT -A OUTPUT  -o $INTIF1 -d ! $INTNET1 -j DROPl
    156 $IPT -A FORWARD -i $INTIF1 -s ! $INTNET1 -j DROPl
    157 $IPT -A FORWARD -o $INTIF1 -d ! $INTNET1 -j DROPl
    158
         159 # Interface two/internal net two
    160 $IPT -A INPUT   -i $INTIF2 -s ! $INTNET2 -j DROPl
    161 $IPT -A OUTPUT  -o $INTIF2 -d ! $INTNET2 -j DROPl
    162 $IPT -A FORWARD -i $INTIF2 -s ! $INTNET2 -j DROPl
    163 $IPT -A FORWARD -o $INTIF2 -d ! $INTNET2 -j DROPl
    164
    165 # An additional Egress check
    166
    167 $IPT -A OUTPUT  -o $EXTIF -s ! $EXTNET -j DROPl
    168
    169 # Block outbound ICMP (except for PING)
    170
    171 $IPT -A OUTPUT  -o $EXTIF -p icmp \
    172   --icmp-type ! 8 -j DROPl
    173 $IPT -A FORWARD -o $EXTIF -p icmp \
    174     --icmp-type ! 8 -j DROPl
    175
    176 # COMmon ports:
    177 # 0 is tcpmux; SGI had vulnerability, 1 is common attack
    178 # 13 is daytime
    179 # 98 is Linuxconf
    180 # 111 is sunrpc (portmap)
    181 # 137:139, 445 is Microsoft
    182 # SNMP: 161,2
    183 # Squid flotilla: 3128, 8000, 8008, 8080
    184 # 1214 is Morpheus or KaZaA
    185 # 2049 is NFS
    186 # 3049 is very virulent Linux Trojan, mistakable for NFS
    187 # Common attacks: 1999, 4329, 6346
    188 # Common Trojans 12345 65535
    189 COMBLOCK="0:1 13 98 111 137:139 161:162 445 1214 1999 2049 3049 4329 6346 3128 8000 8008 8080 12345 65535"
    190
    191 # TCP ports:
    192 # 98 is Linuxconf
    193 # 512-5!5 is rexec, rlogin, rsh, printer(lpd)
    194 #   [very serious vulnerabilities; attacks continue daily]
    195 # 1080 is Socks proxy server
    196 # 6000 is X (NOTE X over SSH is secure and runs on TCP 22)
    197 # Block 6112 (Sun's/HP's CDE)
    198 TCPBLOCK="$COMBLOCK 98 512:515 1080 6000:6009 6112"
    199
    200 # UDP ports:
    201 # 161:162 is SNMP
    202 # 520=RIP, 9000 is Sangoma
    203 # 517:518 are talk and ntalk (more annoying than anything)
    204 UDPBLOCK="$COMBLOCK 161:162 520 123 517:518 1427 9000"
    205
    206 echo -n "FW: Blocking attacks to TCP port"
    207 for i in $TCPBLOCK;
    208 do
    209 echo -n "$i "
    210   $IPT -A INPUT   -p tcp --dport $i  -j DROPl
    211   $IPT -A OUTPUT  -p tcp --dport $i  -j DROPl
                   211   $IPT -A OUTPUT  -p tcp --dport $i  -j DROPl
    212   $IPT -A FORWARD -p tcp --dport $i  -j DROPl
    213 done
    214 echo ""
    215
    216 echo -n "FW: Blocking attacks to UDP port "
    217 for i in $UDPBLOCK;
    218 do
    219   echo -n "$i "
    220     $IPT -A INPUT   -p udp --dport $i  -j DROPl
    221     $IPT -A OUTPUT  -p udp --dport $i  -j DROPl
    222     $IPT -A FORWARD -p udp --dport $i  -j DROPl
    223 done
    224 echo ""
    225 # ftp and irc tracking
    226 #MODULES="ip_nat_ftp ip_conntrack_ftp ip_conntrack_irc ip_nat_irc"
    227 #for i in $MODULES;
    228 #do
    229 #  echo "Inserting module $i"
    230 #  modprobe $i
    231 #done
    232
    233 #iptables -A OUTPUT -p tcp --dport 873 -o $INTIF -i $EXTIF1 -j ACCEPT
    234
    235 # Defining some common chat clients and services. Remove these from your accepted list
    236 # for better security.
    237 IRC=ircd
    238 MSN=1863
    239 ICQ=5190
    240 NFS="111 2049 32764 32765 32766 32767 32768 sunrpc"
    241 RPCRQUOTAD=32764
    242
    243 # We have to sync!!
    244 PORTAGE=rsync
    245 OpenPGP_HTTP_Keyserver=11371
    246 # 8000:8100--> Somafm streaming audio
    247
    248 # All services ports are read from /etc/services
    249
    250 TCPSERV="domain ssh http https ftp ftp-data mail pop3 pop3s imap3 imaps imap2 time $PORTAGE $IRC $MSN $ICQ $OpenPGP_HTTP_Keyserver courier 8000:8100"    251 UDPSERV="domain time ntp"
    252
    253 echo -n "FW: Allowing inside systems to use service:"
    254 for i in $TCPSERV;
    255 do
    256    echo -n "$i"
    257    $IPT -A OUTPUT  -o $EXTIF -p tcp -s $EXTIP  \
    258     --dport $i --syn -m state --state NEW -j ACCEPT
    259    $IPT -A FORWARD -i $INTIF1 -p tcp -s $INTNET1 \
    260     --dport $i --syn -m state --state NEW -j ACCEPT
    261    $IPT -A FORWARD -i $INTIF2 -p tcp -s $INTNET2 \
    262     --dport $i --syn -m state --state NEW -j ACCEPT
    263 done
          264 echo ""
    265
    266 echo -n "FW: Allowing inside systems to use service:"
    267 for i in $UDPSERV;
    268 do
    269     echo -n "$i"
    270     $IPT -A OUTPUT  -o $EXTIF -p udp -s $EXTIP  \
    271         --dport $i -m state --state NEW -j ACCEPT
    272     $IPT -A FORWARD -i $INTIF1 -p udp -s $INTNET1 \
    273         --dport $i -m state --state NEW -j ACCEPT
    274     $IPT -A FORWARD -i $INTIF2 -p udp -s $INTNET2 \
    275         --dport $i -m state --state NEW -j ACCEPT
    276 done
    277 echo ""
    278
    279 # Allow to ping out
    280 $IPT -A OUTPUT  -o $EXTIF -p icmp -s $EXTIP  \
    281     --icmp-type 8 -m state --state NEW -j ACCEPT
    282 $IPT -A FORWARD -i $INTIF1 -p icmp -s $INTNET1 \
    283     --icmp-type 8 -m state --state NEW -j ACCEPT
    284 $IPT -A FORWARD -i $INTIF2 -p icmp -s $INTNET2 \
    285     --icmp-type 8 -m state --state NEW -j ACCEPT
    286
    287 # Allow firewall to ping internal systems
    288 $IPT -A OUTPUT  -o $INTIF1 -p icmp -s $INTNET1 \
    289     --icmp-type 8 -m state --state NEW -j ACCEPT
    290 $IPT -A OUTPUT  -o $INTIF2 -p icmp -s $INTNET2 \
    291     --icmp-type 8 -m state --state NEW -j ACCEPT
    292
    293 #$IPT -A INPUT   -i $EXTIF -p tcp --dport 22 \
    294 #   --syn -m state --state NEW -j ACCEPT
    295
    296 # $IPT -A INPUT   -i $EXTIF -p tcp -s pentacorp.com/24  --dport 22 \
    297 #   --syn -m state --state NEW -j ACCEPT
    298 # $IPT -A INPUT   -i $EXTIF -p tcp -s chemwiz.state.edu --dport 22 \
    299 #   --syn -m state --state NEW -j ACCEPT
    300
    301
    302 # Allow Bittorrent conncetions:
    303 #echo "Alowing connections by bittorrents"
    304 #$IPT -A FORWARD -i $EXTIF -p tcp --dport 6881:6889 -j ACCEPT
    305 #echo ""
    306
    307
    308 # Connect only from hardened systems
    309 # (hopefully only those running Linux or Unix hardened as per the book)
    310 $IPT -A INPUT   -i $INTIF1 -p tcp --dport 22 \
    311    --syn -m state --state NEW -j ACCEPT
    312 $IPT -A INPUT   -i $INTIF2 -p tcp --dport 22 \
    313   --syn -m state --state NEW -j ACCEPT
    314
    315 # Connect only to hardened systems
    316 # (hopefully only those running Linux or Unix hardened as per the book)
           317 # $IPT -A OUTPUT  -o $INTIF -p tcp                      --dport 22 \
    318 #   -d 10.0.0.42 --syn -m state --state NEW -j ACCEPT
    319 INTNET="$INTNET1 $INTNET2"
    320 echo "Enabling local network CUPS printing"
    321
    322 for i in $INTNET
    323 do
    324 $IPT -A INPUT   -s $i -p tcp --dport 631 -j ACCEPT
    325 $IPT -A INPUT   -s $i -p udp --dport 631 -j ACCEPT
    326
    327 $IPT -A OUTPUT  -s $i -p tcp --dport 631 -j ACCEPT
    328 $IPT -A OUTPUT  -s $i -p udp --dport 631 -j ACCEPT
    329 done
    330 echo ""
    331
    332
    333 #BITTORRENT="6890 6891 6892 6893 6894 6895 6896 6897 6898 6899"
    334 #echo "Enabling bittorrent sharing"
    335 #for i in $BITTORRENT
    336 #do
    337 #    $IPT -t nat -A PREROUTING -i $EXTIF -p tcp --dport \
    338 #       $BITTORRENT -j DNAT --to-destination 192.168.1.77:$BITTORRENT
    339 #    $IPT -A FORWARD -s $INTIP -p tcp --dport 192.168.1.77 -j ACCEPT
    340 #
    341 #    $IPT -t nat -A PREROUTING -i $EXTIF -p tcp --dport \
    342 #       $BITTORRENT -j DNAT --to-destination 192.168.2.77:$BITTORRENT
    343 #    $IPT -A FORWARD -s $INTIP -p tcp --dport 192.168.2.77 -j ACCEPT
    344 #done
    345
    346
    347
    348 $IPT -t nat -A PREROUTING                       -j ACCEPT
    349 #$IPT -t nat -A POSTROUTING -o $EXTIF -s $INTNET1 -j SNAT --to $EXTIP
    350 #$IPT -t nat -A POSTROUTING -o $EXTIP -s $INTNET2 -j SNAT --to $EXTIP
    351 # Comment out next line (that has "MASQUERADE") to not NAT internal network
    352 $IPT -t nat -A POSTROUTING -o $EXTIF -s $INTNET1 -j MASQUERADE
    353 $IPT -t nat -A POSTROUTING -o $EXTIF -s $INTNET2 -j MASQUERADE
    354 $IPT -t nat -A POSTROUTING                      -j ACCEPT
    355 $IPT -t nat -A OUTPUT                           -j ACCEPT
    356
    357 $IPT -A INPUT   -p tcp --dport auth --syn -m state --state NEW -j ACCEPT
    358
    359 iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
    360 iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
    361 iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
    362
    363 # Log & block whatever is left
    364 $IPT -A INPUT             -j DROPl
    365 $IPT -A OUTPUT            -j REJECTl
    366 $IPT -A FORWARD           -j DROPl
  



