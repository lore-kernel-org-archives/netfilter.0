From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to log NAT translations
Date: Tue, 21 Sep 2010 11:26:41 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009211125320.30840@obet.zrqbmnf.qr>
References: <4C8FAFDF.9080201@dcc.ufba.br> <alpine.LNX.2.01.1009141953580.23103@obet.zrqbmnf.qr> <4C981789.3070004@dcc.ufba.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C981789.3070004@dcc.ufba.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Italo Valcy <italo@dcc.ufba.br>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-09-21 04:25, Italo Valcy wrote:

>Actually, I wanna something more simple and specific than the command
>above. Using 'conntrack -E', I still have to parse the package events
>NEW, UPDATE and DESTROY if I wanna know the  of a NAT

So use `conntrack -Ee NEW` to limit the output :)
If that is still too much overhead, I'm sure you can directly use
libnetfilter_conntrack's library interface to get at these events.
