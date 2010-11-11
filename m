From: J Webster <jw.jwebster@googlemail.com>
Subject: Re: limit bandwidth equally
Date: Thu, 11 Nov 2010 13:07:30 +0100
Message-ID: <4CDBDC82.6020006@googlemail.com>
References: <4CD7D742.2040702@googlemail.com> <4CD926C6.8070604@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=a4Uv5HFBqA90sXh8oRF8rCugTZ5oF7vLoqa9QS5CY70=;
        b=fT7D814TLxRJqVyFSq1RLkjGJe/Hd4p/PsJ1SUkfT+JFkCPFZI8kNKAvMifE2u6WFt
         NJVQ4mjTlfU5fwpIkmX4iOfxd6dz68uX2ljHkp9kPYG0/dmS87kOvNWpWu9llSbyYpzo
         MPuPHYCA+pjEKU427iL2DcJ4Avx4GAigFBAJE=
In-Reply-To: <4CD926C6.8070604@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>, netfilter@vger.kernel.org

I am using the following script for tc/htb.
My server has 2 VPN services and a proxy server.
The proxy server already limits using delay pools but I need to add a 
1Mbps limit for every IP connecting to the VPN.
The VPN is on tun1 and tun 0.
Does the tc script go in the same folder as iptables.../etc/sysconfig?

This is my ip a:
[root sarg]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue
     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
     inet 127.0.0.1/8 scope host lo
     inet6 ::1/128 scope host
        valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast 
qlen 100
     link/ether 00:19:99:63:5a:a3 brd ff:ff:ff:ff:ff:ff
     inet 88.xxx.xxx.xx8/22 brd 88.208.239.255 scope global eth0
     inet 88.xxx.xxx.xx9/22 brd 88.208.239.255 scope global secondary eth0:0
     inet6 fe80::219:99ff:fe63:5aa3/64 scope link
        valid_lft forever preferred_lft forever
3: sit0: <NOARP> mtu 1480 qdisc noop
     link/sit 0.0.0.0 brd 0.0.0.0
53: tun1: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc 
pfifo_fast qlen 100
     link/[65534]
     inet 10.8.0.1 peer 10.8.0.2/32 scope global tun1
54: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1460 qdisc 
pfifo_fast qlen 100
     link/[65534]
     inet 172.16.0.1 peer 172.16.0.2/32 scope global tun0
[root sarg]#


tc script:
#!/bin/bash
#
# tc uses the following units when passed as a parameter.
# kbps: Kilobytes per second
# mbps: Megabytes per second
# kbit: Kilobits per second
# mbit: Megabits per second
# bps: Bytes per second
# Amounts of data can be specified in:
# kb or k: Kilobytes
# mb or m: Megabytes
# mbit: Megabits
# kbit: Kilobits
# To get the byte figure from bits, divide the number by 8 bit
#

#
# Name of the traffic control command.
TC=/sbin/tc
# The network interface we're planning on limiting bandwidth.
IF=eth0 # Interface
# Download limit (in mega bits)
DNLD=1mbit # DOWNLOAD Limit
# Upload limit (in mega bits)
UPLD=1mbit # UPLOAD Limit
# IP address of the machine we are controlling
IP=10.8.0.0/32 # Host IP
IP=172.16.0.0/32 # Host IP
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

iptables:
iptables -t mangle -A OUTPUT -p tcp -m owner --uid-owner test -j MARK 
--set-mark 1
