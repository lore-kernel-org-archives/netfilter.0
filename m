From: patrick <nocommercials45@yahoo.com>
Subject: traffic shaping / full HFSC class no effect on ping time?
Date: Tue, 22 Oct 2013 15:40:02 +0200
Message-ID: <52668032.40304@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1382449207; bh=nP70QM4/LyYAE+s9VYQI+Kfz1Rhrvn73edyLc7bQfFk=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=WouVpYwf6zExvHwbn2J4sTaaFw1hlPvqKn1Wl3NM18Wsg6LtZcFuEQIvevxY2il9le+E81SnUtkXU1nKkqr8VpTqii7axpZrhmKnPeNNWjC0ILdjEGxcoGQqZkhjykbk8d5zkeUJxmNSjSuwT/jNsx9SUpfwxlOrCPyr7G2Fvvg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

hi,


im playing around with traffic shaping(ingress) and was wondering why 
this basic HFSC setup does not influence ping time?
all traffic goes into default class 1:30, when downloading wget shows a 
speed of 205kb/s which is 15kbyte/s less then expected but this is 
probably just a estimate over time.
since tcp does into congestion avoidance after slow start at some point 
it will fill the download queue completely and ping should suffer.
but it doesnt, why is that?


ping -c 100 google.com says:
without download:
rtt min/avg/max/mdev = 5.908/6.151/6.445/0.112 ms
with download:
rtt min/avg/max/mdev = 5.867/6.133/6.489/0.129 ms

eth1 is the interface facing the big bad internet


traffic shaper script output is:
+ ip link set dev ifb0 up
+ tc qdisc add dev eth1 handle ffff: ingress
+ tc filter add dev eth1 parent ffff: protocol ip prio 1 u32 match u32 0 
0 action mirred egress redirect dev ifb0
+ tc qdisc add dev ifb0 root handle 1: hfsc default 30
+ tc class add dev ifb0 parent 1: classid 1:1 hfsc sc rate 1760kbit ul 
rate 1760kbit
+ tc class add dev ifb0 parent 1:1 classid 1:30 hfsc sc rate 1760kbit ls 
rate 1760kbit





complete script:
#!/bin/bash
set -x
#in kbit
downlink=1760 #220*8

uplink=245 #~30kbyte/s

#dev=tun1
dev=eth1
mod_command=modprobe

indev=ifb0 #incoming traffic ( really the interface connected to the 
internet, but with this "workaround" you can use egress for inbound 
traffic )


setup() {
     echo "    loading modules"
     for module in ifb sch_sfq sch_htb sch_ingress act_mirred xt_mark 
cls_u32 cls_fw;
     do
         if lsmod|grep $module 2>&1 >/dev/null; then
             echo "already loaded";
         else
             $mod_command $module;
         fi
     done

     echo "outgoing device" $dev
}










download() {
     #redirect traffic before it enters etho to ifb0, classify and then 
send whats coming out of ifb0 back to eth0
     ip link set dev $indev up
     tc qdisc add dev $dev handle ffff: ingress
     tc filter add dev $dev parent ffff: protocol ip prio 1 \
         u32 match u32 0 0 action mirred egress redirect dev $indev

     #root
     tc qdisc add dev $indev root handle 1: hfsc default 30
     #set max download speed
     tc class add dev $indev parent 1: classid 1:1 hfsc sc rate 
${downlink}kbit ul rate ${downlink}kbit
     #ALL
     tc class add dev $indev parent 1:1 classid 1:30 hfsc sc rate 
${downlink}kbit ls rate ${downlink}kbit
}



download_filters() {
     echo ""

}





start() {
     stop
     setup
     #upload
     download
     download_filters
     #upload_filter -A
}



stop() {
     echo "    stop()"
     # clean existing down- and uplink qdiscs, hide errors
     #REMOVE    iptables filters:
     upload_filter -D ">/dev/null 2>&1"
     tc qdisc del dev $dev root    2> /dev/null > /dev/null
     tc qdisc del dev $dev ingress 2> /dev/null > /dev/null
     tc qdisc del dev $indev root    2> /dev/null > /dev/null
     tc qdisc del dev $indev ingress 2> /dev/null > /dev/null
}



restart() {
     stop
     sleep 1
     start

}



show() {

     # Display status of traffic control status.
     echo "classes:"
     echo "out":
     tc -s class show dev $dev
     echo "in:"
     tc -s class show dev $indev
}



case "$1" in

     start)
         start
         ;;

     stop)
         stop
         ;;

     restart)
         restart
         ;;

     show)
         show
         ;;

     setup)
         setup
         ;;
     upload_only)
         echo "        WARNING:"
         echo "        dont forget to remove iptables entries manually"
         echo "        only setting up upload chains and filters"
         upload
         upload_filter -A
         ;;
     *)

         pwd=$(pwd)
         echo "Usage: test-ts.sh {start|stop|restart|show}"
         ;;

esac

exit 0

