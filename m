From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to log NAT translations
Date: Tue, 14 Sep 2010 19:54:32 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009141953580.23103@obet.zrqbmnf.qr>
References: <4C8FAFDF.9080201@dcc.ufba.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C8FAFDF.9080201@dcc.ufba.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Italo Valcy <italo@dcc.ufba.br>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-09-14 19:24, Italo Valcy wrote:

>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Hi guys!
>
>I'm a newbie in this mainling list, so I'm sorry if this question was
>already asked.
>
>I'd like to have more specific logging output of NAT translation in
>iptables. Is there an way to logging of ORIGINAL_IP/ORIGINAL_PORT +
>TRANSLATED_IP/TRANSLATED_PORT?

conntrack -E
