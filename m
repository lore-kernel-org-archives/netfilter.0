From: Tomek L <tl-netfilter@gazeta.pl>
Subject: Re: FTP connection tracking doesn't work with nftables
Date: Sat, 16 May 2015 17:34:37 +0200
Message-ID: <CANfWn6W0XdeHUwWFWbYsXQta7O4KBZ0CahATetLZ553fHHd-Bg@mail.gmail.com>
References: <CANfWn6Wp0bJ5=Q=dw3L+ychgO0f4d5VCdu_gL_9tz3B3stvBvw@mail.gmail.com>
 <CANfWn6XaT_AnCYaikj+vKGiZJUSGE6hokean5v4orn0DxLv4iQ@mail.gmail.com> <CAJO99Tm9G3H+jMibWBj2pkAgg1SdFTVS_pqEQ6P=COMqe7Ppcg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJO99Tm9G3H+jMibWBj2pkAgg1SdFTVS_pqEQ6P=COMqe7Ppcg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?Q?Bj=C3=B8rnar_Ness?= <bjornar.ness@gmail.com>
Cc: Tomek L <tl-netfilter@gazeta.pl>, netfilter@vger.kernel.org

Helper doesn't have to look into encrypted payload. It would be enough
if helper assumes that in the next ~3 seconds, netfilter can expect
incoming connection from client on high port, from source port +1
higher than original source port used when initiating connection.
Sorry but opening high port range just to handle ftp connection is
weak advice...
In IPTables it could be done with --recent extension.

2015-05-16 14:12 GMT+02:00 Bj=C3=B8rnar Ness <bjornar.ness@gmail.com>:
> It is not possible for helper to look inside encrypted packets. Only =
option
> is to open a portrange.
