From: Donald Schlicht <dschlic1@gmail.com>
Subject: Re: Help with routing ping requests
Date: Mon, 20 Jul 2015 15:54:39 -0400
Message-ID: <CAA0NJifZuWK2RqfAVGPXLR=CtBScULVz8GWKAZhBU=tSZq-FuA@mail.gmail.com>
References: <CAA0NJieGe771feM-0k5nyEqzXwfrHp+hwOt9t+=yJ7rmq+ERUg@mail.gmail.com>
	<20150720121703.6cd673af@playground>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=ZfmyHObxwcRzpvuwT/w3OGNLuR6PR7l8t3EufduG9KI=;
        b=lRcXJns7o6Nxy2nEA82GuQXm3nf5mvh6OBXnSbRQvhMgCiASfZJoNDHepF2oHUChGJ
         zI7gvtgzKLUGOIe+VgsY9WeCD/vXrYg9aa+0ngoj47SW/4bxriRE96JjhKUaCcV/G7Pu
         n4eJmzF9gzMfsU4iwDn/+5BZHtcpAzPtilLfPH8hFuJi/hu3gkSF4JQN3XlWG/enNRg+
         xXocP1PJuO8lr68l/ZA3zRKzW5Rf94s8cmlu4/rsLw1IHqAaXUetM5tY0PksIPDpePJ9
         a003h4GqYUIoA3GFeMjpbkJ+iZIAZPGR49tCxyuyCrI3bKqVSdgTKtg78C1PIIHXAbie
         eyIQ==
In-Reply-To: <20150720121703.6cd673af@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

 Here is the listing from tables PREROUTING, FORWARD and POSTROUTING
after pinging the router four times:

\u@\h:\w\$ iptables -t nat -L PREROUTING -n -v
Chain PREROUTING (policy ACCEPT 2245 packets, 159K bytes)
 pkts bytes target     prot opt in     out     source               destination
    1    60 DNAT       icmp --  *      *       0.0.0.0/0
0.0.0.0/0           to:192.168.1.200
    0     0 DNAT       tcp  --  *      *       0.0.0.0/0
72.64.140.67        tcp dpt:23 to:192.168.1.1:23
    0     0 DNAT       icmp --  *      *       0.0.0.0/0
72.64.140.67        to:192.168.1.1
    0     0 TRIGGER    0    --  *      *       0.0.0.0/0
72.64.140.67        TRIGGER type:dnat match:0 relate:0
\u@\h:\w\$ iptables -L FORWARD -n -v
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    4   240 logaccept  icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     47   --  *      vlan1   192.168.1.0/24       0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      vlan1   192.168.1.0/24
0.0.0.0/0           tcp dpt:1723
    0     0 ACCEPT     0    --  br0    br0     0.0.0.0/0            0.0.0.0/0
    0     0 TCPMSS     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU
    0     0 lan2wan    0    --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 TRIGGER    0    --  vlan1  br0     0.0.0.0/0
0.0.0.0/0           TRIGGER type:in match:0 relate:0
    0     0 trigger_out  0    --  br0    *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     0    --  br0    *       0.0.0.0/0
0.0.0.0/0           state NEW
    0     0 DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0
\u@\h:\w\$ iptables -t nat -L POSTROUTING -n -v
Chain POSTROUTING (policy ACCEPT 4 packets, 286 bytes)
 pkts bytes target     prot opt in     out     source               destination
    1    60 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 SNAT       0    --  *      vlan1   0.0.0.0/0
0.0.0.0/0           to:72.64.140.67
    0     0 RETURN     0    --  *      br0     0.0.0.0/0
0.0.0.0/0           PKTTYPE = broadcast
    0     0 MASQUERADE  0    --  *      br0     192.168.1.0/24
192.168.1.0/24
\u@\h:\w\$

Hope this helps

On Mon, Jul 20, 2015 at 12:17 PM, Neal P. Murphy
<neal.p.murphy@alum.wpi.edu> wrote:
> On Mon, 20 Jul 2015 09:05:29 -0400
> Donald Schlicht <dschlic1@gmail.com> wrote:
>
>> I am using Wireshark to sniff IP packets on both the WAN side and the
>> LAN side. It is good to know that the packets are passing through the
>> tables correctly. Anyone have an idea why I'm not seeing anything on
>> the LAN side?
>>
>> >> I have an application where I need to configure a router to pass
>> >> through ping requests (ICMP type 8) through to the LAN port. I
>> >> have a Linksys WRT54GS with tiny DD-WRT V24 SP2 installed. I am
>> >> adding the following iptables rules:
>> >>
>> >> iptables -t nat -I PREROUTING -p icmp --icmp-type 8 -s
>> >> 72.64.140.50 -j DNAT --to-destination 192.168.1.200
>> >> iptables -t filter -I FORWARD -p icmp --icmp-type 8 -s
>> >> 72.64.140.50 -d 192.168.1.200 -j ACCEPT
>> >>  iptables -t nat -I POSTROUTING -p icmp --icmp-type 8 -s
>> >> 72.64.140.50 -d 192.168.1.200 -j ACCEPT
>
> That third rule is not needed--and mayn't do anything anyway.
>
> I added the equivalent of your PREROUTING and FORWARD rules to my
> perimeter F/W; they work. (One difference: since my filter:FORWARD has
> a blanket "-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT"
> rule, I added "-m state --state NEW" to my equivalent of your second
> (FORWARD) rule.
>
> Since *one* request gets through, we can say the NAT rule works. That
> leaves FORWARD. What else is in filter:FORWARD? Your FORWARD rule maybe
> in the wrong position; you may need to insert it later in the chain.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
