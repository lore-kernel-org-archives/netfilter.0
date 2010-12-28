From: "J Webster" <webster_jack@hotmail.com>
Subject: limit badwidth not working
Date: Tue, 28 Dec 2010 12:12:47 +0100
Message-ID: <BAY145-ds9975844F1691A3B9C49EAF3010@phx.gbl>
References: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@vger.kernel.org

I have a setup where uisers connect by VPN and are given IP addresses in the 
range 10.8.0.xxx
I would like to limit their bandwidth to 1.5Mbps per IP address. However, I 
don't want to limit the incoming connection.
For example, they access the VPN server by it's WAN IP 200.xx.xx.xx and are 
given a local IP of 10.0.8.x
User 1 goes to www.youtube.com and starts streaming videos, this should be 
limited to 1.5Mbps.
User 2 goes to www.youtube.com and starts downloading a video, this should 
also be limited to 1.5Mbps but the
server connection to youtube should have unlimited bandwidth to allow for 
multiple users, in this sinstance at least 3Mbps.

I tried the tc example below but am not sure whether I should apply the 
filter to the tun0 network 10.0.8x or to the entire iptables connections.

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

#
# Name of the traffic control command.
TC=/sbin/tc

# The network interface we're planning on limiting bandwidth.
IF=eth0             # Interface

# Download limit (in mega bits)
DNLD=1mbit          # DOWNLOAD Limit

# Upload limit (in mega bits)
UPLD=1mbit          # UPLOAD Limit

# IP address of the machine we are controlling
IP=216.3.128.12     # Host IP

# Filter options for limiting the intended interface.
U32="$TC filter add dev $IF protocol ip parent 1:0 prio 1 u32"

start() {

# We'll use Hierarchical Token Bucket (HTB) to shape bandwidth.
# For detailed configuration options, please consult Linux man
# page.

    $TC qdisc add dev $IF root handle 1: htb default 30
    $TC class add dev $IF parent 1: classid 1:1 htb rate $DNLD
    $TC class add dev $IF parent 1: classid 1:2 htb rate $UPLD
    $U32 match ip dst $IP/32 flowid 1:1
    $U32 match ip src $IP/32 flowid 1:2

# The first line creates the root qdisc, and the next two lines
# create two child qdisc that are to be used to shape download
# and upload bandwidth.
#
# The 4th and 5th line creates the filter to match the interface.
# The 'dst' IP address is used to limit download speed, and the
# 'src' IP address is used to limit upload speed.

}

stop() {

# Stop the bandwidth shaping.
    $TC qdisc del dev $IF root

}

restart() {

# Self-explanatory.
    stop
    sleep 1
    start

}

show() {

# Display status of traffic control status.
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

    echo "Bandwidth shaping status for $IF:"
    show
    echo ""
    ;;

  *)

    pwd=$(pwd)
    echo "Usage: tc.bash {start|stop|restart|show}"
    ;;

esac

exit 0
 

