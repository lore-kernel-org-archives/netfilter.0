From: Alexei Ustyuzhaninov <alust@alust.homeunix.com>
Subject: Re: fwmark iptables/ip routing interaction question
Date: Sat, 17 May 2008 18:37:43 +0600
Message-ID: <482ED197.8040509@alust.homeunix.com>
References: <49159.212.190.198.36.1210171014.squirrel@webserver6.intec.ugent.be> <alpine.LNX.1.10.0805071703150.30395@fbirervta.pbzchgretzou.qr> <48271D8B.5030608@alust.homeunix.com> <alpine.LNX.1.10.0805111938210.19952@fbirervta.pbzchgretzou.qr> <482731F8.9030806@alust.homeunix.com> <482DA25D.70703@plouf.fr.eu.org> <482E56C1.2070508@alust.homeunix.com> <482EB827.8010608@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482EB827.8010608@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> Alexei Ustyuzhaninov a =E9crit :
>> Pascal Hambourg wrote:
>>>
>>> SNAT should work on packets creating a new connection (i.e. in the=20
>>> state NEW).
>>
>> Yes, really! The SYN packet goes out through the right interface wit=
h=20
>> the right source address, SYN/ACK comes back and that's all, nothing=
=20
>> will happen more.
>=20
> This looks like a filtering issue causing the reply packet to be=20
> dropped. Check your iptables 'filter' rules and that source validatio=
n=20
> by reversed path is disabled for that interface=20
> (/proc/sys/net/ipv4/conf/<interface>/rp_filter=3D0).

Yes, rp_filter was the issue indeed. Thank you very much.

>> I just want a simple thing: to send mail via one provider and all ot=
her
>> traffic via the other provider
>=20
> You may be able to specify the desired source address for outgoing=20
> connections if your mail application allows it.


No, of course the mail application doesn't bother about source addresse=
s=20
and IP routing. I believe it operates at different level of ISO model. =
:)

--=20
Thanks again,
Alexei
