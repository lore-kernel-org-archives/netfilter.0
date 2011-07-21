From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridging netfilter and forwarding
Date: Thu, 21 Jul 2011 13:15:16 -0500
Message-ID: <4E286CB4.9060202@riverviewtech.net>
References: <20110721090525.09d8e10d@s6510.ftrdhcpuser.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110721090525.09d8e10d@s6510.ftrdhcpuser.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/21/11 11:05, Stephen Hemminger wrote:
> There is a recurring theme of people that want to forward link
> local multicast and other packets. There is a patch that adds a mask
> value, but I would prefer a more general solution using netfilter/ebtables.
>
> Is there some way to use actions to do this better?
> Or change the existing NF_HOOK somehow do this.

Can you not do this with a bridging router (a.k.a. brouter)?



Grant. . . .
