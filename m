From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables u32 tests and user logging
Date: Mon, 21 Jul 2008 20:49:41 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807212046490.21244@fbirervta.pbzchgretzou.qr>
References: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com>  <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com>  <alpine.LNX.1.10.0807210942340.21244@fbirervta.pbzchgretzou.qr>  <4884ADDC.7000600@riverviewtech.net> 
 <76fdae320807210941p39dc17b6i1e4e3e75592c7b6b@mail.gmail.com>  <alpine.LNX.1.10.0807211848360.21244@fbirervta.pbzchgretzou.qr> <76fdae320807211106m4d0c6dd8qfae16a04a31577d8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <76fdae320807211106m4d0c6dd8qfae16a04a31577d8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Padmanabhan <rpdumps@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2008-07-21 20:06, Padmanabhan wrote:

>Hello,
>Is there way we can add code to u32 to do this function ,, after
>matching a criteria,  print/ log interested bytes  ?

u32 is a match. It is supposed to be dumb.
But one could introduce (probably to the dismay of Patrick)
something like a LOGU32 target to be used in a fashion like
--u32.
