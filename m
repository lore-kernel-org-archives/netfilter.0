From: Joris Korbeeck <korbeeck@hotmail.com>
Subject: RE: Tracking broadcasting replies *only* using 'conntrack'
Date: Wed, 26 Nov 2008 13:08:00 +0100
Message-ID: <COL106-W1DAD088C13697A5A39B66D30A0@phx.gbl>
References: <COL106-W8151DEB519AE7145178A79D30B0@phx.gbl>
 <492BDCB6.5000702@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <492BDCB6.5000702@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: pascal.mail@plouf.fr.eu.org, netfilter@vger.kernel.org


 Ubuntu's UFW firewall is easy to use and by default allows replies to =
established connections. Unfortunately=97and this is where Pascal's tip=
 fits in=97it doesn't recognize responses to broadcasts, because iptabl=
es lacks this feature.

 Therefore adding "nf_conntrack_netbios_ns" to UFW's default parameter =
'IPT_MODULES' in /etc/default/ufw fixes the NetBIOS hostname resolution=
 functionality.

 Pascal, thanks for your valuable suggestion!

Joris

> Date: Tue, 25 Nov 2008 12:08:38 +0100
> From: pascal.mail@plouf.fr.eu.org
> To: netfilter@vger.kernel.org
> Subject: Re: Tracking broadcasting replies *only* using 'conntrack'
>=20
> Joris Korbeeck a =E9crit :
>>=20
>>  But unfortunately 'conntrack' doesn't recognize the sender's IP
>> address (e.g. 192.168.1.3) as a 'member' of 192.168.1.255. Does anyo=
ne
>> have a solution to allow these replies to hostname resolution reques=
ts
>> which make use of random ports?
>=20
> Indeed conntrack does not handle broadcasts. You need to load the=20
> NetBIOS Name Service conntrack helper module ip_conntrack_netbios_ns =
(on=20
> older kernels) or nf_conntrack_netbios_ns (on newer kernels).
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE=
!
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/