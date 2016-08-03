From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: CONNTRACK and pppoe interfaces - marking does not work
Date: Wed, 3 Aug 2016 20:44:26 +0200
Message-ID: <dd350669-8766-bfb7-e4a2-c9e9f12b3ee3@plouf.fr.eu.org>
References: <036276d0-5efe-6c08-5a49-faf6520b195b@seiner.com>
 <fb55d688-ed21-819b-2028-db08f3224959@plouf.fr.eu.org>
 <5a026daf-87ac-67ab-0713-34c464a97a52@seiner.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5a026daf-87ac-67ab-0713-34c464a97a52@seiner.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Le 02/08/2016 à 02:38, Yan Seiner a écrit :
>>>
>>> eth0.9 - cable interface with DHCP: xxx.158.166.12
>>> eth0.8 - DSL interface with pppoe: xxx.251.62.82
>>>
>>> and here's how I mark them (I've also tried marking on PREROUTING):
>>>
>>> iptables -t mangle -A INPUT -i ${dsl_if} -j CONNMARK --set-mark 0x02/0x02
>>> iptables -t mangle -A INPUT -i ${cable_if} -j CONNMARK --set-mark 0x01/0x01
>>
>> What is the value of ${dsl_if} ? It should be pppN, created by pppd
>> with N=0, 1, 2...
>>
> This is with openWRT;

Usually, devices running OpenWRT use a bridge, and iptables behaviour 
can be unintuitive with bridged packets, including PPPoE frames. If 
there is a bridge, which interfaces are bridged ?

brctl show

> no idea why they rename the interface, but it
> should still work. Everything else (all other iptables rules) work on
> that interface, everything except CONNMARK.
>
> pppoe-dsl Link encap:Point-to-Point Protocol
>           inet addr:xxx.251.62.82  P-t-P:xxx.251.52.2 Mask:255.255.255.255

Can you positively affirm that then interface name in the rule is 
pppoe-dsl ? For instance with

iptables-save -t mangle | grep "pppoe-dsl.*CONNMARK"

The next step is to LOG the packets which should be marked and check 
their input interface

iptables -t mangle -I PREROUTING -d xxx.251.62.82 -j LOG

> The pppd daemon:
>
> 2322 root     13592 S    /usr/sbin/pppd nodetach ipparam dsl ifname
> pppoe-dsl +ipv6 nodefaultroute usepeerdns maxfail 1 user xxx password
> xxx ip-up-script /lib/netifd/ppp-up ipv6-up-script /lib/netifd/ppp-up
> ip-down-script /lib/netifd

I do not see a "plugin" nor "pty" option, which one is used ?
