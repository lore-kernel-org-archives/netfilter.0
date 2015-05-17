From: Tomek L <tl-netfilter@gazeta.pl>
Subject: Re: FTP connection tracking doesn't work with nftables
Date: Sun, 17 May 2015 07:48:14 +0200
Message-ID: <CANfWn6VAbxumZG6wxSktg-iKrt4Sdv72RfPgN-5VynAmWWEDXg@mail.gmail.com>
References: <CANfWn6Wp0bJ5=Q=dw3L+ychgO0f4d5VCdu_gL_9tz3B3stvBvw@mail.gmail.com>
 <CANfWn6XaT_AnCYaikj+vKGiZJUSGE6hokean5v4orn0DxLv4iQ@mail.gmail.com>
 <CAJO99Tm9G3H+jMibWBj2pkAgg1SdFTVS_pqEQ6P=COMqe7Ppcg@mail.gmail.com>
 <CANfWn6W0XdeHUwWFWbYsXQta7O4KBZ0CahATetLZ553fHHd-Bg@mail.gmail.com> <CAJO99Tko6zWC8hH64vGJ6cXXNg3rfLQBo+DL-XuF=b8j82OtOA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJO99Tko6zWC8hH64vGJ6cXXNg3rfLQBo+DL-XuF=b8j82OtOA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?Q?Bj=C3=B8rnar_Ness?= <bjornar.ness@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

After client connection initiation, the helper should temporarily
allow for new TCP connection from client, with source port set to
source port used for first connection + 1, and destination port >1024.
Below is the snapshot from log. But this should be handled by FTP
helper no matter if its TLS or plain session. Start of TLS negotiation
is plaintext ("TLS AUTH....") - so I think it could be handled by
helper safely (so we are sure before opening high ports, we are really
in FTP session).

2015-05-17 07:40:36 Golem ulogd ACTION=3DAccept STATE=3DNew RULE=3D'FTP
incoming' IN=3Deno1 OUT=3D MAC=3D00:1e:67:ab:1f:49:b0:c6:9a:e3:27:c2:08=
:00
SRC=3Dx.x.x.215 DST=3D212.x.x.242 LEN=3D64 TOS=3D00 PREC=3D0x00 TTL=3D5=
8 ID=3D64588
DF PROTO=3DTCP SPT=3D49458 DPT=3D21 SEQ=3D1085504279 ACK=3D0 WINDOW=3D6=
5535 SYN
URGP=3D0 MARK=3D0

2015-05-17 07:40:36 Golem ulogd ACTION=3DDrop RULE=3D'Default drop'
IN=3Deno1 OUT=3D MAC=3D00:1e:67:ab:1f:49:b0:c6:9a:e3:27:c2:08:00
SRC=3Dx.x.x.215 DST=3D212.x.x.242 LEN=3D64 TOS=3D00 PREC=3D0x00 TTL=3D5=
8 ID=3D50205
DF PROTO=3DTCP SPT=3D49459 DPT=3D47244 SEQ=3D3549983851 ACK=3D0 WINDOW=3D=
65535 SYN
URGP=3D0 MARK=3D0




2015-05-16 17:36 GMT+02:00 Bj=C3=B8rnar Ness <bjornar.ness@gmail.com>:
> What port should it open, then?
