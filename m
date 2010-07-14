From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Help!!! iptables hashlimit
Date: Wed, 14 Jul 2010 18:26:31 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007141825210.10075@obet.zrqbmnf.qr>
References: <4694.23493.qm@web32402.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4694.23493.qm@web32402.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ha do <haloha201@yahoo.com>
Cc: netfilter@vger.kernel.org, curby@cur.by

On Wednesday 2010-07-14 10:03, ha do wrote:

>hi all
>
>i just setup the hashlimit for SIP REGISTER on iptables and the rule is:
>-A  INPUT -p udp -i eth0 --dport 5060 -m hashlimit --hashlimit 1/minute  
>--hashlimit-burst 2 --hashlimit-mode srcip,srcport  --hashlimit-name  "cucku" -m 
>string --string "REGISTER sip:" --algo bm --to 80 -j ACCEPT
>
>so   from my understand the IPTABLES will let 2 REGSITER packets per minute
>so when i use the xlite to  send the RESGISTER message , the first REGISTER 
>packet is accepted but  the seconds REGISTER packet is blocked by iptables

Order matters! The packet is counted, even if it does not match the 
string.
