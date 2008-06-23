From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT issue on a machine with both routing and bridging.
Date: Mon, 23 Jun 2008 10:02:26 -0500
Message-ID: <485FBB02.9090901@riverviewtech.net>
References: <485FB19D.9080908@satcom1.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <485FB19D.9080908@satcom1.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/23/08 09:22, Francois Goudal wrote:
> So I decided to use virtual machines, like Xen (I tried UML as well, so 
> my problem is not related to Xen specifically).

This is starting to sound like a project that I would work on.

> ................                                     ................
> .    HOST A    .                                     .    HOST D    .
> . 10.168.254.1 .                                     . 172.16.33.10 .
> ................                                     ................
>   |                                                               |
>   |                                                               |
>   |                                                               |
>   | eth1                                                     eth0 |
> .....................................................................
> . |0.0.0.0                                                0.0.0.0 | .
> . |__________________________________             ________________| .
> .                                    |           |                  .
> ............................         |_ br0      |                  .
> .                     eth0 . vif1.0  |  0.0.0.0  |                  .
> . XEN VM          _________._________|           |                  .
> . HOST B         | 0.0.0.0 . 0.0.0.0             |                  .
> .                |         .                     |_ br2             .
> .           br0 _|         .                     |  172.16.33.200   .
> . 10.168.254.51  |    eth1 . vif1.1              |        ^         .
> .                |_________._________                     |         .
> .                  0.0.0.0 . 0.0.0.0 |                    | Routing .
> ............................         |_ br1               | + DNAT  .
> .                                    |  10.168.254.250 <--'         .
> .                                    |                              .
> .        HOST C                                                     .
> .....................................................................

(Nice ASCII art)

> Host C is a Xen Host machine that contains one Xen VM for the PEP stuff 
> and which is responsible for the masquerading of packets.

So Host C is Dom 0 and Host B is a Dom U, correct.

<snip>

> But now, I want to get rid of the need of a special route on host D, so 
> I want to setup DNAT/Masquerade on the Host C.

*nod*

<snip>

> So I suspect that on Host C, the packets that comes in the eth1 NIC are 
> not just forwarded to the VM by the bridge, but detected somehow by the 
> network stack and forwarded to eth0 (by some layer2 code ?) without 
> being masqueraded, then.

Can we see the output of brctl on Host C (domain 0)?

> I have been working on trying to solve this during 2 days now but still 
> I can't find a solution.

Is there a reason that you are not masquerading packets that leave br2 
in Host C?

> Can anyone have a quick look and hopefully provide me an explaination 
> and maybe some help to find a solution ?

I need to see how things are bridged in Host C to be sure.  I suspect 
that either something is amiss in your bridging or where / how you were 
doing your masquerading.

I will say that what you are wanting to do is sound and does work.  I 
have deployed multiple systems running complex networks in vms, be it 
UML (multiple incarnations) and VMWare (any incarnation needing a 
Windows vm).  Presently I have multiple systems deployed that have one 
host with up to 8 guest vms.  These types of systems sound overly 
complex. but the networking is usually the least complex part of them.

Don't give up.



Grant. . . .



Grant. . . .
