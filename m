From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Ports
Date: Thu, 20 Nov 2008 20:49:30 +0100
Message-ID: <4925BF4A.3090104@plouf.fr.eu.org>
References: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>	 <20081120122753.606233a2@nacelle.mxtelecom.com>	 <d006ee070811201000k7684ffaah4851e687dc3942d4@mail.gmail.com>	 <20081120180728.23e681bf@nacelle.mxtelecom.com> <d006ee070811201024x23f6fa88l20edfab22ef20e2f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d006ee070811201024x23f6fa88l20edfab22ef20e2f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Mike a =E9crit :
>=20
> I rechecked my ports, tried again, tcpdump'd X and Y,  ssh'd from
> another box and it WORKED!

As I said in my previous message, NAT in the PREROUTING chain works onl=
y=20
for connections from another host, not from the same host.

BTW, REDIRECT may change the destination address too. "DNAT --to :port"=
=20
just changes the destination port.

> Thats good and all,  but when I iptables -F , shouldn't I stop seeing
> traffic on my redirect port?  Am I missing something else?

"iptables -F" flushes only the default table, which is 'filter'. Your=20
rule is in the 'nat' table. To flush it, run "iptables -t nat -F".
