From: Patrick McHardy <kaber@trash.net>
Subject: Re: conntrack_sip messages showing up in 2.6.32
Date: Mon, 14 Dec 2009 12:20:47 +0100
Message-ID: <4B261F8F.9090806@trash.net>
References: <20091210151923.GT5634@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091210151923.GT5634@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joerg Dorchain <joerg@dorchain.net>
Cc: netfilter@vger.kernel.org

Joerg Dorchain wrote:
> Hello all,
> 
> after upgrading to kernel 2.6.32 I see some new message I did not
> see before (i.e. 2.6.31).
> 
> I am using just nf_conntrack_sip (options sip_direct_media=0)
> in order to have sip and related
> rtp connection accepted as related connections, no nat
> involved. On a different machine I am running twinkle as a sip
> client, registering to an asterisk running on the machine in
> question[1].
> 
> When twinkle is just idling and renewing its registration once in
> a while, I get kernel: nf_ct_sip: dropping packet.. messsages
> several times a day.
> 
> Do anyone have an idea where this comes from and what can be done
> about it?

Conntrack logs packets dropped by helpers automatically starting in
2.6.32. If you can capture those packets (either using tcpdump or
the ULOG pcap output plugin) I can have a look at why they are dropped.
