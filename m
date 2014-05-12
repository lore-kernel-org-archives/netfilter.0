From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: Re: Losing connection between nat and filter tables
Date: Mon, 12 May 2014 10:20:37 -0300
Message-ID: <5370CAA5.1010805@riosoft.com.br>
References: <536CECA8.1000604@riosoft.com.br>	<CAEzD07JLeCTxUT_rR3H6QDv6_jVH2mFH1q8B2T4EvtJsDGqF1g@mail.gmail.com>	<536CFE75.90005@riosoft.com.br> <CAEzD07LqPgQiftaS6831c2-7Kw0XM=3i84+4WX6XN2GSX0k6Qw@mail.gmail.com> <536D3E84.5020102@riosoft.com.br> <536D4983.8040105@chello.at> <536D7375.9090909@riosoft.com.br> <536E602E.5070103@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <536E602E.5070103@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Pascal, thank you for clarifying the behavior of the rp_filter. And=20
yes, the two interfaces are in the same network, but it's a limitation=20
that our ISP imposes to us, as we have a limited range of public IPs in=
=20
only one /28 subnet. The objective this "messy" configuration is that=20
two different groups of users have access to different FTP sites withou=
t=20
having to set a non default port. My only choice was to do a DNAT based=
=20
on the destination IP (even though they are on the same network).
Would you do that in a different way? I really apreciate your help!

Em 10/5/2014 14:21, Pascal Hambourg escreveu:
> Hello,
>
> Bruno de Paula Larini a =E9crit :
>> Wow, thank you Mart! I didn't really think that the rp_filter would =
have
>> anything to do with it, but in fact it had!
> Of course it does, and it's all your fault.
> Either eth1 and eth2 are actually connected to the same network and
> connecting several interfaces to the same network is wrong and useles=
s
> in most cases, or they are not and defining the same subnets on sever=
al
> interfaces which are connected to different networks is wrong. In eit=
her
> case, it's wrong. Why did you do so ?
>
>> Even though I had disabled
>> for "all" interfaces, it seems that the rp_filter files for each
>> interface overlaps "all".
> It doesn't overlap. Both values are combined using the MAX operator.
>
>    rp_filter functional value for $iface =3D MAX (all, $iface)
>
> All this and much more is detailed in ip-sysctl.txt.
>
>> But unlike the eth1 interface, the RELATED state isn't allowing (or
>> recognizing) the data channel. After doing a DNAT from port 49152 to
>> 65535, the default data ports for MS FTP, I can now successfully con=
nect
>> through the second interface.
> I'm afraid that's because you messed with the FTP control port. By
> default the FTP conntrack monitors only the port 21. You can either
> specify both 21 and 2121 in the port=3D option when you load the
> nf_conntrack_ftp module, or DNAT the second address to an IP alias
> address assigned to the same server, so that you don't need to change
> the port.
>
>


