From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Tux and netfilter
Date: Mon, 7 Jul 2003 01:47:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030707014751.276c32c5.arnt@c2i.net>
References: <20030706211403.GA9350@thanes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030706211403.GA9350@thanes.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sun, 6 Jul 2003 23:14:03 +0200, 
Marek Habersack <grendel@caudium.net> wrote in message 
<20030706211403.GA9350@thanes.org>:


> 
> The counter values are the real ones. I would use the iplimit matcher,
> but I don't want to use connection tracking since that would hose the
> machine pretty quick. All of the above actions have the effect that
> the machine is reachable, interaction is good, but tux is practically
> clogged (it's configured to accept 50k connections, keep alives are at
> 1000 since setting

..1000 seconds???  Shave off a zero or two, you should be able to serve
any valid traffic within 5 seconds.

> them to 0 makes tux close any connection immediately, no logging
> etc,). Apache sits on port 81 and when accessed directly it works
> fine, that's good enough, but I'd like to do more. And here I come to
> the real question I want to ask to the list. Is it possible and if
> yes, then how, to redirect the offending packets from within tux to
> the TARPIT chain? 

..does your TARPIT traffic cost _you_ anything?

> net/ipv4/icmp_echo_ignore_broadcasts=1

..also possible to lie and say the box is a crashing, 
or hung dead wintendo.

> fs/file-max=70000
> fs/dir-notify-enable=0
> net/ipv4/tcp_keepalive_time=30
> net/core/rmem_max=262143
> net/core/rmem_default=262143
> net/core/wmem_max=262143
> net/core/wmem_default=262143
> net/ipv4/tcp_sack=0
> net/ipv4/tcp_timestamps=0
> net/ipv4/tcp_syncookies=1
> net/ipv4/icmp_echo_ignore_all =1
> net/ipv4/icmp_ignore_bogus_error_responses = 1
> net/ipv4/tcp_syn_retries = 1
> net/ipv4/tcp_synack_retries = 1
> net/ipv4/tcp_keepalive_probes = 1
> net/ipv4/tcp_keepalive_intvl = 10
> net/ipv4/tcp_max_syn_backlog = 64
> net/ipv4/tcp_low_latency = 1
> net/ipv4/tcp_abort_on_overflow = 1
> net/ipv4/ipfrag_time = 30
> net/ipv4/tcp_fin_timeout = 10
> net/ipv4/tcp_max_orphans = 2048

..why so many?  Most of these would come from "google", no?

> net/ipv4/tcp_tw_reuse = 1
> 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


