From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Wed, 07 Jan 2009 09:51:34 +0100
Message-ID: <49646D16.8040505@unipex.it>
References: <665067273@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <665067273@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Roland_H=E4der?= <r.haeder@web.de>
Cc: netfilter@vger.kernel.org

Roland H=E4der wrote:
> I suppose I should not replace my _whole_ ruleset but a small part?
> Else these rules will be a little less secure.
>=20

Those replace only the forward one and add some debug. Of course, at th=
e
end of tests, you'll modify and replace your rules with mine :)

> And currently my firewall got attacked on port 110 which is (sadly!)
> reachable on all NICs.
>=20

IP -I INPUT -m state --state NEW -p tcp --dport 110 -j ACCEPT

> So where should I add/replace your rules?
>=20

=46or test, into a "running" env, so after yours.

>> For this into the above iptables.list there are no rules! IP -A
>> PREROUTING -i eth0 -p tcp --dport 30017 -j DNAT --to-destination=20
>> 192.168.1.17
>>=20
>> and add the forward one
> I have a similar one already and as I said, it worked before like a
> sharm. :)
>=20

Strange. Start with a "rule clean" and recreate the only one that do th=
e
work you want. Make them work and after, and only after, start to debug


Bye

