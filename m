From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: How to make bi-directional NAT'ting?
Date: Tue, 23 Aug 2011 11:50:19 +0100
Message-ID: <4E5385EB.9040808@tolaris.com>
References: <4E536427.2040503@ngs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E536427.2040503@ngs.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="maccyrillic"
To: =?windows-1251?Q?=22=DF=F6=EA=EE_=DD=EB=EB=E0=E4_=C3=E5=ED=ED=E0=E4?= =?windows-1251?Q?=FC=E5=E2=E8=F7_=28ngs=29=22?= <eyatsko@ngs.ru>
Cc: netfilter@vger.kernel.org

On 2011-08-23 09:26, "=DF=F6=EA=EE =DD=EB=EB=E0=E4 =C3=E5=ED=ED=E0=E4=FC=
=E5=E2=E8=F7 (ngs)" wrote:
> Hello!
>=20
> I have some specific problem with Cisco CP7961G IP phone.
> It sends packets to external Softswitch using one UDP port
> which differs from 5060 (voipControlPort in its .XML), but
> it waits answers on 5060!
> And I can't do anything with it! I have tried Firmware from
> 8.0.x up to 8.5.x - all the same!
>=20
> One thing I think is make corresponding translation on IPTables.
> SNAT in direct path (from 79161 to Softswitch) and DNAT
> in backward direction (from outside Softswitch to 7961).
>=20
> BUT IT DOESN'T WORK! :-)
>=20
> $IPTABLES -t nat -A PREROUTING          -p udp -s 80.251.x.x
>                         -d 80.251.y.y --dport 5060 -j DNAT --to-desti=
nation
> 172.16.128.200:5060
> $IPTABLES -t nat -A POSTROUTING -o eth0 -p udp -s 172.16.128.0/24 --s=
port
> 1024:65535 -d 80.251.x.x --dport 5060 -j SNAT --to-source      80.251=
=2Ey.y:5060

SIP is difficult to correct with NAT. It includes connection data at la=
yer
7. So the Softswitch may be ignoring packet headers and replying to tha=
t.

I don't think NAT is your solution here. Something else is wrong in the=
 SIP
setup of this device.

Regards,
Tyler

--=20
"[...] the effectiveness of pat-downs does not matter very much, becaus=
e
the obvious goal of the TSA is to make the pat-down embarrassing enough
for the average passenger that the vast majority of people will choose
high-tech humiliation over the low-tech ball check."
   -- Jeffrey Goldberg, "For the First Time, the TSA Meets Resistance"
      The Atlantic, 2010-10-29
