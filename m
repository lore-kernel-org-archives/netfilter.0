From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to use DNAT
Date: Thu, 17 Feb 2011 20:03:27 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102172000340.30243@obet.zrqbmnf.qr>
References: <4D5D6D2C.7010109@dcc.ufba.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D5D6D2C.7010109@dcc.ufba.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Italo Valcy <italo@dcc.ufba.br>
Cc: netfilter@vger.kernel.org

On Thursday 2011-02-17 19:47, Italo Valcy wrote:

>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Hello Guys!
>
>I'm in doubt about the correct use of DNAT, if I should use an alias
>interface (like eth0:0)

eth0:0 is not an interface. That is ifconfig misleading you. Avoid this 
old and unmaintained tool.
