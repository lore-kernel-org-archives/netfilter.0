From: Babelo Gmvsdm <hercule18@hotmail.com>
Subject: RE: Iptables DNAT and redirect on interface in promiscuous mode
Date: Fri, 27 Jan 2012 11:05:51 +0100
Message-ID: <BLU158-W588FDE006CE940BF7C04BDA68E0@phx.gbl>
References: <BLU158-W307A56E564B30DAD3791BA69F0@phx.gbl>,<BLU158-W265CEEC64CDB7F3707B4E2A69F0@phx.gbl>,<BLU158-W359E0CD3ACC5B20EEA80CFA6880@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU158-W359E0CD3ACC5B20EEA80CFA6880@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


So,
I imagined that the following command could help:
arptables -t filter -A INPUT --h-length 6 --destination-mac aa:aa:aa:aa=
:aa:aa -i eth0 -j mangle --mangle-mac-d bb:bb:bb:bb:bb:bb
It seems to be the same as iptables, as the first destination is not th=
e one of the monitoring machine, the packet is not processed
HHHelp!!
HerC.=A0

----------------------------------------
> From: hercule18@hotmail.com
> To: netfilter@vger.kernel.org
> Subject: RE: Iptables DNAT and redirect on interface in promiscuous m=
ode
> Date: Wed, 25 Jan 2012 16:39:34 +0100
>
>
> Hi,
> I'm back on this thing, so I found that's not ntop that prevent iptab=
les from working but thefact that the packets are not destinated to the=
 mac address of the PC running iptables.
> I did mac spoofing on the monitoring machine and it seems to work, bu=
t it did also a nice mess.So is there another way to manage the traffic=
 that is not directly destinated to the PC running iptables?
> Cheers
> HerC.
>
> ----------------------------------------
> > From: hercule18@hotmail.com
> > To: netfilter@vger.kernel.org
> > Subject: Iptables DNAT and redirect on interface in promiscuous mod=
e
> > Date: Thu, 12 Jan 2012 10:14:15 +0100
> >
> >
> > Hi,
> > I have a PC which is connected to a mirroring port with an interfac=
e in promiscuous mode.I would like to catch traffic on this interface, =
and redirect it to port 3128 (squid app).
> > The promiscuous mode by another app running on this interface (ntop=
)
> > But it seems the promiscuous mode prevent iptable from working.
> > is there any trick to make it works?
> > ps: sorry for my english.
> >
> > HerC.
> >
>
 		 	   		  