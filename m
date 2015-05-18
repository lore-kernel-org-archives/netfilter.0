From: Tomek L <tl-netfilter@gazeta.pl>
Subject: Re: FTP connection tracking doesn't work with nftables
Date: Mon, 18 May 2015 07:58:54 +0200
Message-ID: <CANfWn6Vtio5yQb8h1aEyj1dsO8+Z9o4vUERoHSV6447RA5OmmA@mail.gmail.com>
References: <CANfWn6Wp0bJ5=Q=dw3L+ychgO0f4d5VCdu_gL_9tz3B3stvBvw@mail.gmail.com>
 <CANfWn6XaT_AnCYaikj+vKGiZJUSGE6hokean5v4orn0DxLv4iQ@mail.gmail.com>
 <CAJO99Tm9G3H+jMibWBj2pkAgg1SdFTVS_pqEQ6P=COMqe7Ppcg@mail.gmail.com>
 <CANfWn6W0XdeHUwWFWbYsXQta7O4KBZ0CahATetLZ553fHHd-Bg@mail.gmail.com>
 <55589864.2010008@plouf.fr.eu.org> <CANfWn6XQfrmDkYLiBOS8qQLLvngpC0iu5FAUQf-Hz=pE7uAcZA@mail.gmail.com>
 <5559014E.7070803@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5559014E.7070803@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Tomek L <tl-netfilter@gazeta.pl>, netfilter@vger.kernel.org

I would say it is better to have high ports open on demand (after AUTH
TLS) than have them open all the time. NFTables are now useless to me,
as their FTP/TLS passive mode is not supported neither by helper or by
"recent" extension.

2015-05-17 22:59 GMT+02:00 Pascal Hambourg <pascal@plouf.fr.eu.org>:
> Tomek L a =C3=A9crit :
>> I agree on source port issue, but I don't think that in case of TLS
>> there is nothing that can be done with FTP helper. Still we can assu=
me
>> that just after TLS AUTH negotiation, client will connect on high po=
rt
>> with new connection to server. Now we are in situation, where if TLS
>> is used, high ports on server side must be open all the time.
>
> IMO, it is not much better to open all passive ports to any host whic=
h
> has established a connection to port 21 regardless of whether a
> PASV/EPSV command was acknowledged by the server.
