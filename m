From: Nemeth Denes <nemeth.denes@iit.bme.hu>
Subject: netfilter missing interface name
Date: Mon, 15 Feb 2010 10:19:26 +0100
Message-ID: <4B79119E.9090506@iit.bme.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi

The INPUT chain looks like the following:

pkts bytes target     prot opt in     out     source               
destination
  35  3235 LOG_DROP   all  --  pub    *       0.0.0.0/0           
!1.2.3.4      [goto]
   0  0    LOG_ACC    tcp  --  *      *       127.0.0.1            
127.0.0.1           state NEW tcp dpt:3000

The following packet is dropped:

IN= OUT=lo SRC=127.0.0.1 DST=127.0.0.1 LEN=60 TOS=0x10 PREC=0x00 TTL=64 
ID=31349 DF PROTO=TCP SPT=35130 DPT=3000 WINDOW=32792 RES=0x00 SYN URGP=

which was the cause of executing the "telnet localhost 3000" command
The "pub" interface is a physical ethernet card.

Why is the "IN=" blanc?
Why does the packet match to the first rule?
How is it possible to match only to the second rule?

Thanks Denes
