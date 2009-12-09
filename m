From: "M. Arts - Rootnet" <marco@rootnet.nl>
Subject: Iptables 1.3.6 outgoing dns issue
Date: Wed, 09 Dec 2009 13:10:04 +0100
Message-ID: <1260360604.2853.35.camel@office-nmg03-v200>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

IPTables Version: 1.3.6 running on Debian Etch
Kernel Version: 2.6.18.8.xs5.5.0.13.442

I'm having some issues capturing outgoing DNS traffic, I've tried
capturing it by means of both sport and dport, but the rules simply
don't get triggered, instead they get logged by my logfile trying to
catch anything i've missed. 

An example of this:
pkts bytes target     prot opt in     out     source
destination         
  0     0 ACCEPT     udp  --  any    eth0    anywhere
anywhere            udp dpt:domain 

Logs:
Dec  9 12:16:48 vps kernel: IN= OUT=eth0 SRC=a.b.c.d DST=80.247.205.5
LEN=63 TOS=0x00 PREC=0x00 TTL=64 ID=61646 DF PROTO=UDP SPT=33702 DPT=53
LEN=43 
Dec  9 12:16:53 vps kernel: IN= OUT=eth0 SRC=a.b.c.d DST=212.79.236.165
LEN=63 TOS=0x00 PREC=0x00 TTL=64 ID=62146 DF PROTO=UDP SPT=33703 DPT=53
LEN=43 


Anyone got any idea what might be causing this? 

