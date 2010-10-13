From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: D-NAT and S-NAT in IPv6
Date: Wed, 13 Oct 2010 12:01:54 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010131201380.31123@obet.zrqbmnf.qr>
References: <20101013111252.603920lk59ex94ic@webmail.uni-bremen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20101013111252.603920lk59ex94ic@webmail.uni-bremen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Trenkamp <s_6cg5kj@uni-bremen.de>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-10-13 11:12, Peter Trenkamp wrote:

> Hello everybody,
>
> I was searching in the Internet about how to change the destination
> IPv6 address into another IPv6 address. Unfortunately I did not find
> anything about this, except the information that ip6tables does not
> support this kind of NAT.
> So my question is: Is there a workaround for selecting a packet by
> Source and/or Destination address and then change the IPv6
> destination address into a new one?

IPv6 was designed to do without NAT.
