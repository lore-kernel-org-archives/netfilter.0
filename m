From: Jason Cosby <sky_jason@yahoo.com>
Subject: IPMARK
Date: Sat, 20 Sep 2008 00:14:43 -0700 (PDT)
Message-ID: <89587.69324.qm@web37306.mail.mud.yahoo.com>
Reply-To: sky_jason@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nozo@ziu.info
Cc: netfilter@vger.kernel.org

Thank you so much for taking the time to help me out. If I could pick this apart a bit more and understand it, I would be on my way. 

eth=eth1--this refers to LAN dev or NET dev? (I ran the first line via ssh below on LAN dev and it locked up the machine. This is for egress then? I neglected to mention that ingress is what I seek to control initially, which will require IMQ AFAIK. When finished, I'll have done the math and controlled egress to the point where ingress is very close to where it needs to be without policing.) 

tc class add dev $eth parent 1:0 classid 1:1 hfsc ls m2 512kbps \
ul m2 512kbps

ls=link sharing, ul=upper limit, clear on those. m2 is synonimous with sc?


tc class add dev $eth parent 1:1 classid 1:101 hfsc rt m2 60kbps \
ls m2 200kbps

rt=realtime, clear on that. Not clear on 200kbps spec. Related to upper limit or can borrow up to 200?

tc qdisc add dev $eth handle 101:0 parent 1:101 pfifo limit 10

pfifo because we don't need anything more advanced here, we don't know what kind of traffic we're catching, don't know destination for IP based queue, catching fragments, or some other reason?


tc class add dev $eth parent 1:1 classid 1:102 hfsc rt m2 400kbps \
ls m2 400kbps

I'm not tracking on how we can have 400kbps of realtime and linksharing simultaneously. They're not mutually exclusive? Not sure what the 1:2 ratio (200:400) translates to, but I know that understanding this is vital. 

tc qdisc add dev $eth handle 102:0 parent 1:102 sfq limit 20 perturb 10 quantum 1

How did we arrive at limit of 20? quantum 1 is to ensure maximum granularity vs. a higher number?

iptables -t mangle -A FORWARD -o $eth -m iprange --src-range 192.168.1.6-192.168.1.40 -j CLASSIFY --set-class 1:102

This is gold and what I was searching for (before hfsc got my interest). Makes perfect sense. 

Thanks so much. Hopefully others will benefit from the light being shed on hfsc here.

Jason
