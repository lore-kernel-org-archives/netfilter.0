From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: What's required for a stateful firewall + ipvs in 2.6 kernel?
Date: Tue, 23 Sep 2008 15:31:37 -0500
Message-ID: <48D95229.8040705@riverviewtech.net>
References: <48C70B10.3040405@vfive.com> <48D8C06F.6030101@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48D8C06F.6030101@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/23/08 05:09, Pablo Neira Ayuso wrote:
> The last time that I had a look at the antefacto patch it look to me 
> like a hack. IIRC, the problem is the LVS design (at least time ago 
> when I had a look at it) as it bypasses the network stack. This 
> screws up the possibility of having stateful firewalling and LVS.

I can offer a recent confirmation (with in the last three months) that 
LVS does indeed still interfere with firewalling.



Grant. . . .
