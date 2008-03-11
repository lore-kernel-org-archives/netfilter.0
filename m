From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: iptables question
Date: Tue, 11 Mar 2008 19:46:19 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803111941570.18745@fbirervta.pbzchgretzou.qr>
References: <200803111520.15941.bossk@tyntec.biz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200803111520.15941.bossk@tyntec.biz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bossk <bossk@tyntec.biz>
Cc: netfilter@vger.kernel.org


On Mar 11 2008 15:20, bossk wrote:
>
>1. iptables -A allowed -p TCP --syn -j ACCEPT
>2. iptables -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
>3. iptables -A allowed -p TCP -j DROP
>
>Regarding rule 2.  the connections is ESTABLISHED and no packets should be 
>dropped.
>
>But in the drop log it looks quite different
>IN= OUT=eth0 SRC=10.3.4.14 DST=10.3.4.2 LEN=52 TOS=0x00 PREC=0x00 TTL=64 
>ID=20094 DF PROTO=TCP SPT=42884 DPT=3128 WINDOW=4 RES=0x00 ACK URGP=0

Well then this packet did not belong to a known connection,
was forged, or anything like that.

That is why I would also combine -p tcp --syn with additionally
-m conntrack --ctstate NEW.
Needless to say that RELATED will never be considered because
you already allow all connections with --syn.

