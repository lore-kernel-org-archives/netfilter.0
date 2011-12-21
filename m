From: Aadith Koshy <ak699f@att.com>
Subject: Details on iif in ip rule
Date: Tue, 20 Dec 2011 18:08:06 -0600
Message-ID: <9E4E4FA919634D48ADBF608395D283EE0721B63257@exc-aus-0001>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Team,

I am having some trouble understanding 'iif' on the ip rules. Let me explain what I am trying out. I have 3 virtual interfaces on a single interface.

eth0       192.168.4.0/24
eth0:1   192.168.5.0/24
eth0:2   192.168.6.0/24
eth0:3   192.168.7.0/24


I have all the interfaces setup with dhcp servers and they are able to hand out 
I have rules that direct traffic from each of the interfaces except eth0:2 to a route table as follows

ip rule add from 192.168.4.0/24 lookup 100
ip rule add from 192.168.5.0/24 lookup 100
ip rule add from 192.168.7.0/24 lookup 100
from all lookup main
from all lookup default

I expect that all traffic from 192.168.4.0/24, 192.168.5.0/24 and 192.168.7.0/24 will be routed to table 100. Traffic from 192.168.6.0/24 would be routed to main table. 

The issue I am facing that traffic from 192.168.6.0/24 is being dropped at the INPUT chain of the filter table. 

What is more strange and the issue that has been bothering me is when I have the rules as below

ip rule add from 192.168.4.0/24 iif eth0 lookup 100
ip rule add from 192.168.5.0/24 iif eth0 lookup 100
ip rule add from 192.168.7.0/24 iif eth0 lookup 100
from all lookup main
from all lookup default


So with the iif set on the rules, I am able to get the traffic from the subnet 192.168.6.0/24. Why would adding the iif on the rules work? The iif rule is not even on the interface in question. I read the iif documentation of ip rule but it was not sufficient to answer my question.

Any help would be greatly appreciated. 

Thanks,
Aadith

PS: Resending as the previous mail was reported as undeliverable
