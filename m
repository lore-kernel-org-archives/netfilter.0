From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: mangle vs. nat problem?
Date: Sun, 30 Aug 2009 20:46:03 -0400
Message-ID: <1251679563.6436.2.camel@jaspav.missionsit.net.missionsit.net>
References: <5427726c0908301651y59ef1babv7bbbe625f915ca01@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5427726c0908301651y59ef1babv7bbbe625f915ca01@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gothmolly <gothmolly@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 2009-08-30 at 19:51 -0400, Gothmolly wrote:
> Hello all, I am having trouble with a combination of the nat and
> mangle tables in the PREROUTING chain.   What I'd like to do is use
> mangle  and connmark to mark every other packet coming in on a port,
> then use nat to do a DNAT to 2 separate local ports, based on the
> connmark entries.
> 
> I use the following:
> iptables -t mangle -A PREROUTING -p udp --dport 514 -m statistic
> --mode nth --every 2 --packet 0 -j CONNMARK --set-mark 1
> iptables -t mangle -A PREROUTING -p udp --dport 514 -m statistic
> --mode nth --every 2 --packet 1 -j CONNMARK --set-mark 2
> 
> then
> 
> iptables -t nat -A PREROUTING -m connmark --mark 1 -j DNAT
> --to-destination 192.168.8.207:1514
> ptables -t nat -A PREROUTING -m connmark --mark 2 -j DNAT
> --to-destination 192.168.8.207:1515
> 
> (the machine is 192.168.8.207)
> 
> When I send traffic to the machine from a remote machine, I see that
> the count of the rules in the mangle table update perfectly - every
> other packet goes to every other rule.
> 
> On the nat table, I see far fewer packets matching, and most tend to
> go to the first rule.
> 
> Is there some conflict between nat and mangle in PREROUTING?  Or am I
> just doing this wrong ?
> 
> I am running the distribution included iptables on Ubuntu 9.04 x64
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
I'm not entirely sure but I would think the reduced number of packets
recorded is because of connection tracking.  I believe only the first
packet of the flow is being recorded because all subsequent packets are
handled by conntrack and not passed through the NAT table.

However, I do not know why you are not seeing an even distribution of
first packets.  I do not have a lot of experience with the connmark
match and target - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

