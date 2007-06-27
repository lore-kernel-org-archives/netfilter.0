From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: Re: icmp-type question
Date: Wed, 27 Jun 2007 10:09:56 -0700
Message-ID: <468299E4.3020906@mailinator.com>
References: <35f70db10706270926u708cc4f4ta0a962ca219ce91e@mail.gmail.com>
	<35f70db10706270927j3e15b87anc134c458a621b146@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <35f70db10706270927j3e15b87anc134c458a621b146@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Ross Cameron wrote:
> Hi there list,...
> 
> I need to block all
>     timestamp-request      and
>     timestamp-reply
> 
> On eth0 (Inet facing fast ethernet segment on a multi homed Linux
> router) but not on eth1 (LAN facing range).
>

I don't know how to test this so here's a guess.  Hope it works.

Drop requests from the internet:
iptables -A input -p icmp --icmp-type timestamp-request -i eth0 -j DROP

My thought is that if no timestamp requests are accepted no timestamp 
replies would be generated.  In case that's an invalid assumption you 
could also filter the output chain.

...and drop answers to the internet:
iptables -A output -p icmp --icmp-type timestamp-reply -o eth0 -j DROP

Depending on what else you are doing you may need matching rules in your 
forward chains, too.

:m)

