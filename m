From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: iptables equivalent of ssh local port forward.
Date: Sat, 5 Apr 2008 03:08:21 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804050305370.9479@fbirervta.pbzchgretzou.qr>
References: <bac5fd1b0804041635g768b214bq38535a328d81bf7e@mail.gmail.com> <alpine.LNX.1.10.0804050205390.26881@fbirervta.pbzchgretzou.qr> <47F6C3DF.2040805@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47F6C3DF.2040805@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>


On Saturday 2008-04-05 02:12, Leonardo Rodrigues Magalh=C3=A3es wrote:
>
>   graph shows clearly the problem, but doesnt gives the solution.

Well, UNIX philosophy - one thing should do one thing :)

Solutions are either

- SNAT, in which case you won't have the original address, or

- making sure 1.3.3.9 sends the packets back to 1.3.3.8 first
   before they get back to 1.3.3.7, either by

   - adding explicit routing entries or

   - modifying the network/subnet layout in a fitting way

- directly connecting to 1.3.3.9 in the first place
