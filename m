From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: Unexpected (ct)state matching behaviour
Date: Tue, 7 Jun 2011 23:44:38 +0200
Message-ID: <20110607214438.GH7067@principal.rfc2324.org>
References: <20110607201448.GF7067@principal.rfc2324.org>
 <alpine.LNX.2.01.1106072243320.2450@frira.zrqbmnf.qr>
 <20110607211023.GG7067@principal.rfc2324.org>
 <alpine.LNX.2.01.1106072327420.3052@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.01.1106072327420.3052@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Anno domini 2011 Jan Engelhardt scripsit:

> On Tuesday 2011-06-07 23:10, Maximilian Wilhelm wrote:
> 
> >> not run the NF_IP6_PRI_CONNTRACK hook, and as such not track
> >> particular connections/packets delivered over a bridge.
> >> (Thus, all those pkts are classified as INVALID.)
> >
> >Well, I should have said that. I had these not deactivted before,
> >but had similar problems, but with the Nagios Remote Plugin Executer only.
> >
> >forward reject: IN=br0 OUT=br0 PHYSIN=dns01_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.53 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=41662 WINDOW=0 RES=0x00 RST URGP=0 
> >forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=33300 WINDOW=0 RES=0x00 RST URGP=0 
> >forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=33300 WINDOW=0 RES=0x00 RST URGP=0 
> >forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=57854 WINDOW=0 RES=0x00 RST URGP=0 
> >forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=57854 WINDOW=0 RES=0x00 RST URGP=0 
> >forward reject: IN=br0 OUT=br0 PHYSIN=dns01_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.53 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=47357 WINDOW=0 RES=0x00 RST URGP=0 

> >Deactivate the hooks clearly fixed that problem, but after a while the
> >other one turned up. Any furher idea? :)

> Suggestion: Maximum number of CTs reached. Check dmesg for overflow
> warnings.

The only netfilter related thing which pops up in

zgrep -v '\(local\|forward\) reject' kern.log*

since the last reboot of the machine is:

| nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
| CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
| nf_conntrack.acct=1 kernel parameter, acct=1 nf_conntrack module option or
| sysctl net.netfilter.nf_conntrack_acct=1 to enable it.

wc -l /proc/net/ip_conntrack reports 211 and my Munin graphs indicate
that this is the usual value, so I would assue that's not the problem
here?

Ciao
Max
