From: Aidas Kasparas <a.kasparas@gmc.lt>
Subject: Re: Capturing a C Class range dynamically into an ipset table within
 iptables. Possible?&#8207;
Date: Fri, 15 Jun 2012 09:00:52 +0300
Message-ID: <4FDACF94.2020208@gmc.lt>
References: <20120614163444.7wwufjwdc0ok4osc@correo.co.cr> <4FDAA365.7040007@gmc.lt> <20120614233924.d2by4nvhcg0cogkw@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120614233924.d2by4nvhcg0cogkw@correo.co.cr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?Sm9zw6kgUGFibG8gUMOpcmV6?= <josepablo@correo.co.cr>
Cc: netfilter@vger.kernel.org

On 2012.06.15 08:39, Jos=C3=A9 Pablo P=C3=A9rez wrote:
> Thanks.. but this would be outside of iptables ruleset.
>=20
> I need a way to dynamically feed the ipset as traffic cones in via th=
e
> ruleset.
>=20
>=20

You send to this ipset the same way you did for individual source
addresses. If ipset is created with ommitted netmask parameter, it
stores ip addresses individually. If netmask parameter is present,
ipsets will store and check just a network part of ip address supplied
by iptables. Commands to add, list and test addresses were provided jus=
t
for illustration. iptables rules should work the same.


>=20
>=20
>=20
> Aidas Kasparas <a.kasparas@gmc.lt> ha escrito:
>=20
>> On 2012.06.15 01:34, Jos=C3=A9 Pablo P=C3=A9rez wrote:
>>> Currently with ipset iam able to send to a table the inidivual (/32=
)
>>> source IP of a connection...
>>>
>>> I need a way to send to iptables the C Class to an ipset .
>>>
>>> In other words I need the historical list of last 30 min of C class
>>> ranges that have requested my server.
>>>
>>> I need this preferably done without something outside of iptables (=
such
>>> as a daemon).
>>>
>>
>> just use parameter netmask 24 while creating ipset and you're done.
>>
>> test:~# ipset create test hash:ip timeout 60 netmask 24
>> test:~# ipset add test 127.0.1.2
>> test:~# ipset add test 127.3.4.5
>> test:~# ipset list test
>> Name: test
>> Type: hash:ip
>> Header: family inet hashsize 1024 maxelem 65536 netmask 24 timeout 6=
0
>> Size in memory: 16632
>> References: 0
>> Members:
>> 127.0.1.0 timeout 50
>> 127.3.4.0 timeout 55
>> test:~# ipset test test 127.0.1.1
>> 127.0.1.1 is in set test.
>> test:~#
>>
>>
>>
>> --=20
>> Aidas Kasparas
>>
>>
>=20
>=20
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Aidas Kasparas
