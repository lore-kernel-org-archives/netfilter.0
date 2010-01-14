From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: Re: nf_conntrack_sip and nf_nat_sip can do this??
Date: Thu, 14 Jan 2010 11:13:29 +0100
Message-ID: <20100114111329.216832szeqp9zdyc@ek2pim.upc.edu>
References: <20091214104526.93556bb1q7xj41s0@ek2pim.upc.edu>
	<20100111132614.14651hiwfxvj3h8k@ek2pim.upc.edu>
	<4B4D82E2.6090405@trash.net>
	<20100113143859.18292p3kbz00a60g@ek2pim.upc.edu>
	<4B4DD05A.4000606@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4DD05A.4000606@trash.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes	format=flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org, vhuertas@indra.es, devel@thom.fr.eu.org

I have been investigating and the registration process is done correctl=
y:
a private user inside the LAN sends the REGISTER to the Proxy via the =20
gateway and it changes the private IP for the public IP. When the =20
Proxy answers it, the gateway does the same but in the other way round.

It is during the INVITE that I have seen some problems.

When a private client sends an INVITE directed to a client outside the =
=20
LAN (a public client) again it works ok. However, when a public client =
=20
sends an INVITE to call a private client there is an error:

Public Client to my Proxy:
INVITE sip:private_client@domain_name
        From:caller@domain_name
        To:callee@domain_name
        contact: caller@10.1.x.x

The proxy talks with my server to know the location of the callee and =20
it answers with the public IP of my gateway in a determined port. So =20
the Proxy sends the invite to it:
INVITE sip:private_client@10.1.x.y
        From:caller@domain_name
        To:callee@domain_name
        contact: caller@10.1.x.x

And now the gateway redirects the invite to my private client but it =20
DOES NOT change the R-URI. However, when the invite reaches the =20
client, it answers with a "183 Session progress" and then it puts its =20
correct contact:
183 SESSION PROGRESS
        From:caller@domain_name
        To:callee@domain_name
        contact: callee@192.168.x.x

And now, in the following messages between the caller and the callee, =20
it changes correctly the private address for the public one and in the =
=20
other way round.
It is as the gateway only starts to work correctly if the message =20
comes from the LAN.

I have checked the /proc/net/nf_conntrack_expect and it contains this:

598000 l3proto =3D 2 proto=3D17 src=3D0.0.0.0 dst=3D10.1.x.x sport=3D0 =
=20
dport=3D1061 PERMANENT
597394 l3proto =3D 2 proto=3D17 src=3D0.0.0.0 dst=3D10.1.x.x sport=3D0 =
=20
dport=3D1081 PERMANENT

Is it correct that the source is 0.0.0.0 in both cases?

By the way, my iptables configuration is the following one (Am I =20
missing something?):

#! /bin/bash

# The script is saved in /etc/firewall.bash

# Load modules:
/sbin/modprobe ip_tables
/sbin/modprobe iptable_nat
/sbin/modprobe iptable_filter
/sbin/modprobe nf_conntrack
/sbin/modprobe nf_nat
/sbin/modprobe -r nf_nat_sip
/sbin/modprobe -r nf_conntrack_sip
/sbin/modprobe nf_conntrack_sip ports=3D5060,4060 =20
sip_direct_signalling=3D0 sip_direct_media=3D0
/sbin/modprobe nf_nat_sip

# Remove all rules and chains:
iptables -F
iptables -X

# Forward:
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p udp --dport 5060 -j ACCEPT
iptables -A FORWARD -p udp --dport 4060 -j ACCEPT

# MASQUERADE:
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# End message:
echo " [End iptables rules setting]"

Thanks in advance,
Rebeca Martinez

"Patrick McHardy" <kaber@trash.net> escribi=C3=B3:

