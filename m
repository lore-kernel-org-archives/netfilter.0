From: Juan Antonio <pushakk@limbo.ari.es>
Subject: Re: Ugly issue with conntrack
Date: Wed, 17 Mar 2010 18:50:57 +0100
Message-ID: <4BA11681.50200@limbo.ari.es>
References: <4B9FB41C.5000609@limbo.ari.es> <4BA0F643.9030903@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BA0F643.9030903@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Mart Frauenlob <mart.frauenlob@chello.at>

Hi Mart,

thank you very much for your reply, I will look for INVALID STATE doc=20
and try LOG this traffic. I suposse the issue is related with the=20
windows 2008 server because if I config the same public ip to another=20
server this reply the echoes corectly so I think it's not a intrinsic=20
netfilter issue.

I suposse the problem is in some special config in the 2008 server, thi=
s=20
is a client machine so I have no access to the system.

Thank you.

El 17/03/10 16:33, Mart Frauenlob escribi=F3:
> On 16.03.2010 18:15, pushakk@limbo.ari.es wrote:
>   =20
>> Hello everyone,
>>
>> I have a extrange issue with a conntrack entry. There is a nat serve=
r
>> configure in this way
>>
>>      DMZ  194.139.30.0/23  ---  194.139.30.16  nat 192.168.12.100 --=
--
>> 192.168.12.0/24  private network
>>
>> The nat machine does postrouting in all traffic from the private net=
work
>> to DMZ, and there is no problem but in one server in the DMZ with
>> windows 2008 server the traffic doesn't return to the origin, I can =
see
>> the traffic with tcpdump like this
>>
>> 17:19:23.971978 IP (tos 0x0, ttl  64, id 0, offset 0, flags [DF], pr=
oto:
>> ICMP (1), length: 84) 192.168.12.91>  194.139.30.62: ICMP echo reque=
st,
>> id 12075, seq 1, length 64<-----   The echo request original OK
>>
>> 17:19:23.972094 IP (tos 0x0, ttl  63, id 0, offset 0, flags [DF], pr=
oto:
>> ICMP (1), length: 84) 194.139.30.16>  194.139.30.62: ICMP echo reque=
st,
>> id 12075, seq 1, length 64<------ Masquerade the source IP OK
>>
>> 17:19:23.972164 IP (tos 0x0, ttl 128, id 25050, offset 0, flags [non=
e],
>> proto: ICMP (1), length: 84) 194.139.30.62>  194.139.30.16: ICMP ech=
o
>> reply, id 12075, seq 1, length 64<------- The echo reply OK
>>
>> =BF?=BF?=BF?<-----------    Lost echo reply not OK
>>
>> There isn't the packet from 194.139.30.16 to 192.168.12.91 despite o=
ff
>> the conntrack table show
>>
>> cat /proc/net/ip_conntrack | grep '30.62'
>> icmp     1 29 src=3D192.168.12.91 dst=3D194.139.30.62 type=3D8 code=3D=
0 id=3D12075
>> packets=3D11 bytes=3D924 [UNREPLIED] src=3D194.139.30.62 dst=3D194.1=
39.30.16
>> type=3D0 code=3D0 id=3D12075 packets=3D0 bytes=3D0 mark=3D0 use=3D1
>>
>> The packet in tcpdump match on the conntrack entry. "id 12075" in bo=
th
>> cases, but if I LOG the traffic with the LOG iptables target I see t=
he
>> reply in INPUT table not in the FORWARD.http://www.google.com/firefo=
x
>>
>> Thank you and sorry for me bad english.
>>
>>     =20
> This behaviour indicates, that conntrack classifies the traffic into
> state INVALID. Thus it is not natted, as stateful nat needs traffic t=
o
> be valid for conntrack.
> I don't know why it happens in that particular case, but you can try =
to
> debug it a little more.
> If your kernel supports it, you can set
> /proc/sys/net/netfilter/nf_conntrack_log_invalid to 1.
>
> -m state --state INVALID -j LOG --log-level debug ....
> in INPUT/FORWARD.
>
> Also providing iptables-save output, kernel version, etc.. is helpful=
=2E
>
> As this only happens with win2008, you might try to find some IP
> settings there?
>
> Best regards
>
> Mart
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   =20

