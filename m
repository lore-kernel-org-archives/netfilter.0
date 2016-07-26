From: =?UTF-8?Q?Thomas_B=c3=a4tzler?= <thomas@baetzler.de>
Subject: Re: UNREPLIED conntrack entries won't be discarded
Date: Tue, 26 Jul 2016 14:29:25 +0200
Message-ID: <7f7312d4-bb78-17d9-3e10-5b7fbb603f23@baetzler.de>
References: <20160726114248.GR23593@ks3360651.kimsufi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160726114248.GR23593@ks3360651.kimsufi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Herz <andi@geekosphere.org>, netfilter@vger.kernel.org

Hello Andreas,

Am 26.07.2016 um 13:42 schrieb Andreas Herz:
> we have a system with a huge amount of TCP ESTABLISHED connections but
> all [UNREPLIED] that have the 5 days timeout from
> nf_conntrack_tcp_timeout_established. Increasing conntrack_max is just
> delaying the issue.
> 
> I could run a script to get rid of them via cronjob but I found this in
> the neftilter documentation:
> 
>> The answer is easy: UNREPLIED entries are temporary entries, i.e. as
>> soon as we run out of connection tracking entries (we reach
>> /proc/sys/net/ipv4/ip_conntrack_max), we delete old UNREPLIED entries.
>> In other words: instead of having empty conntrack entries, we'd rather
>> keep some maybe useful information in them until we really need them.
> 
> (http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html)
> 
> But I'm getting:
> 
>> kernel: nf_conntrack: table full, dropping packet.
> 
> Should this "garbage collection" still work or would it be a good idea
> to implement a dedicated and much smaller counter for those connections?

I'm skirting your issue here, but have you tried:

	echo "0" > /proc/sys/net/netfilter/nf_conntrack_tcp_loose

We've had a similar problem like you, where a partner's firewall would
not ack FIN packets but rather send a TCP RST in reply, which would then
create a phantom "ESTABLISHED/UNREPLIED" connection in conntrack. In our
case we did not run into problems with conntrack overflowing, but rather
we saw our gateway sending RST packets for next SYN requests with the
same source ip:port tuple.

Setting this configuration key to zero made that problem go away.

HTH,
Thomas
