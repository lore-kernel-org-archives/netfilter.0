From: Dr Aldo Medina <aldomedina@hotpop.com>
Subject: Test script for P2P
Date: 21 May 2003 12:17:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053537529.5347.138.camel@linuxclient>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-+k26nVxgo3Dc+PApRHAr"
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
To: netfilter@lists.netfilter.org


--=-+k26nVxgo3Dc+PApRHAr
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This is my last test script for P2P. Its a modified wondershaper and P2P
script. It runs in a local firewall, preserving external ssh access, and
internal internet use, while limiting P2P. Could anybody please comment
it?



--=-+k26nVxgo3Dc+PApRHAr
Content-Disposition: attachment; filename=wshaper
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-sh; name=wshaper; charset=ISO-8859-1

#!/bin/bash

# MLDonkey Wondershaper
# In kilobits

DOWNLINK=3D180
UPLINK=3D90
DEV=3Dppp0
QLEN=3D30 #Default 3
RQ=3D1    #Default 10
BURST=3D30 #Default 6
CLASS12=3D"http/tcp/both pop3/tcp/dport pop3s/tcp/dport https/tcp/dport 808=
0/tcp/both nntp/tcp/both"

case "$1" in
   start)
      IPTCMD=3D"iptables -A WSHAPER -t mangle -p"

      tc disc del dev $DEV root 2> /dev/null > /dev/null
      tc disc del dev $DEV ingress 2> /dev/null > /dev/null
      tc disc del dev imq0 root 2> /dev/null > /dev/null
      iptables -t mangle -D POSTROUTING -o $DEV -j WSHAPER 2> /dev/null \
         > /dev/null

      ip link set dev $DEV qlen $QLEN
      tc qdisc add dev $DEV root handle 1: htb r2q $RQ default 13
     =20
      tc class add dev $DEV parent 1: classid 1:1 htb rate $[$UPLINK-2]kbit=
 \
            ceil $[$UPLINK-2]kbit burst ${BURST}k
      tc class add dev $DEV parent 1:1 classid 1:10 htb rate \
            $[(($UPLINK-2)*17)/100]kbit ceil $[$UPLINK-2]kbit prio 2
      tc class add dev $DEV parent 1:1 classid 1:11 htb rate \
            $[(($UPLINK-2)*40)/100]kbit ceil $[$UPLINK-2]kbit prio 0
      tc class add dev $DEV parent 1:1 classid 1:12 htb rate \
            $[(($UPLINK-2)*40)/100]kbit ceil $[$UPLINK-2]kbit prio 1
      tc class add dev $DEV parent 1:1 classid 1:13 htb rate \
            1kbit ceil $[$UPLINK-2]kbit prio 3
     =20
      tc qdisc add dev $DEV parent 1:10 handle 10: sfq perturb 10
      tc qdisc add dev $DEV parent 1:11 handle 11: sfq perturb 10
      tc qdisc add dev $DEV parent 1:12 handle 12: sfq perturb 10
      tc qdisc add dev $DEV parent 1:13 handle 13: sfq perturb 10

      tc filter add dev $DEV parent 1:0 prio 0 protocol ip handle 10 \
         fw flowid 1:10
      tc filter add dev $DEV parent 1:0 prio 1 protocol ip handle 11 \
         fw flowid 1:11
      tc filter add dev $DEV parent 1:0 prio 2 protocol ip handle 12 \
         fw flowid 1:12
      tc filter add dev $DEV parent 1:0 prio 3 protocol ip handle 13 \
         fw flowid 1:13

     iptables -t mangle -N WSHAPER
     iptables -t mangle -I POSTROUTING -o $DEV -j WSHAPER

     # Class 10
     $IPTCMD tcp -m length --length :64 -j MARK --set-mark 10	## ACKs

     # $IPTCMD tcp -p tcp --tcp-flags ACK -j MARK --set-mark 10
    =20
     # Class 11
     $IPTCMD tcp --dport ssh -j MARK --set-mark 11		## SSH
     $IPTCMD tcp --sport ssh -j MARK --set-mark 11
     $IPTCMD icmp -j MARK --set-mark 11				## ICMP
     $IPTCMD udp --dport domain -j MARK --set-mark 11		## DNS
     $IPTCMD all --source 192.168.0.2 -j MARK --set-mark 11 	## linuxclient
     $IPTCMD all --destination 192.168.0.2 -j MARK --set-mark 11
     $IPTCMD all --source 192.168.0.3 -j MARK --set-mark 11     ## linuxlap=
