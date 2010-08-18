From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 01:21:17 +0200
Message-ID: <4C6C6AED.3090008@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C67A6.9010405@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
>=20
> What is the best way to stop a linux host from becoming a router?

Disable global IP forwarding. If not possible because you need to enabl=
e
forwarding on some interfaces, disable interface-specific forwarding.
Otherwise, use iptables rules in the FORWARD chain (beware undesirable
interactions with bridged IP traffic through bridge-nf if enabled vith
sysctl net.bridge.bridge-nf-call-iptables=3D1).

> I don't think disabling ip forwarding is possible in my case (As I'm=20
> doing a lot of forwarding in my bridges)

=46orwarding of ethernet frames within a bridge is completely independe=
nt
of IP forwarding.
