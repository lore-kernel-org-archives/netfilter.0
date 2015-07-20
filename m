From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Help with routing ping requests
Date: Mon, 20 Jul 2015 12:17:03 -0400
Message-ID: <20150720121703.6cd673af@playground>
References: <CAA0NJieGe771feM-0k5nyEqzXwfrHp+hwOt9t+=yJ7rmq+ERUg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA0NJieGe771feM-0k5nyEqzXwfrHp+hwOt9t+=yJ7rmq+ERUg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, 20 Jul 2015 09:05:29 -0400
Donald Schlicht <dschlic1@gmail.com> wrote:

> I am using Wireshark to sniff IP packets on both the WAN side and the
> LAN side. It is good to know that the packets are passing through the
> tables correctly. Anyone have an idea why I'm not seeing anything on
> the LAN side?
> 
> >> I have an application where I need to configure a router to pass
> >> through ping requests (ICMP type 8) through to the LAN port. I
> >> have a Linksys WRT54GS with tiny DD-WRT V24 SP2 installed. I am
> >> adding the following iptables rules:
> >>
> >> iptables -t nat -I PREROUTING -p icmp --icmp-type 8 -s
> >> 72.64.140.50 -j DNAT --to-destination 192.168.1.200
> >> iptables -t filter -I FORWARD -p icmp --icmp-type 8 -s
> >> 72.64.140.50 -d 192.168.1.200 -j ACCEPT
> >>  iptables -t nat -I POSTROUTING -p icmp --icmp-type 8 -s
> >> 72.64.140.50 -d 192.168.1.200 -j ACCEPT

That third rule is not needed--and mayn't do anything anyway.

I added the equivalent of your PREROUTING and FORWARD rules to my
perimeter F/W; they work. (One difference: since my filter:FORWARD has
a blanket "-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT"
rule, I added "-m state --state NEW" to my equivalent of your second
(FORWARD) rule.

Since *one* request gets through, we can say the NAT rule works. That
leaves FORWARD. What else is in filter:FORWARD? Your FORWARD rule maybe
in the wrong position; you may need to insert it later in the chain.
