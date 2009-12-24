From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Mapping external to internal IP addresses
Date: Thu, 24 Dec 2009 11:01:25 +0100
Message-ID: <4B333BF5.8030005@chello.at>
References: <C757E4D1.D29%npeirson@depoelconsulting.com> <4B323CB6.6090300@chello.at> <4B32803B.1010202@plouf.fr.eu.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B32803B.1010202@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 23.12.2009 21:40, Pascal Hambourg wrote:
> Hello,
>=20
> Mart Frauenlob a =E9crit :
>>
>> Nick Peirson wrote:
>>>
>>> We've got a couple of servers with external IP addresses NAT'd to i=
nternal
>>> IP addresses. Unfortunately the firewall that's performing the NAT =
isn't
>>> under our control and we have a problem where the servers can't acc=
ess each
>>> other via their external IPs.
>=20
> This is a common problem.
>=20
>>> This causes a problem when we use domain names
>>> on the servers, as the DNS lookup returns the external IP address. =
Ideally
>>> I'd like to avoid maintaing hosts files or an internal DNS server.
>>>
>>> I looked to solve this with a iptables rule on each of the servers =
as
>>> follows:
>>> iptables -t mangle -A PREROUTING -d 1.1.1.32/29 -j NETMAP --to 2.2.=
2.32/29
>>>
>>> where 1.1.1.32/29 is the range of external IPs and 2.2.2.32/29 is t=
he range
>>> of internal IPs.
>=20
> Note : the range 192.0.2.0/24 is available and reserved for examples =
and
> documentation. Feel free to use is instead of addresses allocated to
> someone else.
>=20
>>> I was expecting this to map the IP address from the
>>> external to the internal IP.
>=20
> Assuming that 1.1.1.32+n maps to 2.2.2.32+n.
>=20
>>> Firstly, I'm not sure if this would work at all, and if I'm heading=
 in
>>> completely the wrong direction and someone has a better solution, I=
'd be
>>> happy to hear it.
>=20
> Can't you just assign the external addresses to the servers as second=
ary
> addresses ?
>=20
>>> Secondly, if I've got the right idea my implementation is a little =
wrong.
>>> When I run the command, I get "iptables: Invalid argument", which d=
oesn't
>>> provide much info, and I'm not sure how to go about debugging.
>>
>> wrong table, should be the nat table.
>=20
> Wrong chain too. This is locally generated traffic, so the right chai=
n
> is OUTPUT, not PREROUTING.


Oh, yes I was wrong :/ Don't know why I messed up. sorry for the noise.
