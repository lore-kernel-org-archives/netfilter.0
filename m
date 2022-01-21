From: Florian Westphal <fw@strlen.de>
Subject: Re: How to understand causes of invalid state for an OUPUT SYNACK
 packet
Date: Fri, 21 Jan 2022 13:40:59 +0100
Message-ID: <20220121124059.GA14018@breakpoint.cc>
References: <20220121122332.1501d9ba@glazard>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220121122332.1501d9ba@glazard>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jerome Barotin <jbn@s4e.fr>
Cc: netfilter@vger.kernel.org

Jerome Barotin <jbn@s4e.fr> wrote:
> I've got a specific device (industrial computer) where its
> TCP connection are always blocked by netfilter when it tries to
> connect to my server. 
> 
> Exactly the SYN packet is forwarded to my local process, but, the
> SYN-ACK answer is always tagged as invalid by the conntrack
> module, 

Its not, the message is misleading.

> I noticed this behaviour in the following line in kern.log :
> 
> Jan 14 11:26:15 myhostname kernel: [260283.271861] nf_ct_proto_6:
> invalid packet ignored in state SYN_RECV  IN= OUT= SRC=10.1.1.4
> DST=10.1.1.3 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=21
> DPT=64004 SEQ=1624381780 ACK=2190670817 WINDOW=64240 RES=0x00 ACK SYN
> URGP=0 OPT (020405B40101040201030307) 

Maybe we should just axe this message.  The packet is *ignored*, not
marked as invalid.  Such packet will NOT trigger -m conntrack --ctstate
INVALID.  The wording was slightly changed in 5.12 kernel, where this is
now:

nf_ct_proto_6: packet (index 1) in dir 1 ignored, state SYN_RECV IN=...

> The corresponding pcap file can be found here :
> https://filebin.net/yazmmekhrdiu4dh8/capture_not_work_ano.pcap

Thanks, lets see (trimmed line length):
.3.64004 > 10.1.1.4.21: Flags [S], seq 2190670816, win 8192, options [mss 1330,nop,wscale 8,nop,nop,sackOK], length 0

This packets gets us to SYN_SENT state:
tcp      6 116 SYN_SENT src=10.1.1.3 dst=10.1.1.4 sport=64004 dport=21 [UNREPLIED] src=10.1.1.4 dst=10.1.1.3 sport=21 dport=64004 mark=0 use=1

... packet would match --ctstate NEW.

.4.21 > 10.1.1.3.64004: Flags [S.], seq 1624381780, ack 2190670817, win 64240, options [mss 1460,nop,nop,sackOK,nop,wscale 7], length 0

This packet gets us to SYN_RECV state.
... packet would match --ctstate ESTABLISHED.

.4.21 > 10.1.1.3.64004: Flags [S.], seq 1624381780, ack 2190670817, win 64240, options [mss 1460,nop,nop,sackOK,nop,wscale 7], length 0

This packet produces the 'ignored' message quoted above, its ignored
because we already saw such packet before, so packet matches ESTABLISHED
state.

.4.21 > 10.1.1.3.64004: Flags [S.], seq 1624381780, ack 2190670817, win 64240, options [mss 1460,nop,nop,sackOK,nop,wscale 7], length 0

This repeats the message, no other side effects.

.3.64004 > 10.1.1.4.21: Flags [S], seq 2190670816, win 65535, options [mss 1330,nop,nop,sackOK], length 0

Similar message, this is for 'index 0'

4.21 > 10.1.1.3.64004: Flags [S.], seq 1624381780, ack 2190670817, win 64240, options [mss 1460,nop,nop,sackOK,nop,wscale 7], length 0

> Also, I do not understand how this connection could be in SYN_RECV
> conntrack state. This state means that SYN-ACK packet has already been
> received and I'm sure that no such packet has already been submitted.

Where was that dump taken?  Its what I used to tcpreplay into a vm.

> Do I miss something ? Anybody has got idea to help me understand (and
> fix) this case ?

Is the conntrack machine forwarding or an endpoint?

If forwarding, can you provide pcaps from the inbound
and outbound interfaces?

You could also -j LOG packets in state INVALID to pinpoint which
packet really does get marked as INVALID, but afaict its not a
packet contained in the provided pcap.
