From: Patrick McHardy <kaber@trash.net>
Subject: Re: Port forwarding with iptables on tunnel interface
Date: Fri, 12 Feb 2010 06:29:26 +0100
Message-ID: <4B74E736.2020307@trash.net>
References: <1265912094.2985.44.camel@tesla.lan>	 <4B745327.9020806@trash.net> <1265916014.2985.72.camel@tesla.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1265916014.2985.72.camel@tesla.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guido Trentalancia <guido@trentalancia.com>
Cc: netfilter@vger.kernel.org

Guido Trentalancia wrote:
> Hello Patrick,
> 
> thanks very much for your message !
> 
> By the way, some IP addresses in the original message are wrong (read
> 192.168.3.69 instead of 192.168.1.65), but that's just a typo.
> 
> Here is the log produced by iptables on 192.168.3.64:
> 
> Feb 11 20:09:58 gyokuro kernel: ipencap (in): IN=eth0 OUT=
> MAC=macaddressofreceiverandsender SRC=senderipaddress DST=192.168.3.64
> LEN=76 TOS=0x00 PREC=0x00 TTL=41 ID=26562 PROTO=4 
> Feb 11 20:10:01 gyokuro kernel: ipencap (in): IN=eth0 OUT=
> MAC=macaddressofreceiverandsender SRC=senderipaddress DST=192.168.3.64
> LEN=76 TOS=0x00 PREC=0x00 TTL=41 ID=28099 PROTO=4 
> Feb 11 20:10:07 gyokuro kernel: ipencap (in): IN=eth0 OUT=
> MAC=macaddressofreceiverandsender SRC=senderipaddress DST=192.168.3.64
> LEN=76 TOS=0x00 PREC=0x00 TTL=41 ID=28322 PROTO=4 

I don't see any decapsulated packets.
