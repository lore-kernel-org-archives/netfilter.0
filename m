From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT issue on a machine with both routing and bridging.
Date: Tue, 24 Jun 2008 09:29:32 -0500
Message-ID: <486104CC.7090500@riverviewtech.net>
References: <485FB19D.9080908@satcom1.com> <485FBB02.9090901@riverviewtech.net> <485FC07D.6060306@satcom1.com> <485FC5B4.8060608@riverviewtech.net> <485FC8B9.1010804@satcom1.com> <485FD267.2070604@riverviewtech.net> <4860B329.7070000@satcom1.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4860B329.7070000@satcom1.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/24/08 03:41, Francois Goudal wrote:
> Ok, I checked this, and it appears that in the standard Debian kernel I 
> use, this is enabled. But still, my iptables are almost empty, there's 
> just one single rule, for the masqueading, and I don't think this can 
> have an impact on bridged packets, can it ?

This option allows IPTables to be able to intercept packets but your 
IPTables configuration is not doing so, thus I don't think this is 
having any impact for you.

> Okay, I did a quick test, by just removing eth1 from br0 and putting it 
> in br1, but keeping the DomU, still.
> So now, it looks like this :

<snip>

> The VM is still here, but all the traffic from/to eth1 is not going 
> through it, but reaches directly br1.

*nod*

> And actually, in this configuration, the packets from Host A to Host D 
> are correctly masqueraded by Host C. Packets from Host B to Host D are 
> still correctly masqueraded as well.

Ok...

> If I remove the VM completely, it works, also, but the previous test 
> shows that the problem does not come from the presence of the VM, but 
> the way all this is "connected".

So, just to make sure we are on the same page, your belief is that by 
bypassing Host B things are indeed working, and as such the problem has 
something (as of yet unknown) to do with Host B.  Correct?

If so, I agree.  However, based on the fact that Host A could get to 
Host C with out a problem while Host B was in the mix, I don't see any 
thing obvious about Host B that would be interfering.

> I'm doing my tests with ICMP Echo messages, for the moment, this is not 
> something that has connection states, it must work, the tests with TCP 
> traffic comes later, once this basic stuff will work.

For what you are testing at the moment, I'd say it's "ok" to be using 
ICMP rather than TCP.  Just be aware that some tests do behave 
differently depending on what protocol you are testing.  Load balancing 
is notorious that you need to test the protocol you are going to use. 
Just keep that in mind.  It may be worth a simple ""telnet to a clear 
text port (25, 80, 110, ...).



Grant. . . .
