From: "Christoph A." <casmls@gmail.com>
Subject: Re: Firewall Configuration Help
Date: Wed, 05 Aug 2009 20:21:01 +0200
Message-ID: <4A79CD8D.4030005@gmail.com>
References: <4399fd970907271056m24713eecj5d6f20aed572cc36@mail.gmail.com> <47ae5fdc6d1c4a93d1035f61774996ec@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="------------enig42B0AF1C75654D9BE51DFDB7"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :x-enigmail-version:content-type;
        bh=k+SX9+hkKkh7/CaETE+mRL94QqzXWtlCiQgZBRVcpho=;
        b=wpqAugqZdrLSmnjYw8+5cZyKrlBlvvPri5sYMNSJVM81WJPTxYMaRaIZnZlSP14kEY
         qBdStx7E6dfADlIumEiPlnMCsf+hxCMIucS8/1jnUJmlOYfQqn92UHYT3RFKXWSNlAob
         D2IPRoJbh0/w9gQKznm77MXWco1ddOyU8DS54=
In-Reply-To: <47ae5fdc6d1c4a93d1035f61774996ec@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Julien Vehent <julien@linuxwall.info>, NICHOLAS KLINE <nkline@kent.edu>, "Christoph A." <casmls@gmail.com>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig42B0AF1C75654D9BE51DFDB7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28.07.2009 11:09, Julien Vehent wrote:
>> # The following will NOT interfere with local inter-process traffic,
> whose
>> # packets have the source IP of the local loopback interface, e.g.
>> 127.0.0.1
>>
>> $IPTABLES -A INPUT -s $IP_LOCAL -j LOG --log-prefix "Spoofed source IP=
"
>> $IPTABLES -A INPUT -s $IP_LOCAL -j DROP
>>
>> # Tell netfilter that all TCP sessions do indeed begin with SYN
>>
>> $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j LOG
>> --log-prefix "Stealth scan attempt?"
>> $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
>>
>>
>=20
> My understanding of the conntrack subsystem is that a connection cannot=
 be
> in the state NEW without a syn packet, therefore I don't think this is
> useful.


I also thought that such a packet has the state INVALID, but after
making some tests I saw that such TCP packets (! --syn with state NEW)
are possible, but considering his hole ruleset these packets would be
DROPed anyway by his default policy, because he has no
-A INPUT ... --state NEW -j ACCEPT
rules in his ruleset.
This means that the rule is redundant and should be removed to minimize
the number of rules.

Just for the record, I tested it like this:
I generated a packet with hping that has only the ACK flag set and
to see the state I created some logging rules:

iptables -A INPUT -p tcp --sport 9999 ! --syn -m state --state NEW -j
LOG --log-prefix "NEW_: "
iptables -A INPUT -p tcp --sport 9999 ! --syn -m state --state RELATED
-j LOG --log-prefix "RELATED_: "
iptables -A INPUT -p tcp --sport 9999 ! --syn -m state --state
ESTABLISHED -j LOG --log-prefix "ESTABLISHED_: "
iptables -A INPUT -p tcp --sport 9999 ! --syn -m state --state INVALID
-j LOG --log-prefix "INVALID_: "


test #1: (ACK flag set)
hping3 -c 1 -I wlan0 -A -s 9999 -p 1110 localhost

Logging output:
NEW_: IN=3Dlo OUT=3D MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00
SRC=3D192.168.1.33 DST=3D127.0.0.1 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
64 ID=3D4943
PROTO=3DTCP SPT=3D9999 DPT=3D1110 WINDOW=3D512 RES=3D0x00 ACK URGP=3D0

state =3D> NEW
------------------------------------------------------
test #2 (no TCP flags set):
hping command:

hping -c 1 -I wlan0 -s 9999 -p 1111 localhost

Logging output:
INVALID_: IN=3Dlo OUT=3D MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00
SRC=3D192.168.1.33 DST=3D127.0.0.1 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
64 ID=3D9687
PROTO=3DTCP SPT=3D9999 DPT=3D1111 WINDOW=3D512 RES=3D0x00 URGP=3D0

(test was made with iptables v1.4.3.1)


On 05.08.2009 15:35, Mart Frauenlob wrote:
> Wrong, from the iptables tutorial 1.2.2 at frozentux:
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#STATEMACH=
INE
>
> The NEW state tells us that the packet is the first packet that we see.=

> This means that the first packet that the conntrack module sees, within=

> a specific connection, will be matched. For example, if we see a SYN
> packet and it is the first packet in a connection that we see, it will
> match. However, the packet may as well not be a SYN packet and still be=

> considered NEW.

Given this fact I'm reconsidering my rules like:

iptables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT

to be changed to:
iptables -A INPUT -p tcp --dport 80 --syn -j ACCEPT
(because this is the samller group of packets and works as well)

best regards,
Christoph A.


--------------enig42B0AF1C75654D9BE51DFDB7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEAREKAAYFAkp5zZMACgkQrq+riTAIEg0VWgCg1Ae3V0xfZZ+1/XssyzJGgCMQ
CgkAn22ikVeka35bUugZDns24GMhgBOB
=3hzY
-----END PGP SIGNATURE-----

--------------enig42B0AF1C75654D9BE51DFDB7--
