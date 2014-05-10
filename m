From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Losing connection between nat and filter tables
Date: Sat, 10 May 2014 19:21:50 +0200
Message-ID: <536E602E.5070103@plouf.fr.eu.org>
References: <536CECA8.1000604@riosoft.com.br>	<CAEzD07JLeCTxUT_rR3H6QDv6_jVH2mFH1q8B2T4EvtJsDGqF1g@mail.gmail.com>	<536CFE75.90005@riosoft.com.br> <CAEzD07LqPgQiftaS6831c2-7Kw0XM=3i84+4WX6XN2GSX0k6Qw@mail.gmail.com> <536D3E84.5020102@riosoft.com.br> <536D4983.8040105@chello.at> <536D7375.9090909@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <536D7375.9090909@riosoft.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

Bruno de Paula Larini a =E9crit :
> Wow, thank you Mart! I didn't really think that the rp_filter would h=
ave=20
> anything to do with it, but in fact it had!

Of course it does, and it's all your fault.
Either eth1 and eth2 are actually connected to the same network and
connecting several interfaces to the same network is wrong and useless
in most cases, or they are not and defining the same subnets on several
interfaces which are connected to different networks is wrong. In eithe=
r
case, it's wrong. Why did you do so ?

> Even though I had disabled=20
> for "all" interfaces, it seems that the rp_filter files for each=20
> interface overlaps "all".

It doesn't overlap. Both values are combined using the MAX operator.

  rp_filter functional value for $iface =3D MAX (all, $iface)

All this and much more is detailed in ip-sysctl.txt.

> But unlike the eth1 interface, the RELATED state isn't allowing (or=20
> recognizing) the data channel. After doing a DNAT from port 49152 to=20
> 65535, the default data ports for MS FTP, I can now successfully conn=
ect=20
> through the second interface.

I'm afraid that's because you messed with the FTP control port. By
default the FTP conntrack monitors only the port 21. You can either
specify both 21 and 2121 in the port=3D option when you load the
nf_conntrack_ftp module, or DNAT the second address to an IP alias
address assigned to the same server, so that you don't need to change
the port.
