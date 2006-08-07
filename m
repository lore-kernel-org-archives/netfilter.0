From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: My firewall script
Date: Mon, 07 Aug 2006 12:43:39 +0200
Message-ID: <44D7195B.90301@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Any comments welcome!!! :)
The remarks are in hungarian... :)
Some "features" disabled...

Swifty

#!/bin/bash
echo "Setting up FIREWALL rules:"
echo "Creating \"active\" rule... "

# ALAP be=E1ll=EDt=E1sok
fw_if_in=3Deth1
fw_if_ex=3Dppp+
fw_ip_in=3D192.168.0.254
fw_ip_ex=3Dwww.xxx.yyy.zzz
fw_nw_in=3D192.168.0.0/24
fw_nw_ex=3Dwww.xxx.yyy.0/24
fw_tc_if=3Dppp0
fw_tc_ul=3D192
# 2048*1.1=3D2252
fw_tc_dl=3D2252

hosts_deny=3D`cat /etc/firewall/hosts_deny`

# Rendszer be=E1ll=EDt=E1sok
core_set=3D"/proc/sys/net/core"
ip_set=3D"/proc/sys/net/ipv4"
echo 1 > $ip_set/tcp_syncookies
echo 0 > $ip_set/conf/all/rp_filter
echo 1 > $ip_set/conf/all/proxy_arp
echo 1 > $ip_set/ip_forward
echo 1 > $ip_set/icmp_echo_ignore_broadcasts
echo 1 > $ip_set/tcp_rfc1337
echo 1 > $ip_set/tcp_sack
echo 1 > $ip_set/tcp_abort_on_overflow
echo 10 > $ip_set/tcp_fin_timeout
echo 32768 > $ip_set/ip_conntrack_max
echo 65535 > $core_set/rmem_default
echo 65535 > $core_set/wmem_default
echo 65535 > $core_set/wmem_max
sysctl -w net.ipv4.tcp_ecn=3D0 >/dev/null 2>/dev/null

# Modulok
modprobe ip_conntrack >/dev/null 2>/dev/null
modprobe ip_conntrack_ftp >/dev/null 2>/dev/null
modprobe ip_conntrack_irc >/dev/null 2>/dev/null
modprobe ip_conntrack_tftp >/dev/null 2>/dev/null
modprobe ip_conntrack_amanda >/dev/null 2>/dev/null
modprobe ip_nat >/dev/null 2>/dev/null
modprobe ip_nat_ftp >/dev/null 2>/dev/null
modprobe ip_nat_irc >/dev/null 2>/dev/null
modprobe iptable_nat >/dev/null 2>/dev/null

# Szubrutinok
clean_subchain() {
 $table -F $subchain >/dev/null 2>/dev/null
 $table -X $subchain >/dev/null 2>/dev/null
 $table -Z $subchain >/dev/null 2>/dev/null
 }
=20
create_subchain() {
 clean_subchain
 $table -N $subchain
 }

do_ports() {
for port in $tcp_ports
 do
 $table -A $subchain -j $target -p tcp --dport $port=20
 done
for port in $udp_ports
 do
 $table -A $subchain -j $target -p udp --dport $port=20
 done
 tcp_ports=3D""
 udp_ports=3D""
 }

disable_ports() {
 target=3D"sendrej"
 do_ports
 }
=20
enable_ports() {
 target=3D"ACCEPT"
 do_ports
 }

# Az eddigi szab=E1lyok t=F6rl=E9se
subchain=3D""
table=3D"iptables -t nat"
clean_subchain
table=3D"iptables -t filter"
clean_subchain
table=3D"iptables -t mangle"
clean_subchain

###**************###
### Saj=E1t l=E1ncok ###
###**************###

chains=3D"inp fwd out"
table=3D"iptables -t filter"

##############
# Megtagad=E1s #
##############

subchain=3D"sendrej"
create_subchain
$table -A $subchain -j REJECT -p tcp --reject-with tcp-reset
$table -A $subchain -j REJECT --reject-with icmp-admin-prohibited
$table -A $subchain -j DROP

##################
# Hoszt tilt=E1sok #
##################

subchain=3D"den-in"
create_subchain
subchain=3D"den-ex"
create_subchain
subchain=3D"den"
for denied in $hosts_deny
 do
 $table -A $subchain-in -j sendrej -s $denied
 $table -A $subchain-ex -j sendrej -d $denied
 done

#------#
# ICMP #
#------#
 # Death ping
# $table -A $subchain -j sendrej -p icmp --icmp-type echo-request -m limi=
t ! --limit 1/s