> rebeca.martinez-garcia@estudiant.upc.edu wrote:
>> Hi all,
>>
>> I think it is better to explain the complete situation.
>>
>> I have 2 SIP clients in a private LAN that connect to a public
>> Server/Proxy by means of a gateway. Actually, this Server/Proxy is n=
ot
>> one machine but 4: one of them is a Proxy (the first contact point o=
f
>> the SIP clients to this "platform") and another one is the Server wh=
ere
>> the register and authentication procedures are done.
>>
>> This means that when a "private" client wants to register in this
>> "platform", its REGISTER message is directed to the Proxy via the
>> gateway. To make it simple, let's assume that in the "platform" the
>> Proxy directly redirects the REGISTER message to the Server (it is i=
n
>> fact a little more complicated but at the end the message reaches th=
at
>> Server). However, as there is no authentication information on the
>> message, it sends back to the client a 401 Unauthorized error.
>>
>> The client incorporates the authentication information needed to the
>> REGISTER message and sends it again to the Proxy and now the Server
>> accepts the registration (it sends a 200 OK). Now this client can ca=
ll
>> other users registered in this "platform".
>>
>> But, as the gateway NATs all incoming messages from the LAN, I faced
>> problems of one-way audio and non-routing IP addresses. That was sol=
ved
>> by incorporating to the CNG's iptables the nf_conntrack_sip and
>> nf_nat_sip modules.
>>
>> If a client wants to call another client (it does not matter if it i=
s
>> private or public, it redirects the INVITE message to the "platform"
>> because it knows the callee location). So a call between two private
>> clients is as I have shown in a previous e-mail (I skip the
>> communication inside the platform):
>>
>> Caller -------1.INVITE------>             ----------2.INVITE--------=
>
>>                             Gateway (NAT)                          P=
roxy
>>                       nf_conntrack_sip+nf_nat_sip
>> Callee <-----4.INVITE-------              <---------3.INVITE--------
>>
>> 1: INVITE sip:callee@open-ims.test
>>      From: sip:caller@open-ims.test
>>      To: sip:callee@open-ims.test
>>      Contact: sip:caller@192.168.x.x:5061
>> 2. INVITE sip:callee@open-ims.test
>>      From: sip:caller@open-ims.test
>>      To: sip:callee@open-ims.test
>>      Contact: sip:caller@10.1.y.y:5061
>> 3. INVITE sip:callee@10.1.y.y:5060
>>      From: sip:caller@open-ims.test
>>      To: sip:callee@open-ims.test
>>      Contact: sip:caller@10.1.y.y:5061
>> 4. INVITE sip:callee@10.1.y.y:5061
>>      From: sip:caller@open-ims.test
>>      To: sip:callee@open-ims.test
>>      Contact: sip:caller@10.1.y.y:5061
>>
>> And is in the 4.INVITE where I have realised there is a problem: it =
does
>> not change the public IP of the callee to the private one, neither
>> change the Contact IP of the caller.
>
> Well, that seems to be the problem. The conntrack helper can only
> recognize that the call is internal if a) the addresses have been
> properly rewritten on their way out and b) the proxy keeps the
> original SDP addresses and doesn't decide to relay RTP itself.
>
>> So when they start to send their RTP streams, they send them to the
>> public IP of my gateway on the corresponding port. The caller sends =
the
>> stream to the 127.1.y.y.5060 and my gateway redirects it to the
>> 192.168.x.x:5060.
>> So I guess that the gateway has a table in which it indicates for ea=
ch
>> private_ip:port the corresponding public_ip:port.
>
> Something like that. You can see parts of the mapping in
> /proc/net/nf_conntrack_expect after registration or invitations.
>
>> Then, if the gateway has this table (that in fact is like a local
>> location information), is it possible to configure "something" in
>> iptables to, knowing that the requested callee is inside the LAN, ro=
ute
>> the message directly to it?
>
> No, this should work automatically. You need to figure out
> why the address is not translated back, most likely there's
> a mismatch between the addresses or ports in the packet
> and the expectation.
>


