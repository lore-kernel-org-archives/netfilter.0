From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Tracking broadcasting replies *only* using 'conntrack'
Date: Tue, 25 Nov 2008 12:08:38 +0100
Message-ID: <492BDCB6.5000702@plouf.fr.eu.org>
References: <COL106-W8151DEB519AE7145178A79D30B0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <COL106-W8151DEB519AE7145178A79D30B0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Joris Korbeeck a =E9crit :
>=20
>  But unfortunately 'conntrack' doesn't recognize the sender's IP
> address (e.g. 192.168.1.3) as a 'member' of 192.168.1.255. Does anyon=
e
> have a solution to allow these replies to hostname resolution request=
s
> which make use of random ports?

Indeed conntrack does not handle broadcasts. You need to load the=20
NetBIOS Name Service conntrack helper module ip_conntrack_netbios_ns (o=
n=20
older kernels) or nf_conntrack_netbios_ns (on newer kernels).
