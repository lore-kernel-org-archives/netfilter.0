From: Tomek L <tl-netfilter@gazeta.pl>
Subject: Re: FTP connection tracking doesn't work with nftables
Date: Sun, 17 May 2015 18:53:21 +0200
Message-ID: <CANfWn6XQfrmDkYLiBOS8qQLLvngpC0iu5FAUQf-Hz=pE7uAcZA@mail.gmail.com>
References: <CANfWn6Wp0bJ5=Q=dw3L+ychgO0f4d5VCdu_gL_9tz3B3stvBvw@mail.gmail.com>
 <CANfWn6XaT_AnCYaikj+vKGiZJUSGE6hokean5v4orn0DxLv4iQ@mail.gmail.com>
 <CAJO99Tm9G3H+jMibWBj2pkAgg1SdFTVS_pqEQ6P=COMqe7Ppcg@mail.gmail.com>
 <CANfWn6W0XdeHUwWFWbYsXQta7O4KBZ0CahATetLZ553fHHd-Bg@mail.gmail.com> <55589864.2010008@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55589864.2010008@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Tomek L <tl-netfilter@gazeta.pl>, netfilter@vger.kernel.org

I agree on source port issue, but I don't think that in case of TLS
there is nothing that can be done with FTP helper. Still we can assume
that just after TLS AUTH negotiation, client will connect on high port
with new connection to server. Now we are in situation, where if TLS
is used, high ports on server side must be open all the time. With
IPTables it was at least possible to make workaround with "recent"
extension, with NFTables we have nothing.

2015-05-17 15:32 GMT+02:00 Pascal Hambourg <pascal@plouf.fr.eu.org>:
> Tomek L a =C3=A9crit :
>> Helper doesn't have to look into encrypted payload.
>
> The helper needs to look into the control connection.
>
>> It would be enough
>> if helper assumes that in the next ~3 seconds, netfilter can expect
>> incoming connection from client on high port, from source port +1
>> higher than original source port used when initiating connection.
>
> This assumption is wrong. AFAIK there is no requirement in the RFCs t=
hat
> the source port for a data connection be +1 higher than the original
> source port used for the control connection. I checked my FTP client
> (tnftp), it uses random source ports for each data connection. Beside=
s,
> source ports may be mangled by any NAT device in the path.
>
> The only requirement is for active mode, the server should use the
> control port -1 (usually 21-1 =3D 20) as the source port for data con=
nections.
