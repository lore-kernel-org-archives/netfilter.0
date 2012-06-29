From: Steven Kath <steven.kath@vyatta.com>
Subject: Re: dropping fragmented packetsusing iptables -f option
Date: Fri, 29 Jun 2012 13:35:29 -0700
Message-ID: <CAKgro6D_ZkHWo8zhZ9nRRMa1Ov+g0jVa8KH3-ydG_i+5ZfT+iw@mail.gmail.com>
References: <CAE1WnGfxNuu1yhySKaMF7LOVubHcyJg_o+n8N9Vt69A=z+BQFw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGfxNuu1yhySKaMF7LOVubHcyJg_o+n8N9Vt69A=z+BQFw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, Jun 29, 2012 at 12:13 AM, rahul shrivastava
<shrivastavaone@gmail.com> wrote:
> my objective is to drop all fragmented packets on my system
> following rules are used
>
> iptables -A INPUT -f -j DROP
> iptables -A OUTPUT -f -j DROP
> iptables -A FORWARD -f -j DROP
>
> above rules are not making any effect

I would check whether your interface has offloading parameters
enabled.  I think it's possible for the NIC or driver to reassemble
fragments before passing them up the stack to netfilter.

$ sudo ethtool -k eth0
Offload parameters for eth0:
rx-checksumming: on
tx-checksumming: on
scatter-gather: on
tcp-segmentation-offload: off
udp-fragmentation-offload: off
generic-segmentation-offload: on
generic-receive-offload: on
large-receive-offload: off
ntuple-filters: off
receive-hashing: off

GRO, LRO and possibly GSO could impact the case of detecting ICMP
fragments.  TSO and UFO might impact the detection of TCP and UDP
fragments.
