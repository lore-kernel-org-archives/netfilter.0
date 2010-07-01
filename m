From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [conntrackd] Question about expect table sync
Date: Thu, 01 Jul 2010 17:52:15 +0200
Message-ID: <4C2CB9AF.2000906@netfilter.org>
References: <4C2C9E4C.40901@orange-ftgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2C9E4C.40901@orange-ftgroup.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: todor.gamishev@orange-ftgroup.com
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi Todor,

I'm cc'ing netfilter users to keep this in the record.

todor.gamishev@orange-ftgroup.com wrote:
> Hello Pablo,
> 
> I'm actually working on High Availability of stateful firewalls and I'm
> testing the conntrackd tool coupled with keepalived. I was wondering if
> conntrackd could synchronize the conntrack EXPECT table too. I've played
> with it all the day but I cannot get my EXPECT table synchronized. So,
> could you please tell me if it's possible at all with conntrackd v0.9.14?

We are not synchronizing the expectation table but we do synchronize
confirmed expectations that are attached to their master conntrack (I'm
refering to the RELATED state in iptables).

Expectations usually have a short lifetime and they occur in early
stages of the flow establishment. I consider that synchronizing
expectations do not help too much to improve availability under recovery
situations but it requires extra computational resources for this.