#-----#
# TCP #
#-----#

 #++++++++++++++++++#
 # M=E1r kapcsol=F3dott #
 #++++++++++++++++++#
# $table -A $subchain -j ACCEPT -p tcp --tcp-flags URG URG
# $table -A $subchain -j ACCEPT -p tcp --tcp-flags ACK ACK
# $table -A $subchain -j ACCEPT -p tcp --tcp-flags PSH PSH
# $table -A $subchain -j ACCEPT -p tcp --tcp-flags RST RST
# $table -A $subchain -j ACCEPT -p tcp --tcp-flags SYN SYN
# $table -A $subchain -j ACCEPT -p tcp --tcp-flags FIN FIN
=20
 #+++++++++++++++++++#
 # Kapcsolat alapj=E1n #
 #+++++++++++++++++++#

 # SYN-ACK v=E9delem
# $table -A $subchain -j sendrej -p tcp --tcp-flags SYN,ACK SYN,ACK  -m l=
imit ! --limit 1/s --limit-burst 30

 # Port scan v=E9delem
# $table -A $subchain -j sendrej -p tcp --tcp-flags SYN,ACK,FIN,RST RST -=
m limit ! --limit 1/s --limit-burst 6

 # SYN flood v=E9delem --syn =3D --tcp-flags SYN,ACK,RST SYN
# $table -A $subchain -j sendrej -p tcp --tcp-flags SYN,ACK,RST SYN -m li=
mit ! --limit 1/s --limit-burst 90

  # Korrekt kapcsol=F3d=E1s
# $table -A $subchain -j RETURN=20

###########################
# K=F6z=F6s kapcsol=F3dott l=E1nc #
###########################

subchain=3D"connected"
create_subchain

$table -A $subchain -j ACCEPT -m state --state ESTABLISHED,RELATED
$table -A $subchain -j ACCEPT -m conntrack --ctstate ESTABLISHED,RELATED
$table -A $subchain -j RETURN -p icmp
$table -A $subchain -j RETURN -p udp
$table -A $subchain -j RETURN -m state --state NEW
#?????????????????????????????????????????????????????????

$table -A $subchain -j ACCEPT -p tcp --tcp-flags ACK,FIN ACK,FIN
$table -A $subchain -j ACCEPT -p tcp --tcp-flags ACK,RST ACK,RST
$table -A $subchain -j ACCEPT -p tcp --tcp-flags ALL RST

$table -A $subchain -j RETURN -p tcp --dport 1411

#$table -A $subchain -j ACCEPT -m state --state INVALID
$table -A $subchain -j LOG  --log-prefix "INVALID: " --log-level debug
$table -A $subchain -j DROP


###################
# Napl=F3z=E1s l=E1ncok #
###################

for chain in $chains
 do
 subchain=3D$chain-lr
 create_subchain
 $table -A $subchain -j LOG --log-prefix "$chain: " --log-level debug
 $table -A $subchain -j sendrej
 done




###****************************###
### * NAT szab=E1lyok *          ###
###                            ###
### PREROUTING                 ###
###  csomag =E9rkez=E9se           ###
### POSTROUTING                ###
###  csomag t=E1voz=E1sa           ###
### OUTPUT                     ###
###  helyben gener=E1lt csomagok ###
###****************************###
table=3D"iptables -t nat"



#######################
### PREROUTING l=E1nc ###
#######################
chain=3D"PREROUTING"

# Ir=E1nyelv fel=E1ll=EDt=E1sa
$table -P $chain ACCEPT



# !!! LAN !!!
subchain=3Dpre-in
create_subchain
$table -A $chain -j $subchain -i $fw_if_in

 # SMTP
 $table -A $subchain -j DNAT -p tcp --dport smtp ! -s 192.168.0.253 --to-=
destination 192.168.0.253

 # SQUID
 $table -A $subchain -j REDIRECT -p tcp --dport www ! -d $fw_ip_in --to-p=
ort 3128

 # DNS
 $table -A $subchain -j DNAT -p tcp --dport domain ! -d $fw_ip_in --to-de=
stination $fw_ip_in
 $table -A $subchain -j DNAT -p udp --dport domain ! -d $fw_ip_in --to-de=
stination $fw_ip_in

 # POP3
 $table -A $subchain -j DNAT -p tcp --dport pop-3 -d $fw_ip_in --to-desti=
nation 192.168.0.253
 $table -A $subchain -j DNAT -p tcp --dport pop-3 -d $fw_ip_ex --to-desti=
