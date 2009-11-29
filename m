From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPTABLES do not work without ROUTE exist ?!
Date: Sun, 29 Nov 2009 12:56:59 +0100
Message-ID: <4B12618B.3090208@plouf.fr.eu.org>
References: <c3ddfa98eae2ceba17bff282ed0b5f1a@www2-mail.volny.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c3ddfa98eae2ceba17bff282ed0b5f1a@www2-mail.volny.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

kapetr a =E9crit :
>=20
> http://ubuntuforums.org/showthread.php?t=3D1339951
>=20
> What do You thing ?

I think that your box has sysctls net.ipv4.conf.*.rp_filter=3D1.
These settings enable reverse path filtering for source validation. If
rp_filter is enabled for an interface and the source address of an
incoming packet is not routed via the same interface (either via anothe=
r
interface or no route), then the packet is dropped. This happens after
the PREROUTING chains and before the INPUT or FORWARD chains.