top
     $IPTCMD all --destination 192.168.0.3 -j MARK --set-mark 11
     $IPTCMD all --source 192.168.0.4 -j MARK --set-mark 11	## compaqlaptop
     $IPTCMD all --destination 192.168.0.4 -j MARK --set-mark 11

     # Class 12
     for PORTPROTODEST in $CLASS12 ; do
        PORT=3D`echo $PORTPROTODEST | awk -F/ '{print $1}'`
	PROTO=3D`echo $PORTPROTODEST | awk -F/ '{print $2}'`
	DEST=3D`echo $PORTPROTODEST | awk -F/ '{print $3}'`

       if [ "$PROTO" =3D "both" ]; then
	   if [ "$DEST" =3D "both" ]; then
   	      $IPTCMD tcp --dport $PORT -j MARK --set-mark 12
   	      $IPTCMD udp --sport $PORT -j MARK --set-mark 12
	      $IPTCMD tcp --sport $PORT -j MARK --set-mark 12
	      $IPTCMD udp --dport $PORT -j MARK --set-mark 12
	   else
	      $IPTCMD tcp --$DEST $PORT -j MARK --set-mark 12
	      $IPTCMD udp --$DEST $PORT -j MARK --set-mark 12
	   fi
	else
	   if [ "$DEST" =3D "both" ]; then
	      $IPTCMD $PROTO --dport $PORT -j MARK --set-mark 12
	      $IPTCMD $PROTO --sport $PORT -j MARK --set-mark 12
	   else
	      $IPTCMD $PROTO --$DEST $PORT -j MARK --set-mark 12
	   fi
	fi
      done

      # Class 13 default
      $IPTCMD udp --sport 4660:4670 -j MARK --set-mark 13
      $IPTCMD udp --dport 4660:4670 -j MARK --set-mark 13
      $IPTCMD tcp --sport 4660:4670 -j MARK --set-mark 13
      $IPTCMD tcp --dport 4660:4670 -j MARK --set-mark 13
      $IPTCMD udp --dport 8948 -j MARK --set-mark 13
      $IPTCMD tcp --dport 8948 -j MARK --set-mark 13
      $IPTCMD udp --sport 8948 -j MARK --set-mark 13
      $IPTCMD tcp --sport 8948 -j MARK --set-mark 13

tc qdisc add dev imq0 handle 1: root htb default 1
tc class add dev imq0 parent 1: classid 1:1 htb rate $[DOWNLINK-2]kbit
tc qdisc add dev imq0 parent 1:1 handle 10: htb default 5
tc class add dev imq0 parent 10: classid 10:1 htb \
  rate $[((DOWNLINK-2)*10)/100]kbit ceil $[DOWNLINK-2]kbit burst 30k prio 1
tc class add dev imq0 parent 10: classid 10:2 htb \
  rate $[((DOWNLINK-2)*70)/100]kbit ceil $[DOWNLINK-2]kbit burst 30k prio 2
tc class add dev imq0 parent 10: classid 10:5 htb \
  rate $[((DOWNLINK-2)*20)/100]kbit ceil $[DOWNLINK-2]kbit prio 3
tc qdisc add dev imq0 parent 10:1 handle 21:0 pfifo
tc qdisc add dev imq0 parent 10:2 handle 22:0 sfq
tc qdisc add dev imq0 parent 10:5 handle 23:0 sfq
tc filter add dev imq0 protocol ip pref 1 parent 10: handle 1 fw classid 10=
:1
tc filter add dev imq0 protocol ip pref 2 parent 10: handle 2 fw classid 10=
:2
iptables -t mangle -A PREROUTING -i $DEV -j IMQ
iptables -t mangle -A PREROUTING -i $DEV -p tcp -m tos --tos minimize-delay=
 -m state --state ESTABLISHED -j MARK --set-mark 1
iptables -t mangle -A PREROUTING -i $DEV -p tcp -m length --length :64 -j M=
ARK --set-mark 1
iptables -t mangle -A PREROUTING -i $DEV -p tcp --dport 22  -m state --stat=
e ESTABLISHED -j MARK --set-mark 2
iptables -t mangle -A PREROUTING -i $DEV -p tcp --sport 80 --dport 1024: -m=
 state --state ESTABLISHED -j MARK --set-mark 2
iptables -t mangle -A PREROUTING -i $DEV -p udp --sport domain -j MARK --se=
t-mark 2
ip link set imq0 up
 =20
   echo "wshaper started"
      ;;
   stop)
      iptables -t mangle -D POSTROUTING -o $DEV -j WSHAPER 2> /dev/null \
         > /dev/null
      iptables -t mangle -D PREROUTING -i $DEV -j WSHAPER 2> /dev/null \
         > /dev/null
      iptables -t mangle -D PREROUTING -i $DEV -j IMQ 2> /dev/null \
         > /dev/null
      iptables -t mangle -F PREROUTING 2> /dev/null >/dev/null
      iptables -t mangle -F WSHAPER 2> /dev/null > /dev/null
      iptables -t mangle -X WSHAPER 2> /dev/null > /dev/null

      tc qdisc del dev $DEV root 2> /dev/null > /dev/null
      tc qdisc del dev $DEV ingress 2> /dev/null > /dev/null
      tc qdisc del dev imq0 root 2> /dev/null > /dev/null
      echo "wshaper stopped"
      ;;
   restart)
      $0 stop
      $0 start
      ;;
   status)
      # print anything interesting
      echo "[qdisc]"
      tc -s qdisc show dev $DEV
      echo "[class]"
      tc -s class show dev $DEV
      echo "[iptables]"
      iptables -t mangle -L WSHAPER -xnv
      echo "[imq]"
      tc -s qdisc show dev imq0
      tc -s class show dev imq0
      exit
      ;;
   *)
      echo "Usage: $0 {start|stop|restart|status}"
      ;;
esac

--=-+k26nVxgo3Dc+PApRHAr--