nation 192.168.0.253

 # NTP
 $table -A $subchain -j DNAT -p tcp --dport ntp ! -d $fw_ip_in --to-desti=
nation $fw_ip_in
 $table -A $subchain -j DNAT -p udp --dport ntp ! -d $fw_ip_in --to-desti=
nation $fw_ip_in

 # Bels=F5 h=E1l=F3 <-> k=FCls=F5 IP csomagjainak =E1tir=E1ny=EDt=E1sa
 $table -A $subchain -j DNAT -d $fw_ip_ex --to-destination $fw_ip_in




# !!! WAN !!!
subchain=3Dpre-ex
create_subchain
$table -A $chain -j $subchain -i $fw_if_ex

 # HTTP
 $table -A $subchain -j DNAT -p tcp --dport http --to-destination 192.168=
.0.253
=20
 # POP3
 $table -A $subchain -j DNAT -p tcp --dport pop-3 --to-destination 192.16=
8.0.253

 $table -A $subchain -j DNAT -p tcp --dport 1411 --to-destination 192.168=
.0.192
 $table -A $subchain -j DNAT -p udp --dport 1411 --to-destination 192.168=
.0.192



########################
### POSTROUTING l=E1nc ###
########################
chain=3D"POSTROUTING"

# Ir=E1nyelv fel=E1ll=EDt=E1sa
$table -P $chain ACCEPT



# !!! LAN !!!
subchain=3Dpst-in
create_subchain
$table -A $chain -j $subchain -o $fw_if_in

 # =C1tir=E1ny=EDt=E1sok m=E1sik szerverre
 $table -A $subchain -j SNAT -p tcp --dport smtp -d 192.168.0.253 --to-so=
urce $fw_ip_in
 $table -A $subchain -j SNAT -p tcp --dport pop-3 -d 192.168.0.253 --to-s=
ource $fw_ip_in

 # Bels=F5 h=E1l=F3 <-> k=FCls=F5 IP csomagjainak =E1tir=E1ny=EDt=E1sa
 $table -A $subchain -j SNAT -s $fw_ip_ex --to-source $fw_ip_in



# !!! WAN !!!
subchain=3Dpst-ex
create_subchain
$table -A $chain -j $subchain -o $fw_if_ex

 # Maszkol=E1s
 #$table -A $subchain -j MASQUERADE

 # NAT
 $table -A $subchain -j SNAT -s $fw_nw_in ! -d $fw_ip_ex --to-source $fw_=
ip_ex




###################
### OUTPUT l=E1nc ###
###################
chain=3D"OUTPUT"

# Ir=E1nyelv fel=E1ll=EDt=E1sa
$table -P $chain ACCEPT




###****************************###
### * FILTER szab=E1lyok *       ###
###                            ###
### INPUT                      ###
###  csomag fogad=E1sa           ###
### FORWARD                    ###
###  csomag tov=E1bb=EDt=E1sa        ###
### OUTPUT                     ###
###  helyben gener=E1lt csomagok ###
###****************************###
table=3D"iptables -t filter"



##################
### INPUT l=E1nc ###
##################
chain=3D"INPUT"

# Ir=E1nyelv fel=E1ll=EDt=E1sa
$table -P $chain DROP

# Ismert?
$table -A $chain -j connected

# ADSL modem
$table -A $chain -j DROP -i eth0

# LO
$table -A $chain -j ACCEPT -i lo

# LAN
$table -A $chain -j ACCEPT -i $fw_if_in -s $fw_nw_in

# Denied
$table -A $chain -j den-in

# !!! inp-ex !!!
subchain=3Dinp-ex
create_subchain
$table -A $chain -j $subchain -i $fw_if_ex -d $fw_ip_ex

 # DNS
# $table -A $subchain -j ACCEPT -p udp --sport domain
=20
 # Publikus portok
 tcp_ports=3D"ssh smtp" #auth
 udp_ports=3D""
 enable_ports
=20
 # LOG SZ=DBR=C9S
 tcp_ports=3D"loc-srv netbios-ns netbios-dgm netbios-ssn microsoft-ds"
 udp_ports=3D$tcp_ports
 disable_ports
=20
# Megs=E9rt=E9sek napl=F3z=E1sa
$table -A $chain -j inp-lr



####################
### FORWARD l=E1nc ###
####################
chain=3D"FORWARD"

# Ir=E1nyelv fel=E1ll=EDt=E1sa
$table -P $chain DROP

# Ismert?
$table -A $chain -j connected


# Tiltott IP-k
$table -A $chain -j den-in
$table -A $chain -j den-ex

