From: Karel Rericha <karel@maxtel.cz>
Subject: Re: force a MAC to have one IP
Date: Thu, 5 Nov 2009 09:27:12 +0100
Message-ID: <5b19ed110911050027j18f5232w9f80447022ca1ab0@mail.gmail.com>
References: <4AF24F56.6010308@gulfsat.mg>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF24F56.6010308@gulfsat.mg>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rakotomandimby Mihamina <mihamina@gulfsat.mg>, netfilter@vger.kernel.org

2009/11/5 Rakotomandimby Mihamina <mihamina@gulfsat.mg>:
> We would like to ensure one IP adress is used by the assigned MAC.
> (QoS matter)
>
> Is this a good enough solution:
> -A INPUT =A0 -m mac --mac-source 00:15:C5:F4:29:7C -s ! 192.168.1.13 =
-j REJECT
> -A FORWARD -m mac --mac-source 00:15:C5:F4:29:7C -s ! 192.168.1.13 -j=
 REJECT
>
> Is there any better one?

Use ipsets, probably macipmap.

Karel
