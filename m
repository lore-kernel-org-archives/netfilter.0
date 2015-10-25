From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Question: Why it is not possible to mark packet BEFORE first
 "route selection" in OUTPUT chain
Date: Sun, 25 Oct 2015 17:11:25 +0100
Message-ID: <562CFF2D.9030201@plouf.fr.eu.org>
References: <562CBFAD.40405@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <562CBFAD.40405@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: macach <macachuto@gmail.com>
Cc: netfilter@vger.kernel.org

macach a =E9crit :
>=20
> Why it is not possible to mark packet BEFORE "route selection" in OUT=
PUT chain.

Because when the initial route selection happens, the packet does not
exist yet. It is in the process of being created. The reason why route
selection takes place during the packet creation is that its result
influences packet features such as the source address, TOS...
