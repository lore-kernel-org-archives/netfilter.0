From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: traffic shaping / full HFSC class no effect on ping time?
Date: Tue, 22 Oct 2013 16:05:17 -0700
Message-ID: <20131022160517.57e4ad21@nehalam.linuxnetplumber.net>
References: <52668032.40304@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <52668032.40304@yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: patrick <nocommercials45@yahoo.com>
Cc: netfilter@vger.kernel.org

On Tue, 22 Oct 2013 15:40:02 +0200
patrick <nocommercials45@yahoo.com> wrote:

> hi,
> 
> 
> im playing around with traffic shaping(ingress) and was wondering why 
> this basic HFSC setup does not influence ping time?
> all traffic goes into default class 1:30, when downloading wget shows a 
> speed of 205kb/s which is 15kbyte/s less then expected but this is 
> probably just a estimate over time.
> since tcp does into congestion avoidance after slow start at some point 
> it will fill the download queue completely and ping should suffer.
> but it doesnt, why is that?
> 
> 
> ping -c 100 google.com says:
> without download:
> rtt min/avg/max/mdev = 5.908/6.151/6.445/0.112 ms
> with download:
> rtt min/avg/max/mdev = 5.867/6.133/6.489/0.129 ms
> 
> eth1 is the interface facing the big bad internet
> 
> 
> traffic shaper script output is:
> + ip link set dev ifb0 up
> + tc qdisc add dev eth1 handle ffff: ingress
> + tc filter add dev eth1 parent ffff: protocol ip prio 1 u32 match u32 0 
> 0 action mirred egress redirect dev ifb0
> + tc qdisc add dev ifb0 root handle 1: hfsc default 30
> + tc class add dev ifb0 parent 1: classid 1:1 hfsc sc rate 1760kbit ul 
> rate 1760kbit
> + tc class add dev ifb0 parent 1:1 classid 1:30 hfsc sc rate 1760kbit ls 
> rate 1760kbit

Ingress traffic handling is 'traffic policing' i.e drop only, you can't put qdisc or
filters directly ingress and have it do anything.

You can do incoming traffic shaping by using the input-functional-block (ifb)
device. Basically, you redirect traffic to the ifb device, and put the qdisc
on that pseudo-device and the qdisc runs.


