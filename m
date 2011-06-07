From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Unexpected (ct)state matching behaviour
Date: Tue, 7 Jun 2011 23:28:14 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106072327420.3052@frira.zrqbmnf.qr>
References: <20110607201448.GF7067@principal.rfc2324.org> <alpine.LNX.2.01.1106072243320.2450@frira.zrqbmnf.qr> <20110607211023.GG7067@principal.rfc2324.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110607211023.GG7067@principal.rfc2324.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maximilian Wilhelm <max@rfc2324.org>
Cc: netfilter@vger.kernel.org

On Tuesday 2011-06-07 23:10, Maximilian Wilhelm wrote:

>> not run the NF_IP6_PRI_CONNTRACK hook, and as such not track
>> particular connections/packets delivered over a bridge.
>> (Thus, all those pkts are classified as INVALID.)
>
>Well, I should have said that. I had these not deactivted before,
>but had similar problems, but with the Nagios Remote Plugin Executer only.
>
>forward reject: IN=br0 OUT=br0 PHYSIN=dns01_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.53 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=41662 WINDOW=0 RES=0x00 RST URGP=0 
>forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=33300 WINDOW=0 RES=0x00 RST URGP=0 
>forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=33300 WINDOW=0 RES=0x00 RST URGP=0 
>forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=57854 WINDOW=0 RES=0x00 RST URGP=0 
>forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=57854 WINDOW=0 RES=0x00 RST URGP=0 
>forward reject: IN=br0 OUT=br0 PHYSIN=dns01_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.53 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=47357 WINDOW=0 RES=0x00 RST URGP=0 
>
>Deactivate the hooks clearly fixed that problem, but after a while the
>other one turned up. Any furher idea? :)

Suggestion: Maximum number of CTs reached. Check dmesg for overflow 
warnings.
