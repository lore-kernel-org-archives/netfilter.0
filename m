From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: How to mark RTSP child connections with different value.
Date: Mon, 23 Jun 2014 20:41:56 +0200
Message-ID: <53A874F4.7030606@plouf.fr.eu.org>
References: <CALUesLixvZPSeJOr7-0KXTKkmagUW4N5Xb88XqrOVLgCchrshg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALUesLixvZPSeJOr7-0KXTKkmagUW4N5Xb88XqrOVLgCchrshg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thierry Du Tre <thierry.dutre.tch@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Thierry Du Tre a =E9crit :
>=20
> I am trying to apply some QoS for RTSP traffic forwarded by an OpenWR=
T
> gateway (Attitude Adjustment + patches).
>=20
> The RTSP helper is loaded and succesfully expects the incoming
> streams, which arrive at the client in the NAT'ed lan.
> Multiwan is also active, this is using part of the marking bits (i.e.
> 0xF0000000 ) to select the appropriate routing table.
[...]
> When RTSP helper succesfully predicts incoming streams, these childs
> automatically inherit the connection mark, and as such will be marked
> with the same mwan and qos bits as the parent connection. For mwan
> this is ok, but for qos a different (higher) value would be prefered
> (i.e. 0x0A000000).
> Ideally, the child streams should be assigned a specified connmark
> value when RTSP helper is predicting them.
> A generic solution that would be applicable to parent-child
> connections handled by other helpers would be nice :-)

What about matching the packets of the RTSP streams and MARK/CONNMARK
them when they arrive ?

-m state --state RELATED : match the first packet of related streams
-m conntrack --ctstatus EXPECTED : match all packets of expected stream=
s
-m helper --helper "rtsp" : match all packets related to the RTSP helpe=
r
