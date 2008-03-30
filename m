From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: CONNMARK and ip rule fwmark
Date: Sun, 30 Mar 2008 20:27:01 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0803301849080.28605@fbirervta.pbzchgretzou.qr>
References: <046B6BE8F9E1409CAF96941CED215BD0@shs1> <bd29d6543567ecfd7c483671f163d14e@localhost> <alpine.LNX.1.10.0803301648110.28605@fbirervta.pbzchgretzou.qr> <47EFBB68.1020107@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47EFBB68.1020107@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Sunday 2008-03-30 18:10, Pascal Hambourg wrote:
>>
>>  Using the nat table to 'simulate' -m conntrack --ctstate NEW, that's
>>  just a gross hack IMO.
>
> I agree that the use of the nat table for any purpose not related
> to NAT should be avoided. However the advantage of the nat table is
> that it sees only one packet per connection, while "-m conntrack
> --ctstate NEW" or "-m state --state NEW" may match multiple packets
> per connection, e.g. duplicate TCP SYN or all UDP sent packets in
> the original direction before the first packet sent in the return
> direction.

That's nonsense -- the nat table sees every packet that is IPCT_NEW:

iptables -t nat -A OUTPUT -d 134.76.13.21 -p tcp --syn -j LOG
--log-prefix "[nat] "
iptables -t filter -A OUTPUT -d 134.76.13.21 -p tcp --syn -j LOG
--log-prefix "[filt] "
iptables -t filter -A OUTPUT -d 134.76.13.21 -p tcp --syn -j DROP

[698843.456383] [nat] IN= OUT=sis0 SRC=10.10.106.161 DST=134.76.13.21
LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=4360 DF PROTO=TCP SPT=36903 DPT=9
WINDOW=5840 RES=0x00 SYN URGP=0

[698843.456418] [filt] IN= OUT=sis0 SRC=10.10.106.161
DST=134.76.13.21 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=4360 DF
PROTO=TCP SPT=36903 DPT=9 WINDOW=5840 RES=0x00 SYN URGP=0

[698846.454976] [nat] IN= OUT=sis0 SRC=10.10.106.161 DST=134.76.13.21
LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=4361 DF PROTO=TCP SPT=36903 DPT=9
WINDOW=5840 RES=0x00 SYN URGP=0

[698846.455012] [filt] IN= OUT=sis0 SRC=10.10.106.161
DST=134.76.13.21 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=4361 DF
PROTO=TCP SPT=36903 DPT=9 WINDOW=5840 RES=0x00 SYN URGP=0

