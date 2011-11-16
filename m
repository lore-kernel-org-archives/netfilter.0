From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Dropped packets logged which should be accepted by Conntrack
Date: Wed, 16 Nov 2011 16:51:12 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111161648420.26212@frira.zrqbmnf.qr>
References: <1321326448.2936.43.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1321326448.2936.43.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2011-11-15 04:07, John A. Sullivan III wrote:

>Hello, all.  I find myself perplexed by what I often see in our logs.
>At the end of our FORWARD chain, we log drops for no matches:
>
>[root@fw01 log]# iptables -v -n -L FORWARD
>Chain FORWARD (policy DROP 528K packets, 85M bytes)
> pkts bytes target     prot opt in     out     source
>destination
>  16M  925M TCPMSS     tcp  --  *      *       0.0.0.0/0
>0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU
>2284M 1690G ACCEPT     all  --  *      *       0.0.0.0/0
>0.0.0.0/0           state RELATED,ESTABLISHED
>7890K  594M VPN_ALLOW  all  --  *      *       0.0.0.0/0
>0.0.0.0/0           MARK match 0xcccc/0xcccc
>  27M 2609M UPEPIN_DENY  all  --  *      *       0.0.0.0/0
>0.0.0.0/0
>  27M 2609M UPEPIN     all  --  *      *       0.0.0.0/0
>0.0.0.0/0
> 528K   85M LOG        all  --  *      *       0.0.0.0/0
>0.0.0.0/0           LOG flags 0 level 4 prefix `No Match: '
>
>However, my logs are always showing these drops for packets I know
>should be matched in conntrack:
>
>Nov 14 18:45:51 fw01 kernel: No Match: IN=bond4 OUT=bond3 SRC=172.x.y.34
>DST=194.187.105.194 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=48910 DF
>PROTO=TCP SPT=25 DPT=60261 WINDOW=4

As always, post the *full* ruleset, and do so by using iptables-save. Do 
*NOT* use -L.
The use of TCPMSS is generally not needed either - if you do, you are 
likely to be wrongly blocking ICMP.
