From: Christian Ruppert <idl0r@qasl.de>
Subject: Re: SYNPROXY *NAT/redirects etc.
Date: Wed, 24 Jun 2015 20:07:35 +0200
Message-ID: <8abd0f5b62a44563cb0de95f9a39ee6c@qasl.de>
References: <e662686ca44f5edf617a50d78fa4444d@qasl.de>
 <5589D08C.1000601@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5589D08C.1000601@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi Pascal,

On 2015-06-23 23:33, Pascal Hambourg wrote:
> Christian Ruppert a =C3=A9crit :
>>=20
>> I noticed that neither *NAT nor redirects will work when using the
>> SYNPROXY module with e.g. those settings:
>> net.netfilter.nf_conntrack_tcp_loose=3D0
>> sysctl -w net.ipv4.tcp_syncookies=3D1
>> sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0
>> sysctl -w net.ipv4.tcp_timestamps=3D1
>>=20
>> iptables -t raw -I PREROUTING -p tcp -m tcp --syn -j CT --notrack
>=20
> This rule disables connection tracking which is required for stateful
> NAT operation.

Thanks! From what I've seen/read, this rule is required or am I wrong?=20
It needs to do the complete handshake and upon success it will=20
pass/forward the connection or act somehow like a real proxy.

>=20
>> iptables -I INPUT -p tcp -m tcp -m conntrack --ctstate=20
>> INVALID,UNTRACKED
>> -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
>> iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

--=20
Regards,
Christian Ruppert