# !!! fwd-in !!!
subchain=3Dfwd-in
create_subchain
$table -A $chain -j $subchain -i $fw_if_in -s $fw_nw_in

 # ICMP
 $table -A $subchain -j ACCEPT -p icmp

 # Saj=E1t h=E1l=F3 ?????????????????????????????????????????????????????=
?????????????????????????????
 $table -A $subchain -j ACCEPT -d $fw_nw_in

 tcp_ports=3D"ftp-data ftp ssh smtp pop3 https 1024:65535 411"
 udp_ports=3D"1024:65535 411"
 enable_ports

# !!! fwd-ex !!!
subchain=3Dfwd-ex
create_subchain
$table -A $chain -j $subchain -i $fw_if_ex

 # ICMP
 $table -A $subchain -j ACCEPT -p icmp

 # POP3 enged=E9lyez=E9se
 $table -A $subchain -j ACCEPT -p tcp -d 192.168.0.253 --dport pop3
=20
 # HTTP enged=E9lyez=E9se
 $table -A $subchain -j ACCEPT -p tcp -d 192.168.0.253 --dport http
 # User progs
# $table -A $subchain -j ACCEPT -p udp --sport 1024:65535 --dport 1024:65=
535
=20
 $table -A $subchain -j ACCEPT -p tcp -d 192.168.0.192 --dport 1411
 $table -A $subchain -j ACCEPT -p udp -d 192.168.0.192 --dport 1411

# Megs=E9rt=E9sek napl=F3z=E1sa
$table -A $chain -j fwd-lr



###################
### OUTPUT l=E1nc ###
###################
chain=3D"OUTPUT"

# Ir=E1nyelv fel=E1ll=EDt=E1sa
$table -P $chain DROP

# Ismert?
$table -A $chain -j connected

# Helyi
$table -A $chain -j ACCEPT -o lo

# Bels=F5 h=E1l=F3 fel=E9
$table -A $chain -j ACCEPT -o $fw_if_in -d $fw_nw_in

# Tiltott IP c=EDmek
$table -A $chain -j den-ex

# Internet fel=E9
$table -A $chain -j ACCEPT -o $fw_if_ex -s $fw_ip_ex

# Megs=E9rt=E9sek napl=F3z=E1sa (=E9rtelmetlen :) )
$table -A $chain -j out-lr





###****************************###
### * MANGLE szab=E1lyok *       ###
###                            ###
### INPUT                      ###
###  csomag fogad=E1sa           ###
### FORWARD                    ###
###  csomag tov=E1bb=EDt=E1sa        ###
### OUTPUT                     ###
###  helyben gener=E1lt csomagok ###
### POSTROUTING                ###
###  csomag t=E1voz=E1sa           ###
###****************************###
table=3D"iptables -t mangle"



###############
### FORWARD ###
###############
chain=3D"FORWARD"

$table -A $chain -j RETURN ! -o $fw_if_ex

$table -A $chain -j MARK -p tcp --sport 1411 --set-mark 110

$table -A $chain -j MARK -p tcp --dport smtp --set-mark 111
$table -A $chain -j MARK -p tcp --dport 1024:65535 --set-mark 110

$table -A $chain -j MARK -p tcp --dport https --set-mark 112

$table -A $chain -j MARK ! -p tcp --set-mark 113
$table -A $chain -j MARK -p tcp -m length --length :64 --set-mark 113


###################
### OUTPUT l=E1nc ###
###################
chain=3D"OUTPUT"

# Traffic Control
$table -A $chain -j RETURN ! -o $fw_if_ex

$table -A $chain -j MARK -p tcp --sport 1411 --set-mark 110

$table -A $chain -j MARK -p tcp --dport smtp --set-mark 111
$table -A $chain -j MARK -p tcp --dport 1024:65535 --set-mark 111

$table -A $chain -j MARK -p tcp --dport http --set-mark 112

$table -A $chain -j MARK ! -p tcp --set-mark 113
$table -A $chain -j MARK -p tcp -m length --length :64 --set-mark 113

#########################
### POSTROUTING l=E1nc  ###
#########################
chain=3D"POSTROUTING"

$table -A $chain -j RETURN ! -o $fw_if_ex

# MSS blackhole
$table -A $chain -j TCPMSS -p tcp --tcp-flags SYN,RST SYN --clamp-mss-to-=
pmtu

# ECN blackhole
$table -A $chain -j ECN -p tcp --ecn-tcp-remove


