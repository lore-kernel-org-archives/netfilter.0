From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: Unexpected (ct)state matching behaviour
Date: Wed, 8 Jun 2011 00:04:03 +0200
Message-ID: <20110607220403.GJ7067@principal.rfc2324.org>
References: <20110607201448.GF7067@principal.rfc2324.org>
 <alpine.LNX.2.01.1106072243320.2450@frira.zrqbmnf.qr>
 <20110607211023.GG7067@principal.rfc2324.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110607211023.GG7067@principal.rfc2324.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Anno domini 2011 Maximilian Wilhelm scripsit:

> > >The bridge-nf-hooks are disabled via sysctl:

> > >net.bridge.bridge-nf-call-arptables = 0
> > >net.bridge.bridge-nf-call-iptables = 0
> > >net.bridge.bridge-nf-call-ip6tables = 0

> > I suspect that is your problem. Disabling nf-call would seem to
> > not run the NF_IP6_PRI_CONNTRACK hook, and as such not track
> > particular connections/packets delivered over a bridge.
> > (Thus, all those pkts are classified as INVALID.)

> Well, I should have said that. I had these not deactivted before,
> but had similar problems, but with the Nagios Remote Plugin Executer only.

> forward reject: IN=br0 OUT=br0 PHYSIN=dns01_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.53 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=41662 WINDOW=0 RES=0x00 RST URGP=0 
> forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=33300 WINDOW=0 RES=0x00 RST URGP=0 
> forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=33300 WINDOW=0 RES=0x00 RST URGP=0 
> forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=57854 WINDOW=0 RES=0x00 RST URGP=0 
> forward reject: IN=br0 OUT=br0 PHYSIN=mail_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.25 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=57854 WINDOW=0 RES=0x00 RST URGP=0 
> forward reject: IN=br0 OUT=br0 PHYSIN=dns01_eth0 PHYSOUT=mon_eth0 SRC=192.168.42.53 DST=192.168.42.70 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=5666 DPT=47357 WINDOW=0 RES=0x00 RST URGP=0 

> Deactivate the hooks clearly fixed that problem, but after a while the
> other one turned up. Any furher idea? :)

It might be worth adding that each of the VMs has a setup like this:

# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref Use Iface
192.168.42.1    0.0.0.0         255.255.255.255 UH    0      0 0 eth0
0.0.0.0         192.168.42.1    0.0.0.0         UG    0      0 0 eth0

to enforce that the packets are being routed and firewalled on the host machine.

Ciao
Max
-- 
"Du kannst die Grundlagen von C. Das einzige, was C++ Dir noch gibt, ist mehr Schmerz!
 Und ein paar mehr Schrotflinten in die Hand..."
  -- Matthias Bolte
