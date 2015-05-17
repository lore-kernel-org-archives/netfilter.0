From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: FTP connection tracking doesn't work with nftables
Date: Sun, 17 May 2015 22:59:58 +0200
Message-ID: <5559014E.7070803@plouf.fr.eu.org>
References: <CANfWn6Wp0bJ5=Q=dw3L+ychgO0f4d5VCdu_gL_9tz3B3stvBvw@mail.gmail.com> <CANfWn6XaT_AnCYaikj+vKGiZJUSGE6hokean5v4orn0DxLv4iQ@mail.gmail.com> <CAJO99Tm9G3H+jMibWBj2pkAgg1SdFTVS_pqEQ6P=COMqe7Ppcg@mail.gmail.com> <CANfWn6W0XdeHUwWFWbYsXQta7O4KBZ0CahATetLZ553fHHd-Bg@mail.gmail.com> <55589864.2010008@plouf.fr.eu.org> <CANfWn6XQfrmDkYLiBOS8qQLLvngpC0iu5FAUQf-Hz=pE7uAcZA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANfWn6XQfrmDkYLiBOS8qQLLvngpC0iu5FAUQf-Hz=pE7uAcZA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tomek L <tl-netfilter@gazeta.pl>
Cc: netfilter@vger.kernel.org

Tomek L a =E9crit :
> I agree on source port issue, but I don't think that in case of TLS
> there is nothing that can be done with FTP helper. Still we can assum=
e
> that just after TLS AUTH negotiation, client will connect on high por=
t
> with new connection to server. Now we are in situation, where if TLS
> is used, high ports on server side must be open all the time.

IMO, it is not much better to open all passive ports to any host which
has established a connection to port 21 regardless of whether a
PASV/EPSV command was acknowledged by the server.
