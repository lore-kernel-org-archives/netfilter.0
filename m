From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: illegal packets
Date: Sat, 16 Feb 2008 21:51:18 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0802162139240.26797@blackhole.kfki.hu>
References: <47B74459.5010607@gmx.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47B74459.5010607@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert M. Albrecht" <romal@gmx.de>
Cc: netfilter@vger.kernel.org

On Sat, 16 Feb 2008, Robert M. Albrecht wrote:

> I keep getting this invalid packets, one to five per minute.
> 
> Why are the invalid ?

> kernel: nf_ct_tcp: invalid packed ignored IN= OUT= SRC=212.60.137.183 
> DST=217.72.204.254 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=25024 DF 
> PROTO=TCP SPT=52369 DPT=80 SEQ=4686532 ACK=0 WINDOW=5840 RES=0x00 SYN 
> URGP=0 OPT (020405B40402080A0244

This is a connection-initiating SYN packet, but there is an existing 
connection already between 212.60.137.183:52369<->217.72.204.254:80. 
So the firewall ignores the packet (does not take it into account at 
keeping track the connection, but lets it through). Probably it's a 
connection-reopening, which is not handled properly.

The newest git tree contains a fix for reopening connections. So either 
upgrade or ignore the invalid packet warnings ;-).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
