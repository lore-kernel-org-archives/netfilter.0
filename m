From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Problems with trying to use the TEE target
Date: Thu, 7 Apr 2011 22:03:44 +0200
Message-ID: <20110407220344.4e6b7be2@catus>
References: <1302199190.16650.23.camel@sjohnson.state.ar.us>
	<20110407205721.39e28be8@catus>
	<1302205269.16650.27.camel@sjohnson.state.ar.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1302205269.16650.27.camel@sjohnson.state.ar.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Johnson <stephen.johnson@arkansas.gov>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

>What does the xtables-addons have to do with it? Iptables 1.4.10 has
>the TEE target already.

It has userland iptables plugin. You're still missing kernel
module. Try doing:

modprobe xt_DNETMAP
and
lsmod|grep _TEE

Best regards,
Marek Kierdelewicz
