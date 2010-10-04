From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Limiting Network traffic
Date: Mon, 04 Oct 2010 18:07:51 +0100
Message-ID: <4CAA09E7.5070207@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

I'm try to use the script below to throttle a Xen VM. However, it's not 
working. The script does seem to execute ok though. All my Xen DomU 
interfaces are connected to a bridge on the Xen host. I have a firewall 
VM running on this machine which the VMs use. No matter if I put the VM 
interface, the firewall interface, or the bridge name itself in the IF 
field, it never works. Any help is appreciated. Thanks

#!/bin/bash
#
#  tc uses the following units when passed as a parameter.
#  kbps: Kilobytes per second
#  mbps: Megabytes per second
#  kbit: Kilobits per second
#  mbit: Megabits per second
#  bps: Bytes per second
#       Amounts of data can be specified in:
#       kb or k: Kilobytes
#       mb or m: Megabytes
#       mbit: Megabits
#       kbit: Kilobits
#  To get the byte figure from bits, divide the number by 8 bit
#
TC=/sbin/tc
IF=tap1.0		    # Interface
DNLD=1mbit          # DOWNLOAD Limit
UPLD=1mbit          # UPLOAD Limit
IP=216.3.128.12     # Host IP
U32="$TC filter add dev $IF protocol ip parent 1:0 prio 1 u32"

start() {

     $TC qdisc add dev $IF root handle 1: htb default 30
     $TC class add dev $IF parent 1: classid 1:1 htb rate $DNLD
     $TC class add dev $IF parent 1: classid 1:2 htb rate $UPLD
     $U32 match ip dst $IP/32 flowid 1:1
     $U32 match ip src $IP/32 flowid 1:2

}

stop() {

     $TC qdisc del dev $IF root

}

restart() {

     stop
     sleep 1
     start

}

show() {

     $TC -s qdisc ls dev $IF

}

case "$1" in

   start)

     echo -n "Starting bandwidth shaping: "
     start
     echo "done"
     ;;

   stop)

     echo -n "Stopping bandwidth shaping: "
     stop
     echo "done"
     ;;

   restart)

     echo -n "Restarting bandwidth shaping: "
     restart
     echo "done"
     ;;

   show)
     	    	
     echo "Bandwidth shaping status for $IF:\n"
     show
     echo ""
     ;;

   *)

     pwd=$(pwd)
     echo "Usage: $(/usr/bin/dirname $pwd)/tc.bash {start|stop|restart|show}"
     ;;

esac

exit 0



