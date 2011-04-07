From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Problems with trying to use the TEE target
Date: Thu, 7 Apr 2011 20:57:21 +0200
Message-ID: <20110407205721.39e28be8@catus>
References: <1302199190.16650.23.camel@sjohnson.state.ar.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1302199190.16650.23.camel@sjohnson.state.ar.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Johnson <stephen.johnson@arkansas.gov>
Cc: netfilter@vger.kernel.org

>Greeting,

Hi,

>I trying to use the TEE target but I keep getting the errors even using
>the example commandi on the ipxt_TEE man page.
>I'm current using iptables-1.4.10 that I've compiled and installed on
>the server. The linux kernel is 2.6.32.

Try installing xtables-addons:
http://xtables-addons.sourceforge.net/

It contains TEE module.

best regards,
Marek Kierdelewicz
