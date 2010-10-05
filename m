From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: Limiting Network traffic
Date: Tue, 5 Oct 2010 14:44:35 +0900
Message-ID: <20101005144435.375ad28c@s6510>
References: <4CAA09E7.5070207@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CAA09E7.5070207@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On Mon, 04 Oct 2010 18:07:51 +0100
Jonathan Tripathy <jonnyt@abpni.co.uk> wrote:

> Hi Everyone,
> 
> I'm try to use the script below to throttle a Xen VM. However, it's not 
> working. The script does seem to execute ok though. All my Xen DomU 
> interfaces are connected to a bridge on the Xen host. I have a firewall 
> VM running on this machine which the VMs use. No matter if I put the VM 
> interface, the firewall interface, or the bridge name itself in the IF 
> field, it never works. Any help is appreciated. Thanks
> 
> #!/bin/bash
> #
> #  tc uses the following units when passed as a parameter.
> #  kbps: Kilobytes per second
> #  mbps: Megabytes per second
> #  kbit: Kilobits per second
> #  mbit: Megabits per second
> #  bps: Bytes per second
> #       Amounts of data can be specified in:
> #       kb or k: Kilobytes
> #       mb or m: Megabytes
> #       mbit: Megabits
> #       kbit: Kilobits
> #  To get the byte figure from bits, divide the number by 8 bit
> #
> TC=/sbin/tc
> IF=tap1.0		    # Interface
> DNLD=1mbit          # DOWNLOAD Limit
> UPLD=1mbit          # UPLOAD Limit
> IP=216.3.128.12     # Host IP
> U32="$TC filter add dev $IF protocol ip parent 1:0 prio 1 u32"
> 
> start() {
> 
>      $TC qdisc add dev $IF root handle 1: htb default 30
>      $TC class add dev $IF parent 1: classid 1:1 htb rate $DNLD
>      $TC class add dev $IF parent 1: classid 1:2 htb rate $UPLD
>      $U32 match ip dst $IP/32 flowid 1:1
>      $U32 match ip src $IP/32 flowid 1:2
> 
> }
> 
> stop() {
> 
>      $TC qdisc del dev $IF root
> 
> }
> 
> restart() {
> 
>      stop
>      sleep 1
>      start
> 
> }
> 
> show() {
> 
>      $TC -s qdisc ls dev $IF
> 
> }
> 
> case "$1" in
> 
>    start)
> 
>      echo -n "Starting bandwidth shaping: "
>      start
>      echo "done"
>      ;;
> 
>    stop)
> 
>      echo -n "Stopping bandwidth shaping: "
>      stop
>      echo "done"
>      ;;
> 
>    restart)
> 
>      echo -n "Restarting bandwidth shaping: "
>      restart
>      echo "done"
>      ;;
> 
>    show)
>      	    	
>      echo "Bandwidth shaping status for $IF:\n"
>      show
>      echo ""
>      ;;
> 
>    *)
> 
>      pwd=$(pwd)
>      echo "Usage: $(/usr/bin/dirname $pwd)/tc.bash {start|stop|restart|show}"
>      ;;
> 
> esac
> 
> exit 0

Normal traffic shaping happens on an outgoing interface.
Doing shaping on the virtual domU interfaces will control rate to a domU
Doing shaping on bridge interface will control rate into dom0

You probably want to control rate from domU outbound. To do that you
have several choices:
   0. Do it on virtual interface in guest; requires cooperative guest but it
      provides best performance and flow control
   1. Use ingress and limiting on domU interface; this drops packets over a set
      threshold.  Performance will be worse but easier to setup
   2. Use ifb device.  In dom0, for each domU interface setup a coresponding ifb device
      and use tc redirect to that ifb device, then apply shaping to the ifb device
      Alternatively have a single ifb device and redirect each domU incoming traffic to
      the ifb device. Then use rules to break traffic into classes, and have rates per class.
   3. There is the also IMQ patch, but it is not recommended. The IMQ design is unsafe
      and ifb is better.


