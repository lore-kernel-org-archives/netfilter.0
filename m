From: Yan Seiner <yan@seiner.com>
Subject: Re: CONNTRACK and pppoe interfaces - marking does not work
Date: Mon, 1 Aug 2016 20:38:42 -0400
Message-ID: <5a026daf-87ac-67ab-0713-34c464a97a52@seiner.com>
References: <036276d0-5efe-6c08-5a49-faf6520b195b@seiner.com>
 <fb55d688-ed21-819b-2028-db08f3224959@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fb55d688-ed21-819b-2028-db08f3224959@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org



On 08/01/2016 08:09 PM, Pascal Hambourg wrote:
> Le 01/08/2016 à 22:28, Yan Seiner a écrit :
>> This is driving me nuts.  I've spent most of the day trying to figure
>> out why marking packets does not work.  I've now isolated the problem to
>> where I believe that neither MARK nor CONNMARK targets work on a pppoe
>> interface.
>
> This assumption is of course wrong. iptables and conntrack don't care 
> about the interface type.

It never has before.  This is why it's stumping me so badly.  Maybe I 
should have said on MY pppoe interface.

>
>> Here's what I have:
>>
>> eth0.9 - cable interface with DHCP: xxx.158.166.12
>> eth0.8 - DSL interface with pppoe: xxx.251.62.82
>>
>> and here's how I mark them (I've also tried marking on PREROUTING):
>>
>> iptables -t mangle -A INPUT -i ${dsl_if} -j CONNMARK --set-mark 
>> 0x02/0x02
>> iptables -t mangle -A INPUT -i ${cable_if} -j CONNMARK --set-mark 
>> 0x01/0x01
>
> What is the value of ${dsl_if} ? It should be pppN, created by pppd 
> with N=0, 1, 2...
>
This is with openWRT; no idea why they rename the interface, but it 
should still work. Everything else (all other iptables rules) work on 
that interface, everything except CONNMARK.

pppoe-dsl Link encap:Point-to-Point Protocol
           inet addr:xxx.251.62.82  P-t-P:xxx.251.52.2 Mask:255.255.255.255
           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
           RX packets:2759305 errors:0 dropped:0 overruns:0 frame:0
           TX packets:1732475 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:3
           RX bytes:3635826700 (3.3 GiB)  TX bytes:211953116 (202.1 MiB)

The pppd daemon:

2322 root     13592 S    /usr/sbin/pppd nodetach ipparam dsl ifname 
pppoe-dsl +ipv6 nodefaultroute usepeerdns maxfail 1 user xxx password 
xxx ip-up-script /lib/netifd/ppp-up ipv6-up-script /lib/netifd/ppp-up 
ip-down-script /lib/netifd

