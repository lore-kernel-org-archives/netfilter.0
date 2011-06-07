From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: Unexpected (ct)state matching behaviour
Date: Tue, 7 Jun 2011 23:10:23 +0200
Message-ID: <20110607211023.GG7067@principal.rfc2324.org>
References: <20110607201448.GF7067@principal.rfc2324.org>
 <alpine.LNX.2.01.1106072243320.2450@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.01.1106072243320.2450@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Anno domini 2011 Jan Engelhardt scripsit:

(I'm subscribed, no need for CC :))

> On Tuesday 2011-06-07 22:14, Maximilian Wilhelm wrote:

> >The bridge-nf-hooks are disabled via sysctl:

> >net.bridge.bridge-nf-call-arptables = 0
> >net.bridge.bridge-nf-call-iptables = 0
> >net.bridge.bridge-nf-call-ip6tables = 0

> I suspect that is your problem. Disabling nf-call would seem to
> not run the NF_IP6_PRI_CONNTRACK hook, and as such not track
> particular connections/packets delivered over a bridge.
> (Thus, all those pkts are classified as INVALID.)

Well, I should have said that. I had these not deactivted before,
but had similar problems, but with the Nagios Remote Plugin Executer only.

forward reject: IN=br0 OUT=br0 PHYSIN=dns01_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.53 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=41662 WINDOW=0 RES=0x00 RST URGP=0 
forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=33300 WINDOW=0 RES=0x00 RST URGP=0 
forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=33300 WINDOW=0 RES=0x00 RST URGP=0 
forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=57854 WINDOW=0 RES=0x00 RST URGP=0 
forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=57854 WINDOW=0 RES=0x00 RST URGP=0 
forward reject: IN=br0 OUT=br0 PHYSIN=dns01_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.53 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=47357 WINDOW=0 RES=0x00 RST URGP=0 

Deactivate the hooks clearly fixed that problem, but after a while the
other one turned up. Any furher idea? :)

Thanks
Max
