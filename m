From: Fabien LE BLEVEC <fleblevec@nerim.net>
Subject: Re: How to restrict uploading by using iptables?
Date: Sat, 03 Jan 2004 17:18:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FF6EB60.8090904@nerim.net>
References: <20040103160545.47544.qmail@web60407.mail.yahoo.com>
Reply-To: fleblevec@nerim.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040103160545.47544.qmail@web60407.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org


It is better to use "tc" and "wondershapper" for sharing bandwidth.
See http://www.lartc.org/

Or you can use quota limit with iptables :
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-3=
.html#ss3.13


Fabien

ads nat a =E9crit :

>I have setup LAN with Linix 8.0 server and
>distributing Internet bandwidth to LAN users.
>There is lot of uploading by LAN users. I want
>restrict it with IPTABLES.
>Please guide me how achiev it.
>Thanks for support.
>
>__________________________________
>Do you Yahoo!?
>Protect your identity with Yahoo! Mail AddressGuard
>http://antispam.yahoo.com/whatsnewfree
>
>
> =20
>



