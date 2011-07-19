From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Behaviour of "-j SNAT --persistent"
Date: Tue, 19 Jul 2011 22:55:19 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107192255110.21154@frira.zrqbmnf.qr>
References: <4E25C077.10208@net.ipl.pt> <20110719223441.07eab5f0@catus>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110719223441.07eab5f0@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: pribeiro@net.ipl.pt, netfilter@vger.kernel.org

On Tuesday 2011-07-19 22:34, Marek Kierdelewicz wrote:

>Hi,
>
>>I'm trying to implement a near dynamic NAT IP assignment where a pool
>>of public addresses are used to map a bigger range of private
>>addresses (NETMAP target can't be used as it need both pre and post
>>NAT blocks to have the same size).
>
>Give DNETMAP a try:
>http://cat.piasta.pl/dnetmap/

Wasn't xt_DNETMAP in xtables-addons anyway? :)
