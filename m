From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: mangle with iptables
Date: Tue, 18 Aug 2009 10:34:52 -0400
Message-ID: <1250606092.6494.0.camel@jaspav.missionsit.net.missionsit.net>
References: <cfeab66d0908180547l6f661f0bg7c27ffb4be3900b8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d0908180547l6f661f0bg7c27ffb4be3900b8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2009-08-18 at 18:17 +0530, ratheesh k wrote:
> I have following rules ... Problem i am facing is tat  filters are not
> working ... But funny things if u put magle rules like
> iptables -t mangle -A FORWARD  -j MARK --set-mark 3 , it is working
> ... .  Pks are hitting the rule on both cases ...  wat could be the
> problem ??? any clue will be greatly  appreciated ....
> 
> 
> 
> 
> 
> 
> 
> #!/bin/bash
> 
> ####################### Ingress side ########################
> 
> iptables -t mangle -A FORWARD -i eth2 -s 10.2.0.0/24 -j MARK --set-mark 3
> iptables -t mangle -A FORWARD -i eth2 -s 10.2.0.24 -j MARK --set-mark 1
> 
> 
> iptables -t mangle -A FORWARD -i eth2 -s 10.2.0.3 -j MARK --set-mark 2
> 
> ######################## Egress side ########################
> 
> tc qdisc add dev eth1 handle 1:0 root dsmark indices 64 set_tc_index
> 
> tc class change dev eth1 classid 1:1 dsmark mask 0x3 value 0xb8
> tc class change dev eth1 classid 1:2 dsmark mask 0x3 value 0x28
> tc class change dev eth1 classid 1:3 dsmark mask 0x3 value 0x48
> 
> tc filter add dev eth1 parent 1:0 protocol ip prio 4 handle 1 fw classid 1:1
> tc filter add dev eth1 parent 1:0 protocol ip prio 4 handle 2 fw classid 1:2
> tc filter add dev eth1 parent 1:0 protocol ip prio 4 handle 3 fw classid 1:3
<snip>
I might be a bit rusty but wouldn't one normally put those MARK rules in
the PREROUTING chain? - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

