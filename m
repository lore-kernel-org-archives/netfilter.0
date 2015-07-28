From: Christian Ruppert <idl0r@qasl.de>
Subject: Re: SYNPROXY *NAT/redirects etc.
Date: Tue, 28 Jul 2015 17:34:47 +0200
Message-ID: <dfdd88e40b0e2d94b9d0dda04d4a92c1@qasl.de>
References: <e662686ca44f5edf617a50d78fa4444d@qasl.de>
 <5589D08C.1000601@plouf.fr.eu.org>
 <8abd0f5b62a44563cb0de95f9a39ee6c@qasl.de> <558B27CA.20707@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <558B27CA.20707@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hey,

On 2015-06-24 23:57, Pascal Hambourg wrote:
> Christian Ruppert a =C3=A9crit :
>>=20
>> On 2015-06-23 23:33, Pascal Hambourg wrote:
>>> Christian Ruppert a =C3=A9crit :
>>>>=20
>>>> iptables -t raw -I PREROUTING -p tcp -m tcp --syn -j CT --notrack
>>>=20
>>> This rule disables connection tracking which is required for statef=
ul
>>> NAT operation.
>>=20
>> Thanks! From what I've seen/read, this rule is required or am I wron=
g?
>=20
> AFAIK it's not strictly required for SYNPROXY operation. It just save=
s
> connection tracking resources.

I tried some different setups but somehow I don't get it working.

So if we keep using the "sysctl -w=20
net.netfilter.nf_conntrack_tcp_loose=3D0"
Which is still being used by:
iptables -I INPUT -p tcp -m tcp -m conntrack --ctstate INVALID -j=20
SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460

I thought I could just avoid that --notrack rule and therefor do=20
something like:
iptables -I INPUT -p tcp -m tcp --syn -j SYNPROXY --sack-perm=20
--timestamp --wscale 7 --mss 1460

But that doesn't work (neither new nor established connections work,=20
default INPUT is DROP btw.). What's the difference here between the=20
raw/PREROUTING rule that basically just marks it as untracked so it can=
=20
be passed to the extension in the filter table and just doing "--syn -j=
=20
SYNPROXY ..." in the filter table? Does the "--notrack" one actually=20
more?
I need to keep the NAT/redirect functionality while using the SYNPROXY=20
extension.

--=20
Regards,
Christian Ruppert
