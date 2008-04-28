From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Question
Date: Mon, 28 Apr 2008 12:11:28 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804281211150.20150@fbirervta.pbzchgretzou.qr>
References: <818933700804280201h63ccf323gba1e889c87cc39b4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <818933700804280201h63ccf323gba1e889c87cc39b4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karim Reda Fakhir <karimreda.fakhir@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2008-04-28 11:01, Karim Reda Fakhir wrote:

>How can i do SNAT and DNAT in same time with iptables , i try to
>change Ip src and Ip dest .

-t nat -A PREROUTING -j DNAT ...
-t nat -A POSTROUTING -j SNAT ...
no?
