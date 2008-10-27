From: "Karel Rericha" <karel@maxtel.cz>
Subject: Re: block tcp packet.
Date: Mon, 27 Oct 2008 09:39:26 +0100
Message-ID: <5b19ed110810270139s7304f5c1k3af524afdf991378@mail.gmail.com>
References: <98f5d92c0810241600r7d44b366u8c0b84c917a4c8b9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <98f5d92c0810241600r7d44b366u8c0b84c917a4c8b9@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Servers 4you <servers4you@gmail.com>
Cc: netfilter@vger.kernel.org

2008/10/25 Servers 4you <servers4you@gmail.com>:
> Hello every one!
>
> how can i block a tcp packet, just knowing the 4th byte its "47" and
> the total length of DATA is 14bytes?
>
> this is my packet:
> aa883f 47 9434f54c9b03e8327940

Google U32 match, it is what you need.

Karel
