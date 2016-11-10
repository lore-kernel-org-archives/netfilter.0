From: Juergen Schmidt <abcdmail@freenet.de>
Subject: Re: sip helper doesn't match on calls to myself
Date: Thu, 10 Nov 2016 19:27:59 +0100
Message-ID: <a2fd4690-63c9-36a9-d5eb-8d00ae79b149@freenet.de>
References: <a3cf2e4b-1345-1efc-b211-5fea64438baf@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a3cf2e4b-1345-1efc-b211-5fea64438baf@freenet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 11/09/2016 at 05:01 PM, Juergen Schmidt wrote:
> Hello!
> 
> I've got the following problem: If I'm calling myself, the incoming call
> isn't matched by the sip helper rules, but the rules w/o sip helper. I
> would have expected, that both calls are matched by the sip helper rules.
> 
> 
> In detail:
> 
> Given is an asterisk server, one extension (C610 IP with 3 phones, which
> can handle 2 lines at the same time) and a trunk to the provider.
> 
> The extension calls the own number, which provides the following scenario:
> 
> outgoing call: extension -> asterisk -> provider
> 
>    and
> 
> incoming call: provider -> asterisk -> extension
> 
> 
> *Important*: the provider uses independent media servers. This means:
> the signaling server and the media servers have different IP addresses.
> 

Addition:

The problem *only* happens if at the same time a third (outgoing) call
is initiated (via ring group) - which is *not answered* but closed at
the moment the call is accepted internally.

If the third (-> outgoing) call via ring group is omitted, things work
as expected.

Calls in detail:

outgoing call:    extension -> asterisk -> provider
incoming call:     provider -> asterisk -> extension
outgoing call* via ring group: asterisk -> provider -> ext. destination

answer the incoming call
outgoing call* is exited.


* triggered by incoming call



Thanks,
Juergen
