From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: udplite and ports
Date: Tue, 16 Mar 2010 13:09:35 +0100
Message-ID: <4B9F74FF.9000200@chello.at>
References: <4B9B568F.7020609@chello.at> <4B9F3478.60702@chello.at> <4B9F6B49.9060805@plouf.fr.eu.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B9F6B49.9060805@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 16.03.2010 12:28, Pascal Hambourg wrote:
> Mart Frauenlob a =E9crit :
>>>
>>> what am I missing, why is that command not working:
>>>
>>> iptables -A INPUT -i eth2 -p udplite --destination-port 123 -j ACCE=
PT
>>> iptables v1.4.7: unknown option `--destination-port'
>>> Try `iptables -h' or 'iptables --help' for more information.
> [...]
>>> -p udplite -m multiport --ports 123,124 ... works.
>=20
> According to changelogs, support for UDPLITE in multiport was added i=
n
> iptables 1.3.8 (the man page does not seem to have been updated thoug=
h).
>=20
>> I would have expect it to work like -p udp. Am I wrong?
>> But there's no libxt_udplite.so.
>=20
> --dport is an option of some "-m <protocol>" matches (implicit with "=
-p
> <protocol>") such as tcp, udp, sctp, dccp handled by libxt_<protocol>=
=2Eso
> libraries. As you pointed out, there is no libxt_udplite.so, so no "-=
m
> udplite" match nor --dport option for UDPLITE.

Thank you Pascal,

ok, it's simply not implemented...
It seemed somehow improbable to me, that support for udplite within
conntrack, nat and multiport was added, but no protocol match.
Relying on something not being in the man page *sigh* isn't assured to
be correct.

Best regards

Mart



