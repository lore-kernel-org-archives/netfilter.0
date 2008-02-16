From: "Robert M. Albrecht" <romal@gmx.de>
Subject: Re: illegal packets
Date: Sat, 16 Feb 2008 22:08:23 +0100
Message-ID: <47B750C7.2070707@gmx.de>
References: <47B74459.5010607@gmx.de> <Pine.LNX.4.64.0802162139240.26797@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0802162139240.26797@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Hi Jozsef,

thanks for your fast reply.

As newer kernels as 2.6.24 aren`t supported in OpenWRT I have to ignore it 
for the moment :-(

For the moment I have to remove the INVALID statement from my configuration 
for the recent-module, as recent puts this invalid packets on the blacklist.

cu romal


Jozsef Kadlecsik schrieb:
> On Sat, 16 Feb 2008, Robert M. Albrecht wrote:
> 
>> I keep getting this invalid packets, one to five per minute.
>>
>> Why are the invalid ?
> 
>> kernel: nf_ct_tcp: invalid packed ignored IN= OUT= SRC=212.60.137.183 
>> DST=217.72.204.254 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=25024 DF 
>> PROTO=TCP SPT=52369 DPT=80 SEQ=4686532 ACK=0 WINDOW=5840 RES=0x00 SYN 
>> URGP=0 OPT (020405B40402080A0244
> 
> This is a connection-initiating SYN packet, but there is an existing 
> connection already between 212.60.137.183:52369<->217.72.204.254:80. 
> So the firewall ignores the packet (does not take it into account at 
> keeping track the connection, but lets it through). Probably it's a 
> connection-reopening, which is not handled properly.
> 
> The newest git tree contains a fix for reopening connections. So either 
> upgrade or ignore the invalid packet warnings ;-).
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
