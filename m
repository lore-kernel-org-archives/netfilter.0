From: Davide Brini <dave_br@gmx.com>
Subject: Re: natting an ipv6 address into an ipv4 one?
Date: Tue, 8 Feb 2011 09:35:19 +0000
Message-ID: <201102080935.19283.dave_br@gmx.com>
References: <4D510B89.5050706@campana.vi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D510B89.5050706@campana.vi.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tuesday 08 Feb 2011 09:23:21 Ottavio Campana wrote:

> I have a question about ipv6 and nat.
> 
> Suppose you have a box with 2 NICs, one running ipv6 attached to the
> main network and one running ipv4 directly attached to an old device
> that does not support ipv6. Thus, the box with two NICs has to play the
> role of protocol translation, by taking IPV6 packets and send them with
> IPV4 to the old device
> 
> Is it possible to directly DNAT packets or do I have to do something
> different?

It sounds like you want NAT64, eg see

http://ecdysis.viagenie.ca/

-- 
D.
