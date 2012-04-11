From: John Lister <john.lister@kickstone.com>
Subject: Re: IPTables
Date: Wed, 11 Apr 2012 07:33:21 +0100
Message-ID: <4F8525B1.9030300@kickstone.com>
References: <CAODtcdf9shdm-KWvrjGHyDwjJL_p9pE4BdeSKELSTC6ww0p03g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAODtcdf9shdm-KWvrjGHyDwjJL_p9pE4BdeSKELSTC6ww0p03g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Al Grant <bigal.nz@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

You say your router forwards port 5555 to port 80 on the pc, if that is 
the case, then you need a rule to map port 80 on 192.168.1.71 to 
192.168.70.140. Something like

iptables -t nat -A PREROUTING -i wlan0  -d 192.168.1.71 --dport 80 -j 
DNAT --to 192.168.70.140

make sure that your FORWARD rule allows it through. You also probably 
need to add this depending on your routing tables

iptables -t nat -A POSTROUTING -i wlan0 -d 192.168.70.140 --dport 80 -j 
SNAT --to 192.168.1.71

to handle the reverse case and route the packets back out.

I'm half asleep so i'd test these fully first :)

John

-- 
www.pricegoblin.co.uk


On 11/04/2012 04:03, Al Grant wrote:
> Hiya All,
>
>
>
> I am after a little guidance please on the following problem:
>
>
>
> My topology is as follows:
>
>
>
> inet----router 192.168.1.254-------wlan0 192.168.1.71&&  eth0
> 192.168.70.121------ip camera 192.168.70.140:80
>
>
>
> Note:
>
> (1) eth0 and wlan0 are on a PC running Ubuntu.
>
> (2) Port 5555 on the router is forwarded to 80 on 192.168.1.71
>
> (2) in sysctl I have set sysctl net.ipv4.ip_forward=1
>
>
>
> Now what I need to do is to be able to access the IP camera from the inet.
>
>
>
> So I have tried adding IPTables:
>
> iptables -t nat -A PREROUTING -i wlan0 -d 192.168.1.71 -p tcp --dport
> 5555 -j DNAT --to 192.168.70.140:80
>
>
>
> Now this should allow me to access the camera by pointing a web
> browser to the real world public ip on port 5555, however I get page
> cannot be displayed.
>
>
>
> I have verified that:
>
> 1. That camera is accessable from the Ubuntu computer via web browser and ping
>
>
>
> Various people have suggsted I may need to modify conntrack and others
> have suggested I may need a second rule.
>
>
>
> Can anyone please help?
>
>
>
> Thanks in advance
>
> AL
>
>
> --
> "Beat it punk!"
> - Clint Eastwood
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


