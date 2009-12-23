From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Mapping external to internal IP addresses
Date: Wed, 23 Dec 2009 21:40:27 +0100
Message-ID: <4B32803B.1010202@plouf.fr.eu.org>
References: <C757E4D1.D29%npeirson@depoelconsulting.com> <4B323CB6.6090300@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B323CB6.6090300@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Mart Frauenlob a =E9crit :
>
> Nick Peirson wrote:
>>
>> We've got a couple of servers with external IP addresses NAT'd to in=
ternal
>> IP addresses. Unfortunately the firewall that's performing the NAT i=
sn't
>> under our control and we have a problem where the servers can't acce=
ss each
>> other via their external IPs.

This is a common problem.

>> This causes a problem when we use domain names
>> on the servers, as the DNS lookup returns the external IP address. I=
deally
>> I'd like to avoid maintaing hosts files or an internal DNS server.
>>
>> I looked to solve this with a iptables rule on each of the servers a=
s
>> follows:
>> iptables -t mangle -A PREROUTING -d 1.1.1.32/29 -j NETMAP --to 2.2.2=
=2E32/29
>>
>> where 1.1.1.32/29 is the range of external IPs and 2.2.2.32/29 is th=
e range
>> of internal IPs.

Note : the range 192.0.2.0/24 is available and reserved for examples an=
d
documentation. Feel free to use is instead of addresses allocated to
someone else.

>> I was expecting this to map the IP address from the
>> external to the internal IP.

Assuming that 1.1.1.32+n maps to 2.2.2.32+n.

>> Firstly, I'm not sure if this would work at all, and if I'm heading =
in
>> completely the wrong direction and someone has a better solution, I'=
d be
>> happy to hear it.

Can't you just assign the external addresses to the servers as secondar=
y
addresses ?

>> Secondly, if I've got the right idea my implementation is a little w=
rong.
>> When I run the command, I get "iptables: Invalid argument", which do=
esn't
>> provide much info, and I'm not sure how to go about debugging.
>=20
> wrong table, should be the nat table.

Wrong chain too. This is locally generated traffic, so the right chain
is OUTPUT, not PREROUTING.

> I'd try the following:
>=20
> INT_NET=3D
> EXT_NET=3D
> SERVER_EXT_IP=3D
> SERVER_INT_IP=3D
>=20
> # select only packets with source =3D external server ip and destinat=
ion =3D
> external net

Why "source =3D external server ip" ? IIUC, the source will be the only
address the server has, i.e. the internal one.

> iptables -t nat -A PREROUTING -s $SERVER_EXT_IP -d $EXT_NET -j NETMAP
> --to $INT_NET

Wrong chain, see above.

> # maybe needed that packets find the way back (over the same interfac=
e)
> iptables -t nat -A POSTROUTING -s $SERVER_EXT_IP -d $INT_NET -j SNAT
> --to-source $SERVER_INT_IP

Same question as above, how could the packet have $SERVER_EXT_IP as a
source ?

> Don't forget to allow the traffic in the filter table FORWARD chain.

No need to. There is no forwarding here, just direct communication
between hosts in the same network.
