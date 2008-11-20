From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Ports
Date: Thu, 20 Nov 2008 20:34:12 +0100
Message-ID: <4925BBB4.1020806@plouf.fr.eu.org>
References: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Mike a =E9crit :
> I am trying to port forward ssh portX to portY on same box
>=20
> iptables -t nat -A PREROUTING -p tcp --dport portX -j DNAT --to :port=
Y

NAT in the PREROUTING chain does not work for the loopback interface.=20
Use the OUTPUT chain instead.
