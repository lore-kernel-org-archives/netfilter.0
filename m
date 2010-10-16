From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port forwarding problem
Date: Sat, 16 Oct 2010 20:19:26 +0200
Message-ID: <4CB9ECAE.8000605@plouf.fr.eu.org>
References: <4CB9A03C.7020700@uninorte.edu.co> <4CB9A4FE.1050905@plouf.fr.eu.org> <4CB9A669.7020008@uninorte.edu.co> <4CB9AAB2.8070803@plouf.fr.eu.org> <4CB9B03C.2090107@uninorte.edu.co>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB9B03C.2090107@uninorte.edu.co>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Carlos Mtz-Troncoso <cmartinez@uninorte.edu.co>
Cc: netfilter@vger.kernel.org

Carlos Mtz-Troncoso a =E9crit :
>=20
> I just changed some -I for -A and moved
> iptables -A FORWARD -j DROP
> to the end and it works!

Why not set the default policy to DROP instead of that terminal rule ?
This way you could append new rules more easily.
