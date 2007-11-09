From: Martijn Lievaart <m@rtij.nl>
Subject: Re: ftp_conntrack and encrypted FTP
Date: Fri, 09 Nov 2007 14:09:12 +0100
Message-ID: <47345BF8.9090600@rtij.nl>
References: <47344111.2020005@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47344111.2020005@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter ML <netfilter@vger.kernel.org>

Leonardo Rodrigues Magalh=E3es wrote:
>
>    Hello Guys,
>
>    I'm having some troubles with encrypted FTP connections. As i coul=
d=20
> imagine, conntrack_ftp and nat_ftp are not being able of recognizing=20
> the correct ports to open because the connection is encrypted and the=
=20
> PASV information is not seen by the modules.
>
>    I dont think so ..... but is there any way of working around this =
??
>

Use scp instead.

HTH
M4

