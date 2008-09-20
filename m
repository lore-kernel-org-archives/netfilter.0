From: Michal Soltys <nozo@ziu.info>
Subject: Re: IPMARK
Date: Sat, 20 Sep 2008 14:22:37 +0200
Message-ID: <48D4EB0D.4070207@ziu.info>
References: <89587.69324.qm@web37306.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <89587.69324.qm@web37306.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sky_jason@yahoo.com
Cc: netfilter@vger.kernel.org

Jason Cosby wrote:
> Thank you so much for taking the time to help me out. If I could pick
> this apart a bit more and understand it, I would be on my way.
> 
> eth=eth1--this refers to LAN dev or NET dev? (I ran the first line
> via ssh below on LAN dev and it locked up the machine. This is for
> egress then? I neglected to mention that ingress is what I seek to
> control initially, which will require IMQ AFAIK. When finished, I'll
> have done the math and controlled egress to the point where ingress
> is very close to where it needs to be without policing.)
> 

Yes, I meant egress. For ingress you need IMQ, or these days - IFB ( 
http://www.linuxfoundation.org/en/Net:IFB ). Controlling on ingress and 
how much point is in it (as bandwidth is already wasted), is a 
controversial subject :). Besides, as it's your router - you can shape 
on egress on the other side, unless you want to alter traffic coming to 
router itself.

> tc class add dev $eth parent 1:0 classid 1:1 hfsc ls m2 512kbps \ ul
> m2 512kbps
> 
> ls=link sharing, ul=upper limit, clear on those. m2 is synonimous
> with sc?
> 

m2 is the slope of the second part of the curve (ls or rt one). m1 
(unused here) is the first one. It allows for non-linear curve 
specification, when initial delay is important (e.g. in voip). Sc (short 
for service curve) can be used instead of specifying rt and ls (when the 
same value is used).

> tc class add dev $eth parent 1:1 classid 1:101 hfsc rt m2 60kbps \ ls
>  m2 200kbps
> 
> rt=realtime, clear on that. Not clear on 200kbps spec. Related to 
> upper limit or can borrow up to 200?
> 
> I'm not tracking on how we can have 400kbps of realtime and 
> linksharing simultaneously. They're not mutually exclusive? Not sure
>  what the 1:2 ratio (200:400) translates to, but I know that 
> understanding this is vital.
> 

Realtime (rt) and linkshare (ls) curves are independent. First always rt 
is considered, and class hierarchy is irrelevant here - only leafs are 
checked. Only and only after that - linksharing and class hierarchy is 
considered. Concept of borrowing doesn't exist in hfsc.

I can imagine it's a bit messy explanation without the basics about 
hfsc. It's probably best to read about the whole thing, check out:

http://www.cs.cmu.edu/~istoica/hfsc-tr.ps.gz

For more gentle introductions:

http://www.sonycsl.co.jp/~kjc/software/TIPS.txt (section related to 
hfsc, but note this is BSD implementation specific - afaik, there's no 
80% bw limit for realtime in linux, and I'm not sure if convex curves 
are implemented the same [simplified] way. Either way, it's pretty nice 
intro).

http://linux-ip.net/articles/hfsc.en/
http://marc.info/?t=107799591400001&r=1&w=2

> 
> pfifo because we don't need anything more advanced here, we don't
> know what kind of traffic we're catching, don't know destination for
> IP based queue, catching fragments, or some other reason?
> 

pfifo (or bfifo), because if you don't specify it explicitly, queue 
length will be taken from interface's txqueuelen. You can of course 
alter it with ip link set dev eth0 txqueuelen <nbr>, but that's the 
default for all leaf qdiscs not specified explicitly (they get 
pfifo_fast with interface's txqueuelen). Well - whatever qdisc you use, 
is up to you - for the sake of this example pfifo was a good choice ;)


> tc qdisc add dev $eth handle 102:0 parent 1:102 sfq limit 20 perturb
> 10 quantum 1
> 
> How did we arrive at limit of 20? quantum 1 is to ensure maximum
> granularity vs. a higher number?
> 

check: man tc-sfq , tc qdisc add sfq help, and 
http://ace-host.stuart.id.au/russell/files/tc/doc/sch_sfq.txt

Remember about mentioned 'tc filter flow' in this case.

As for the queue length - well it depends on many things - bandwidth, HZ 
of your kernel (to be honest, I don't know how tickless (NO_HZ) option 
influences this - anyone could shed some light on it ?), how much delay 
is acceptable, how the typical traffic looks like in your case, etc.

> iptables -t mangle -A FORWARD -o $eth -m iprange --src-range
> 192.168.1.6-192.168.1.40 -j CLASSIFY --set-class 1:102
> 
> This is gold and what I was searching for (before hfsc got my
> interest). Makes perfect sense.
> 

Don't forget about IPSET and CONNMARK which can give a great deal of 
extra flexibility.

