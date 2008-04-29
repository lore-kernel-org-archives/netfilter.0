From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: udp connection moved from ASSURED to UNREPLIED
Date: Wed, 30 Apr 2008 01:45:03 +0200
Message-ID: <4817B2FF.3090504@plouf.fr.eu.org>
References: <Pine.LNX.4.63.0804261543110.6453@sip2> <alpine.LNX.1.10.0804262013110.20150@fbirervta.pbzchgretzou.qr> <Pine.LNX.4.63.0804270047390.6453@sip2> <Pine.LNX.4.63.0804271939550.6453@sip2>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0804271939550.6453@sip2>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Aymeric Moizard <jack@atosc.org>
Cc: netfilter@vger.kernel.org

Hello,

Aymeric Moizard a =E9crit :
>=20
> Problem solved: I swithed from MASQUERADE to SNAT and the issue
> was solved. I don't know yet the difference between them but I'll
> look in the documentation.

Connections which were modified by MASQUERADE are flushed from the=20
conntrack table when the related interface goes down or its IP address=20
changes. Connections which were modified by SNAT are not affected by=20
these events.
