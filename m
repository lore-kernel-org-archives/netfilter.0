From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: conntrack performance test results in INVALID packets
Date: Fri, 18 Jul 2008 12:13:33 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr>
References: <488064DD.5080509@bock.nu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <488064DD.5080509@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernhard Bock <mailinglists@bock.nu>
Cc: netfilter@vger.kernel.org


On Friday 2008-07-18 11:39, Bernhard Bock wrote:
>
> With 100 parallel TCP connections, it works. With 1000 parallel TCP
> connections, I start seeing INVALID packets.
>
> Can somebody point me in a direction where to search for the root cause?

Vague guess..
You have too few memory and/or your connection table is full, hence
connections are dropped and future packets can't find their
original connection, resulting in INVALID. (Though I'd say they
should become NEW again)
