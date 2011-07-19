From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Behaviour of "-j SNAT --persistent"
Date: Tue, 19 Jul 2011 22:34:41 +0200
Message-ID: <20110719223441.07eab5f0@catus>
References: <4E25C077.10208@net.ipl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E25C077.10208@net.ipl.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pribeiro@net.ipl.pt
Cc: netfilter@vger.kernel.org

Hi,

>I'm trying to implement a near dynamic NAT IP assignment where a pool
>of public addresses are used to map a bigger range of private
>addresses (NETMAP target can't be used as it need both pre and post
>NAT blocks to have the same size).

Give DNETMAP a try:
http://cat.piasta.pl/dnetmap/

Best regards,
Marek Kierdelewicz
