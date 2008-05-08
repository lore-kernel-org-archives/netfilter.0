From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: DNAT routing problem
Date: Thu, 08 May 2008 14:37:40 -0500
Message-ID: <48235684.6060306@riverviewtech.net>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/08/08 13:17, Andrea Ranieri wrote:
> Playing a bit with iptables, I observed a strange behavior. For 
> example, if my router is forwarding even a few packets per second 
> (ipv4 only payload), the rule is accepted, but not applied.

<snip>

> Conversely, if no traffic is being forwarded, the rule is accepted 
> and correctly applied.

<snip>

> I really don't understand this behavior, I hope I'm missing something 
> obivious. I'd like to point out that I'm running a standard (debian 
> 2.6.22-14-server) kernel, and each of this two tests, comes from a 
> fresh boot.

(Time to open my mouth and insert my foot.)

NAT rules are applied to the first packet in a connection and then the 
same action is auto-magically applied to all other packets in the 
connection with out passing them through the NAT table.

So what you are seeing is probably very likely based on existing verses 
new connections.

> Thanks in advance, and sorry for the jumbo mail :) Andrea

*nod*



Grant. . . .
