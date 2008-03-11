From: Justin Piszcz <jpiszcz@lucidpixels.com>
Subject: Re: iptables question
Date: Tue, 11 Mar 2008 15:13:45 -0400 (EDT)
Message-ID: <alpine.DEB.1.00.0803111512010.24156@p34.internal.lan>
References: <200803111520.15941.bossk@tyntec.biz> <Pine.LNX.4.64.0803111941570.18745@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0803111941570.18745@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: bossk <bossk@tyntec.biz>, netfilter@vger.kernel.org



On Tue, 11 Mar 2008, Jan Engelhardt wrote:

>
> On Mar 11 2008 15:20, bossk wrote:
>>
>> 1. iptables -A allowed -p TCP --syn -j ACCEPT
>> 2. iptables -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
>> 3. iptables -A allowed -p TCP -j DROP
>>
>> Regarding rule 2.  the connections is ESTABLISHED and no packets should be
>> dropped.
>>
>> But in the drop log it looks quite different
>> IN= OUT=eth0 SRC=10.3.4.14 DST=10.3.4.2 LEN=52 TOS=0x00 PREC=0x00 TTL=64
>> ID=20094 DF PROTO=TCP SPT=42884 DPT=3128 WINDOW=4 RES=0x00 ACK URGP=0
>
> Well then this packet did not belong to a known connection,
> was forged, or anything like that.
>
> That is why I would also combine -p tcp --syn with additionally
> -m conntrack --ctstate NEW.
> Needless to say that RELATED will never be considered because
> you already allow all connections with --syn.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

The default is DROP for me so then I shall add the traversal for 
ESTABLISHED,RELATED for output as well..  Looks like I need to do some 
testing, thanks.

Justin.


