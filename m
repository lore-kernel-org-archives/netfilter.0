From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: block ip fragmented packet
Date: Fri, 11 Dec 2015 09:14:38 +0100
Message-ID: <566A85EE.4030502@plouf.fr.eu.org>
References: <CAPgF-frhssFMAxB0M=qA1Y1jCxjScO7+3JE7=i9FaXu37HCLOw@mail.gmail.com> <CAEzD07+oCs_W6P760okms=g38HEM_YuGNFx_-YodYDX328D6qA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEzD07+oCs_W6P760okms=g38HEM_YuGNFx_-YodYDX328D6qA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: Satish Patel <satish.txt@gmail.com>, netfilter@vger.kernel.org

Anton Danilov a =E9crit :
> Hello.
> Local originated packets aren't passed through raw/PREROUTING chain
> To test your rule you should use raw/OUTPUT chain.

It may not work either, because packets are not fragmented yet in the
OUTPUT chain at least when conntrack is active (not sure when it isn't)=
=2E
