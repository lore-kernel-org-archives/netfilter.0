From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: snat range not cycling
Date: Wed, 4 Aug 2010 00:09:56 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008040008360.3134@obet.zrqbmnf.qr>
References: <4C5832F9.50004@trash.net> <x6bp9jy7sj@gzp> <4C584C63.8010607@trash.net> <x6vd7rwrah@gzp> <x6lj8nwqu4@gzp> <alpine.LSU.2.01.1008032001430.1519@obet.zrqbmnf.qr> <x6sk2vo9eq@gzp> <003901cb3358$1346b250$39d416f0$@net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <003901cb3358$1346b250$39d416f0$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timothy Hayes <morphieus@earthlink.net>
Cc: 'Mail List - Netfilter' <netfilter@vger.kernel.org>


On Wednesday 2010-08-04 00:06, Timothy Hayes wrote:
>I added the range of addresses with ip addr add x.x.x.# dev eth0
>
>and setup a snat rule:
>iptables -A POSTROUTING -o eth0 -p tcp --dport 80 -j SNAT --to-source
>xx.xx.xx.131-xx.xx.xx.250
>
>translation works fine, but I never seem to get an alternate ip from the
>range.

IIRC the algorithm tries to give you the same source address for a given 
source address. (I hear that banking sites and other sensitive stuff can 
get unhappy if your externally visible address suddenly changes.)

