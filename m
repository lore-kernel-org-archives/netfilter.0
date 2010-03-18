From: Juan Antonio <pushakk@limbo.ari.es>
Subject: Re: Ugly issue with conntrack
Date: Thu, 18 Mar 2010 09:48:12 +0100
Message-ID: <4BA1E8CC.8060509@limbo.ari.es>
References: <4B9FB41C.5000609@limbo.ari.es> <4BA0F643.9030903@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BA0F643.9030903@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Mart Frauenlob <mart.frauenlob@chello.at>

Hello again Mart,

I have recover some more data about the problem.

uname -r
2.6.17-5mdv

iptables --version
iptables v1.3.5

ping -c 1 tcpdump out

(tos 0x0, ttl  64, id 0, offset 0, flags [DF], proto: ICMP (1), length:
84) 192.168.12.91 > 195.139.30.62: ICMP echo request, id 30011, seq 1,
length 64

(tos 0x0, ttl  63, id 0, offset 0, flags [DF], proto: ICMP (1), length:
84) 195.139.30.16 > 195.139.30.62: ICMP echo request, id 30011, seq 1,
length 64

(tos 0x0, ttl 128, id 6454, offset 0, flags [none], proto: ICMP (1),
length: 84) 195.139.30.62 > 195.139.30.16: ICMP echo reply, id 30011,
seq 1, length 64

no more traffic here

iptables LOG rules

INPUT chain
target     prot opt source               destination
LOG        icmp --  0.0.0.0/0            195.139.30.62      LOG flags 0
level 7 prefix `dst-nexus-input '
LOG        icmp --  195.139.30.62       0.0.0.0/0           LOG flags 0
level 7 prefix `src-nexus-input '

=46ORWARD chain
target     prot opt source               destination
LOG        icmp --  0.0.0.0/0            195.139.30.62      LOG flags 0
level 7 prefix `dst-nexus-forward '
LOG        icmp --  195.139.30.62       0.0.0.0/0           LOG flags 0
level 7 prefix `src-nexus-forward '

and this rules LOG
Mar 18 09:33:14 thunderNAT kernel: dst-nexus-forward IN=3Deth0 OUT=3Det=
h1
SRC=3D192.168.12.91 DST=3D195.139.30.62 LEN=3D84 TOS=3D0x00 PREC=3D0x00=
 TTL=3D63
ID=3D0 DF PROTO=3DICMP
TYPE=3D8 CODE=3D0 ID=3D30011 SEQ=3D1

Mar 18 09:33:14 thunderNAT kernel: src-nexus-input IN=3Deth1 OUT=3D
MAC=3D00:0e:0c:c6:b0:49:00:1e:c9:b9:db:9d:08:00 SRC=3D195.139.30.62
DST=3D195.248.230.16 LEN=3D84 TOS=3D
0x00 PREC=3D0x00 TTL=3D128 ID=3D6454 PROTO=3DICMP TYPE=3D0 CODE=3D1 ID=3D=
30011 SEQ=3D1

Like will see the reply enter in the src-nexus-input chain despite off
the conntrack entry show

icmp     1 29 src=3D192.168.12.91 dst=3D195.139.30.62 type=3D8 code=3D0=
 id=3D30011
packets=3D19 bytes=3D1596 [UNREPLIED] src=3D195.139.30.62 dst=3D195.139=
=2E30.16
type=3D0 code=3D0 id=3D30011 packets=3D0 bytes=3D0 mark=3D0 use=3D1

same id but no match.

I have LOG the invalid conntrack states but it doesn't match anything
about this traffic.

Tahnk you again for your help.

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

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