# Adatok ment=E9se, befejez=E9s
/etc/init.d/iptables save active
echo done.
echo "Creating \"inactive\" rule... "
/etc/init.d/iptables halt
/etc/init.d/iptables save inactive
echo "Loading \"active\" rule... "
/etc/init.d/iptables load active
echo "done."

#######################
### TRAFFIC CONTROL ###
#######################

echo "Setting up TRAFFIC CONTROL rules:"

tc_dev=3D"dev $fw_tc_if"
tc_ul=3D`echo "scale=3D0; ($fw_tc_ul*0.95+0.5)/1" | bc`

# Alap be=E1ll=EDt=E1sok
tc_com=3D"tc qdisc del $tc_dev"
$tc_com root >/dev/null 2>/dev/null
$tc_com ingress >/dev/null 2>/dev/null

##############
### UpLink ###
##############

#$tc_qdisc parent 1:10 handle 10:0 esfq perturb 10 quantum 4k hash src
#$tc_qdisc parent 10:0 handle 10:1 pfifo limit 10
tc_addfilter() {
 $tc_fl protocol ip  parent 1:0 ${tc_filter} flowid 1:${tc_flow}
 }
#prio ${tc_bw_prio}

tc_child() {
 $tc_cl parent 1:1 classid 1:${tc_flow} htb rate ${tc_bw_min}kbit ceil ${=
tc_bw_max}kbit burst ${tc_bw_burst}k prio ${tc_bw_prio}
 $tc_qd parent 1:${tc_flow} handle ${tc_flow}:0 sfq perturb ${tc_bw_pert}=
 quantum ${tc_bw_burst}k
# $tc_qd parent 1:${tc_flow} handle ${tc_flow}:0 tbf rate ${tc_bw_min}kbi=
t burst 1492 latency 50ms
 }


tc_qd=3D"tc qdisc add $tc_dev"
tc_cl=3D"tc class add $tc_dev"
tc_fl=3D"tc filter add $tc_dev"

$tc_qd root handle 1:0 htb default 12
$tc_cl parent 1:0 classid 1:1 htb rate ${tc_ul}kbit ceil ${tc_ul}kbit

# !!!  8kbit(/s) =3D 1kbyte/s !!!
# !!! 16kbit(/s) =3D 2kbyte/s !!!

#INTERACTIVE
tc_flow=3D"13"
tc_bw_min=3D"128"
tc_bw_max=3D"128"
tc_bw_burst=3D"8"
tc_bw_prio=3D"4"
tc_bw_pert=3D"4"
tc_child
#TOS
tc_filter=3D"u32 match ip tos 0x10 0xff"
tc_addfilter
#ICMP
tc_filter=3D"u32 match ip protocol 1 0xff"
tc_addfilter
#TCP ACK<64byte
tc_filter=3D"u32	match ip protocol 6 0xff \
		match u8 0x05 0x0f at 0 \
	        match u16 0x0000 0xffc0 at 2 \
	        match u8 0x10 0xff at 33"
tc_addfilter

#DEFAULT
tc_flow=3D"12"
tc_bw_min=3D"160"
tc_bw_max=3D${tc_ul}
tc_bw_burst=3D"16"
tc_bw_prio=3D"3"
tc_bw_pert=3D"8"
tc_child
tc_filter=3D"u32 match ip dport 80 0xfff"
tc_addfilter
tc_filter=3D"u32 match ip dport 443 0xfff"
tc_addfilter

#SMTP
tc_flow=3D"11"
tc_bw_min=3D"96"
tc_bw_max=3D"160"
tc_bw_burst=3D"64"
tc_bw_prio=3D"2"
tc_bw_pert=3D"16"
tc_child
tc_filter=3D"u32 match ip dport 25 0xffff"
tc_addfilter

#DC++
tc_flow=3D"10"
tc_bw_min=3D"48"
tc_bw_max=3D"56"
tc_bw_burst=3D"1"
tc_bw_prio=3D"1"
tc_bw_pert=3D"20"
tc_child
tc_filter=3D"u32 match ip sport 1411 0xffff"
tc_addfilter
tc_filter=3D"u32 match ip dport 1411 0xffff"
tc_addfilter

flows=3D"13 12 11 10"
for tc_flow in $flows=20
 do=20
 tc_filter=3D"handle 1${tc_flow} fw"
 tc_addfilter
 done

################
### DownLink ###
################

$tc_qd handle ffff:0 ingress
$tc_fl parent ffff:0 protocol ip prio 50 u32 match ip src 0.0.0.0/0 polic=
e rate ${fw_tc_dl}kbit burst 64k drop flowid 0:1

echo "done."




