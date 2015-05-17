From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: FTP connection tracking doesn't work with nftables
Date: Sun, 17 May 2015 15:32:20 +0200
Message-ID: <55589864.2010008@plouf.fr.eu.org>
References: <CANfWn6Wp0bJ5=Q=dw3L+ychgO0f4d5VCdu_gL_9tz3B3stvBvw@mail.gmail.com> <CANfWn6XaT_AnCYaikj+vKGiZJUSGE6hokean5v4orn0DxLv4iQ@mail.gmail.com> <CAJO99Tm9G3H+jMibWBj2pkAgg1SdFTVS_pqEQ6P=COMqe7Ppcg@mail.gmail.com> <CANfWn6W0XdeHUwWFWbYsXQta7O4KBZ0CahATetLZ553fHHd-Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANfWn6W0XdeHUwWFWbYsXQta7O4KBZ0CahATetLZ553fHHd-Bg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tomek L <tl-netfilter@gazeta.pl>
Cc: netfilter@vger.kernel.org

Tomek L a =E9crit :
> Helper doesn't have to look into encrypted payload.

The helper needs to look into the control connection.

> It would be enough
> if helper assumes that in the next ~3 seconds, netfilter can expect
> incoming connection from client on high port, from source port +1
> higher than original source port used when initiating connection.

This assumption is wrong. AFAIK there is no requirement in the RFCs tha=
t
the source port for a data connection be +1 higher than the original
source port used for the control connection. I checked my FTP client
(tnftp), it uses random source ports for each data connection. Besides,
source ports may be mangled by any NAT device in the path.

The only requirement is for active mode, the server should use the
control port -1 (usually 21-1 =3D 20) as the source port for data conne=
ctions.
