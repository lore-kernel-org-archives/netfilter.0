From: Robert White <rwhite@pobox.com>
Subject: Re: cgroup match failing for synack packets
Date: Tue, 11 Jul 2017 06:58:06 +0000
Message-ID: <d0319193-057d-b200-03ab-0228f780e5df@pobox.com>
References: <CAGFnk5Fm5+VZ5oVnzP6sQG1X6kH2JSM5GC=EXXXrr7LiRT7f+A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGFnk5Fm5+VZ5oVnzP6sQG1X6kH2JSM5GC=EXXXrr7LiRT7f+A@mail.gmail.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amit Limaye <amit.limaye@gmail.com>, netfilter@vger.kernel.org

On 07/10/2017 11:42 PM, Amit Limaye wrote:
> Hello,
>         i am trying to capture packets coming out a process by
> matching the cgroup the process is in.
> The match for cgroup works syn packets in the tcp handshake but fails
> for the syn ack packet.
> i can match SYN for cgroup 102 using
>   1    60 MARK       tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0            tcp flags:0x12/0x02 cgroup 102 MARK set 0x66
> 
> but it fails if i try SYNACK on the server end and not packets hit my rule.
> 
> My rule on the server side is
>  0     0 MARK       tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0            tcp flags:0x12/0x12 cgroup 101 MARK set 0x65
> 
> where the server is a part of cgroup 101
> 

I'm pretty sure that you've missed the fact that, largely, only the
first packet of a flow hits most rules when are using connection tracking.

You didn't say where these rules are in your whole ruleset.

If you want to mark a connection persistently for some reason then you
probably want to use CONNMARK.

At the top of your mangle:PREROUTING you want your first rule to be a
CONNMARK restore.

At the top of your mangle:POSTROUTING you want you first rule to be a
CONNMARK save.

The first packet, the outgoing SYN, is going to be marked. The reply
packet is going to go through the ESTABLISHED path and may not be
hitting your rules at all.

Now the first packet will first be "restored" wit no value for the mark,
then it will be marked, then the mark will be saved in the posrouting.
When the reply shows up the system will look up the connection tracking
entry and restore the mark that the outgoing packet had on it.

So, for example, if your INPUT table starts with

itables --insert INPUT --match conntrack --ctstate ESTABLISHED,RELATED
--jump ACCEPT

and then you try to match the reply mark, well the packet is already out
of reach.

So withtout the rest of your rules there's no way to really tell you
exactly whats happening.

But in practice the CONNMARK thing is what you want to use if you want
to mark packets in both directions of a flow.
