From: Jesse Harris <zigford@gmail.com>
Subject: Problem blocking a large list of ip ranges using netfilter with ipranges
Date: Sat, 19 Apr 2008 22:14:03 +1000
Message-ID: <D6EFEA32-5FA6-46C3-91DB-7E06446DCFCF@gmail.com>
Mime-Version: 1.0 (Apple Message framework v919.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to:content-type:content-transfer-encoding:mime-version:subject:date:x-mailer;
        bh=Q46k7KUp9ANm08KSp061o7Cgw1rw3+MUea+YMZhY3LY=;
        b=QAadpy9Mtr+vBP4SAxPX+xfrniHkebBN377owqcZwp3ZwYgnWozVsmEI28CO6j3hDWgGzM9va4qxSQDo9COdP6BEI6eScjaOP8P+wd5uX64kNsP7+bRx5DUmlRvpVACDDafMBGJBdTI6MblTHyI+byw18K9AhnuwxBXHGAxaEVA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

G'day,

I've been using netfilter as a firewall for my Wifi Access point/ 
internet gateway for a couple of years now.
Recently I have needed to block a large list of ip address ranges.
Firstly, I'm not sure if iptables is really suited to this, I don't  
know how long it takes for a packet to be parsed down a very long list  
of chains.

With my ISP, they allow traffic to certain sites not count towards my  
quota.  A list of IP Address ranges is published that do count toward  
quota.
My idea, when using p2p, is to block all addresses that count towards  
my quota.
The problem seems to be with the way that I use the conntrack  
ESTABLISH,RELATED match.
If I have that rule before my drop rules, then nothing p2p is blocked.
If I have that rule after my drop rules, then everything p2p is blocked.

Has anyone used iptables in this way before?
PS, there are about 2033 ip ranges to be blocked.
Many thanks in advance.

Here is my firewall script:

harrisj@dh:~$ cat /etc/init.d/rc.firewall
#!/bin/bash

#Install required modules
modprobe iptable_nat

#Configure Kernel routing
echo Starting kernal routing...
echo 1 > /proc/sys/net/ipv4/ip_forward

# Setup default variables
IPTABLES=/sbin/iptables
IF_WAN=ppp0
IF_LAN=br0
IF_LO=lo
LAN_ADDRESS=192.168.7.0/24
LO_ADDRESS=127.0.0.0/8
IP_LAN=192.168.7.1
UNPRIV_PORTS=1024:65535

#Configure LAN Access
ALLOW_SERVER_OUT=""
ALLOW_SERVER_IN="80/tcp 22/tcp"
ALLOW_LAN_OUT=""

#Allow port range in
PORT_RANGE_SERVER=""

#Torrent - PIPE Filter list
#Allow port range in
TORRENT_RANGE="49160-49300: 49301-49310:"
PIPE_BLOCK="/home/guest/samba/pipe.txt"

#Clean up old IP chains
echo Cleaning old chains
$IPTABLES -F INPUT
$IPTABLES -F FORWARD
$IPTABLES -F OUTPUT
$IPTABLES -t nat -F

#Set initial policies to DROP
$IPTABLES -P INPUT DROP
$IPTABLES -P FORWARD DROP
$IPTABLES -P OUTPUT DROP

#Allow unlimited traffic on the loopback interface
echo Allowing loopback interface full access to internal interfaces
$IPTABLES -A INPUT -i $IF_LO -s $LO_ADDRESS -j ACCEPT
$IPTABLES -A INPUT -i $IF_LO -s $LAN_ADDRESS -j ACCEPT
$IPTABLES -A OUTPUT -o $IF_LO -d $LO_ADDRESS -j ACCEPT
$IPTABLES -A OUTPUT -o $IF_LO -d $LAN_ADDRESS -j ACCEPT
$IPTABLES -A INPUT -i $IF_LAN -s $LAN_ADDRESS -j ACCEPT
$IPTABLES -A OUTPUT -o $IF_LAN -d $LAN_ADDRESS -j ACCEPT

#Enable IP Forwarding through SNAT
echo Enabling Network Address Translation
$IPTABLES -t nat -A POSTROUTING -o $IF_WAN -j MASQUERADE
$IPTABLES -A FORWARD -i $IF_LAN -o $IF_WAN -s ! $IP_LAN -j ACCEPT
$IPTABLES -A FORWARD -i $IF_WAN -o $IF_LAN -j ACCEPT


#Allow Server Out
   if [ "$ALLOW_SERVER_OUT" = "" ]; then
	echo Allowing server full access...
	$IPTABLES -A OUTPUT -o $IF_WAN -j ACCEPT
   else
	for EXCEPTION in $ALLOW_SERVER_OUT
	do
	  PORT=$(echo $EXCEPTION|awk -F '/' '{print$1}')
	  PROTO=$(echo $EXCEPTION|awk -F '/' '{print$2}')
	  $IPTABLES -A OUTPUT -o $IF_WAN -p $PROTO \
		--dport $PORT -j ACCEPT
	  echo Allowing server out on $PROTO/$PORT through interface $IF_WAN
	done
   fi

#Allow LAN Out
   if [ "$ALLOW_LAN_OUT" = "" ]; then
	echo Allowing LAN full access...
#	$IPTABLES -A OUTPUT -o $IF_WAN -s $IF_LAN -j ACCEPT
   else
	for EXCEPTION in $ALLOW_LAN_OUT
	do
	  PORT=$(echo $EXCEPTION|awk -F '/' '{print$1}')
	  PROTO=$(echo $EXCEPTION|awk -F '/' '{print$2}')
	  $IPTABLES -A OUTPUT -o $IF_WAN -s $IP_LAN -p $PROTO \
		-m dccp --dport $PORT -j ACCEPT
	done
   fi

#Allow Server In
   if [ "$ALLOW_SERVER_IN" = "" ]; then
	echo No ports forwarded to server
   else
	for EXCEPTION in $ALLOW_SERVER_IN
	do
	  PORT=$(echo $EXCEPTION|awk -F '/' '{print$1}')
	  PROTO=$(echo $EXCEPTION|awk -F '/' '{print$2}')
	  echo Server is accepting incoming $PROTO connections on port $PORT
	  $IPTABLES -A INPUT -i $IF_WAN -p $PROTO \
		--dport $PORT -j ACCEPT
	done
   fi

#Allow Port Range in
   if [ ! "$PORT_RANGE_SERVER" = "" ]; then
     for RANGE in $PORT_RANGE_SERVER
     do
	CPORT=$(echo $RANGE|awk -F '-' '{print$1}')
	FPORT=$(echo $RANGE|awk -F '-' '{print$2}')
	echo Server is accepting incoming connections on port range $RANGE
	  $IPTABLES -A INPUT -i $IF_WAN -p tcp \
	    -m multiport --destination-ports $CPORT:$FPORT \
	      -j ACCEPT
	  $IPTABLES -A INPUT -i $IF_WAN -p udp \
	    -m multiport --destination-ports $CPORT:$FPORT \
	      -j ACCEPT
     done
   fi

#Torrent Port Range
   if [ ! "$TORRENT_RANGE" = "" ]; then
     for RANGE in $TORRENT_RANGE
     do
	CPORT=$(echo $RANGE|awk -F '-' '{print$1}')
	FPORT_PIPE=$(echo $RANGE|awk -F '-' '{print$2}')
	FPORT=$(echo $FPORT_PIPE|awk -F ':' '{print$1}')
	PIPE_FILE=$(echo $FPORT_PIPE|awk -F ':' '{print$2}')
	echo Server is accepting torrent requests on port range $CPORT-$FPORT
	  if [ ! "$PIPE_FILE" = "" ]; then
	    PIPE=$(cat "$PIPE_FILE")	
	    for BLOCK_RANGE in $PIPE
	    do
	     $IPTABLES -I INPUT 1 -i $IF_WAN -p tcp \
	        -m iprange --src-range "$BLOCK_RANGE" \
	        -m multiport --destination-ports $CPORT:$FPORT \
	        -j DROP
	    done
	  fi
	    $IPTABLES -A INPUT -i $IF_WAN -p tcp \
		-m multiport --destination-ports $CPORT:$FPORT \
		-j ACCEPT
     done
   fi

#PIPE BLOCK
   if [ ! "$PIPE_BLOCK" = "" ]; then
     PIPE=$(cat "$PIPE_BLOCK")	
     echo Allowing pipe on all unpriv ports...
     for BLOCK_RANGE in $PIPE
	    do
	     $IPTABLES -A INPUT -i $IF_WAN -p tcp \
	        -m iprange --src-range "$BLOCK_RANGE" \
		-m multiport --destination-ports $UNPRIV_PORTS \
	        -j DROP
	    done
   fi

#Allow already established connections.
$IPTABLES -A INPUT -i $IF_WAN \
	-m conntrack --ctstate ESTABLISHED,RELATED \
	-j ACCEPT

Sorry for the long post.


