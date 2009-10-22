From: Carl Michal <michal@physics.ubc.ca>
Subject: Re: ssh connections stalling
Date: Thu, 22 Oct 2009 16:31:02 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910221626360.25292@spider.phas.ubc.ca>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <200910222224.15040.karl@hiramoto.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200910222224.15040.karl@hiramoto.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Karl Hiramoto <karl@hiramoto.org>

Here's a simpler configuration (by hand, based on
http://www.brandonhutchinson.com/iptables_fw.html ) that shows the same 
problem:

iptables -L -vn
Chain INPUT (policy DROP 1 packets, 78 bytes)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
   140  112K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:22 state NEW
    89 10029 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0
   143 20996 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW,RELATED,ESTABLISHED

Chain LOGDROP (0 references)
  pkts bytes target     prot opt in     out     source               destination

> Send your configuration,  as root or using sudo do:
>
> iptables -L -vn
> iptables -L -vn -t mangle
> iptables -L -vn -t nat
>
> --
> Karl Hiramoto
> --
