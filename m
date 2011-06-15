From: Steven Kath <steven.kath@vyatta.com>
Subject: Re: come back the traffic on same interface which it input
Date: Wed, 15 Jun 2011 11:58:11 -0700
Message-ID: <1308164291.32634.26.camel@lt>
References: <BANLkTimf7nTztsuo2ov1QuUN=ACKHsBsvw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTimf7nTztsuo2ov1QuUN=ACKHsBsvw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Tue, 2011-06-14 at 23:31 -0300, Usu=C3=A1rio do Sistema wrote:
> hello everyone, I have two ISPs in my firewall that are ADSLs lines. =
I
> wish that all trafic input in wan1 ( ISP1 ) come back on it. but this
> isn't happening because the firewall gateway is ISP2 ( wan2 ) so all
> input traffic by ISP1 ( wan1 ) doesn't work because the firewall
> forwards all traffic as it as your gateway wich is ISP2
>=20
> for exemplo, I have a http service on this firewall and when I attemp=
t
>  access it from Internet doesn't work because it's on my ISP1.
>=20
> how I can do for all input traffic on wan1 come back on it and not on
> wan2 wich is the firewall gateway ??
>=20
> any tips are welcome

Here is a good start for a simple implementation:

http://lartc.org/howto/lartc.rpdb.multiple-links.html

If you need to be more selective, you can use iptables markings to get
finer control:

http://linux-ip.net/html/adv-multi-internet.html


