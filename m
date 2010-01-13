From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_conntrack_sip and nf_nat_sip can do this??
Date: Wed, 13 Jan 2010 09:22:58 +0100
Message-ID: <4B4D82E2.6090405@trash.net>
References: <20091214104526.93556bb1q7xj41s0@ek2pim.upc.edu> <20100111132614.14651hiwfxvj3h8k@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100111132614.14651hiwfxvj3h8k@ek2pim.upc.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rebeca.martinez-garcia@estudiant.upc.edu
Cc: netfilter@vger.kernel.org, vhuertas@indra.es

rebeca.martinez-garcia@estudiant.upc.edu wrote:
> 
> Hi all,
> 
> I have been working with nf_conntrack_sip and nf_nat_sip for a while to
> permit SIP clients in a private LAN can connect to servers outside
> without problems.
> 
> However, in the case of an internal call, I was wondering if it is
> possible that these two modules detect that the incoming INVITE from the
> LAN is to another client of the same LAN and so not routing it outside.
> 
> Is it possible??

Yes, the module does exactly that when the NAT module is loaded.
