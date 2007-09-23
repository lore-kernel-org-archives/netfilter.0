From: Gerry Reno <greno@verizon.net>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 08:40:30 -0400
Message-ID: <46F65EBE.30502@verizon.net>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F65D0E.6050005@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

And here is what a typical firewall looks like on Fedora if you don't 
already have a Fedora setup:

# service iptables status
Table: filter
Chain INPUT (policy ACCEPT)
num target prot opt source destination
1 RH-Firewall-1-INPUT 0 -- 0.0.0.0/0 0.0.0.0/0

Chain FORWARD (policy ACCEPT)
num target prot opt source destination
1 REJECT 0 -- 0.0.0.0/0 0.0.0.0/0 reject-with icmp-host-prohibited

Chain OUTPUT (policy ACCEPT)
num target prot opt source destination

Chain RH-Firewall-1-INPUT (1 references)
num target prot opt source destination
1 ACCEPT 0 -- 0.0.0.0/0 224.0.0.18
2 ACCEPT 0 -- 0.0.0.0/0 0.0.0.0/0
3 ACCEPT icmp -- 0.0.0.0/0 0.0.0.0/0 icmp type 255
4 ACCEPT esp -- 0.0.0.0/0 0.0.0.0/0
5 ACCEPT ah -- 0.0.0.0/0 0.0.0.0/0
6 ACCEPT udp -- 0.0.0.0/0 224.0.0.251 udp dpt:5353
7 ACCEPT udp -- 0.0.0.0/0 0.0.0.0/0 udp dpt:631
8 ACCEPT tcp -- 0.0.0.0/0 0.0.0.0/0 tcp dpt:631
9 ACCEPT 0 -- 0.0.0.0/0 0.0.0.0/0 state RELATED,ESTABLISHED
10 ACCEPT tcp -- 0.0.0.0/0 0.0.0.0/0 state NEW tcp dpt:22
11 ACCEPT tcp -- 0.0.0.0/0 0.0.0.0/0 state NEW tcp dpt:443
12 ACCEPT tcp -- 0.0.0.0/0 0.0.0.0/0 state NEW tcp dpt:80
13 REJECT 0 -- 0.0.0.0/0 0.0.0.0/0 reject-with icmp-host-prohibited


Gerry

