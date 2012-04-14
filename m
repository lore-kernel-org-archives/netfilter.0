From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: IPTables
Date: Sat, 14 Apr 2012 21:35:02 +1200
Message-ID: <4F8944C6.8010102@treenet.co.nz>
References: <333814026-1334373171-cardhu_decombobulator_blackberry.rim.net-902722826-@b5.c4.bise7.blackberry>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <333814026-1334373171-cardhu_decombobulator_blackberry.rim.net-902722826-@b5.c4.bise7.blackberry>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1254"; format="flowed"
To: nullv@gmx.com
Cc: "Ethy H. Brito" <ethy.brito@inexo.com.br>, netfilter-owner@vger.kernel.org, Al Grant <bigal.nz@gmail.com>, netfilter <netfilter@vger.kernel.org>

On 14/04/2012 11:54 a.m., nullv@gmx.com wrote:
> It can't be. it's a link-local address

The difference between IPv4 and IPv6. IPv4 has no link-local limitation=
=20
outside of 127.0.0.0/8 built into the hardware, it *can* leak into the=20
WAN if you configure things non-standard.

AYJ

> ------Original Message------
> From: Ethy H. Brito
>
> On Wed, 11 Apr 2012 15:03:46 +1200
> Al Grant wrote:
>
>> Hiya All,
>>
>> I am after a little guidance please on the following problem:
>>
>> My topology is as follows:
>>
>> inet----router 192.168.1.254-------wlan0 192.168.1.71&&  eth0
>> 192.168.70.121------ip camera 192.168.70.140:80
>>
>> Note:
>>
>> (1) eth0 and wlan0 are on a PC running Ubuntu.
>>
>> (2) Port 5555 on the router is forwarded to 80 on 192.168.1.71
>>
>> (2) in sysctl I have set sysctl net.ipv4.ip_forward=3D1
>>
>> Now what I need to do is to be able to access the IP camera from the
>> inet.
>>
>> So I have tried adding IPTables:
>>
>> iptables -t nat -A PREROUTING -i wlan0 -d 192.168.1.71 -p tcp --dpor=
t
>> 5555 -j DNAT --to 192.168.70.140:80
>>
>> Now this should allow me to access the camera by pointing a web
>> browser to the real world public ip on port 5555, however I get page
>> cannot be displayed.
> Hi
>
> just to be sure: 192.168.1.71 is NOT your "real world public ip", is =
it?
>
> Ethy
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> N=8B=A7=B2=E6=ECr=B8=9By=FA=E8=9A=D8b=B2X=AC=B6=C7=A7v=D8^=96)=DE=BA{=
=2En=C7+=89=B7=A7z=D7=E2=96=D7=AB=8A{ay=BA=1D=CA=87=DA=99=EB,j=07=AD=A2=
f=A3=A2=B7h=9A=8B=E0z=B9=1E=AEw=A5=A2=B8=0C=A2=B7=A6j:+v=89=A8=8Aw=E8j=D8=
m=B6=9F=FF=BE=07=AB=91=EA=E7zZ+=83=F9=9A=8E=8A=DD=A2j"=9D=FA!tml=3D

