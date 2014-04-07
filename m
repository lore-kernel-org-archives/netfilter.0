From: John Rockwell <jerockwell@gmail.com>
Subject: Re: iptables + iproute2 policy-based routing issue
Date: Sun, 6 Apr 2014 22:11:40 -0400
Message-ID: <CALswCXmeBo3E4g11uK5YhP8Dtz9WWEZh+GYNBN2MrZP_sr=Q_Q@mail.gmail.com>
References: <CALswCXkt9g+gkKCwgH-7eVb_g9Hw4eVNFX7K=_-LWB-=sNoTgw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=pR4GviXKfgkZHvcbX0qiyupiW4OVgyJoneEivPhkmFk=;
        b=SSJo+LNrN4jYuH9tQs35ruUhPlnx1zheOsbyrQXmMql0y26CCxhbA5NusOQWHJMTRL
         BNnLbl9wpZa9EQPG22XuhIs0715TxuUaz9bZR/K1SE9+kOmNVBqRfXHOvfazYb8U3Hav
         seNdiG5R1kJdKnKfdSgEhilJvp4llpBnLafuWFLqrn5zFxeiJAYBGbyEWqB2DwsvPRKn
         GSJFjbzpW1Qxf1Y+fFbpUQ+n+iNh5kJ86BEdm2xIFY+gzNLDd3Gl7OJA5Foha9TbIlyM
         wt/pEKl+7PPlTybdHfaOtRABBZ3RTD8EnCl6Xexpi1RYXxwc+QghXBHK+bG1F2foNP1H
         up4A==
In-Reply-To: <CALswCXkt9g+gkKCwgH-7eVb_g9Hw4eVNFX7K=_-LWB-=sNoTgw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Sometimes all you need to do is ask a question and you figure out the answer...

I was missing two routes from the novpn route table:
ip route add 10.0.87.0/24 dev p4p1  proto kernel  scope link  src
10.0.87.16 table novpn
ip route add 10.11.0.0/16 dev tun0  proto kernel  scope link  src
10.11.0.97 table novpn  (routing the tun0 subnet back at the tun0
interface IP)
ip route flush cache (I had to run it again to flush out the route cache)

I'd already done this so it wasn't part of my issue, but for
posterity's sake you also need to disable reverse path filtering
(rp_filter):
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 0 > $f; done
(This works in Fedora anyway YMMV)

--JER


On Sun, Apr 6, 2014 at 9:29 PM, John Rockwell <jerockwell@gmail.com> wrote:
> I'm currently working on a setup utilizing iptables + iproute2 to
> force traffic from the localhost to any destination on TCP/80 or
> TCP/443 out my physical Ethernet NIC while everything else flows out
> tun0 (with return traffic flowing back through the corresponding
> interfaces).  I do not have split tunneling enabled in OpenVPN so all
> traffic is routing out tun0 prior to implementing the iptables +
> iproute2 rules/routes.  The host operating system is FC20.  Below are
> my configs:
>
> ip route flush cache
> ip route add default table novpn via 10.0.87.1
> ip route add 10.0.87.0/24 dev p4p1 table novpn
> ip rule add fwmark 1 table novpn
> ip rule add from 10.0.87.16 table novpn
> iptables -t mangle -A OUTPUT -p tcp --dport 80 -j MARK --set-mark 1
> iptables -t mangle -A OUTPUT -p tcp --dport 443 -j MARK --set-mark 1
> iptables -t nat -A POSTROUTING -o p4p1 -j SNAT --to 10.0.87.16
>
> I've got everything allowed outbound from the localhost and have
> opened up everything inbound while testing to no avail.
>
> With iptables logging rules I was able to verify that the outbound
> packets are being marked properly by iptables.  Wireshark shows
> bidirectional traffic between the proper source and destination, but
> that's where it begins to get strange...
>
> The flow looks something like:
>
> <my_ip> SYN TCP/60079 -> <dest_ip> TCP/80 Seq=0
> <dest_ip> SYN,ACK TCP/80 -> <my_ip> TCP/60079 Seq=0
> <my_ip> SYN TCP/60080 -> <dest_ip> TCP/80 Seq=0
> <dest_ip> SYN,ACK TCP/80 -> <my_ip> TCP/60080 Seq=0
>
> It then bounces back and forth with TCP/60079 and TCP/60080
> retransmissions for a while (all with a seq of 0) and eventually the
> far end sends a TCP RST which Wireshark identifies as being due to a
> packet being sent with a nonzero seq ID without the ACK bit being set.
>
> It seems like a TCP state issue, but despite reading everything I
> could find on the topic this one has me stumped.  Hopefully it's
> something simple that I've missed.
>
> Any advice that you could lend would be greatly appreciated.  Thanks!
>
>
> --JER
