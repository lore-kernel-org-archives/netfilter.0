From: Chris Hills <chaz@chaz6.com>
Subject: Re: Problem with IPv6 tunnel
Date: Sun, 21 Jun 2009 15:44:37 +0200
Message-ID: <h1ldg5$o38$1@ger.gmane.org>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com> <200906191218.03217.ben@differentialschokolade.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200906191218.03217.ben@differentialschokolade.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 19/06/09 12:18, Benedikt Gollatz wrote:
>> I am not an iptables expert, but to me it seems the first MASQUERADE
>> rule matches all packets and the new one does not make any difference.
>> Can someone confirm that ?
>
> That's absolutely true. The rule from the FAQ is meant to replace your
> original rule, exempting proto-41 traffic from masquerading and thus
> connection tracking.

I believe the idea is that if you are terminating the tunnel on your 
router, then this rule should replace your default MASQUERADE rule so 
instead of

MASQUERADE  all  --  anywhere             anywhere
MASQUERADE !ipv6 --  anywhere             anywhere

you should have just:-

MASQUERADE !ipv6 --  anywhere             anywhere

This way the connection is not tracked unnecessarily.

Regards,

Chris Hills

