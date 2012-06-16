From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Conntrack & Unreplied exhausts hashsize
Date: Sat, 16 Jun 2012 21:39:59 +0200
Message-ID: <20120616193959.GB20265@1984>
References: <1c26dc9ebe0d0e22d5309b6bc0a73e41@njm.linuxwall.info>
 <be60760695706721924e9a5008138b3f@njm.linuxwall.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be60760695706721924e9a5008138b3f@njm.linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, Jun 12, 2012 at 07:22:10AM -0400, Julien Vehent wrote:
[...]
> So, I've been monitoring conntrack for a few days now, and I can
> definitely see the UNREPLIED connections get removed when the space
> is needed for new connections. Which is the intended behavior.
> 
> http://4u.1nw.eu/conntrack_stat6.png

You have lots of entries in ESTABLISHED but UNREPLIED state according
to that figure. Probably someone is sending you forged TCP packets to
enter that state and /proc/sys/net/netfilter/nf_conntrack_tcp_loose is
not set to zero.

portscan tools like nmap can produce this.

> However, I still get `nf_conntrack: table full, dropping packet` in
> my logs from time to time. Should I be worried about those ? Are
> they related to conntrack removing UNREPLIED connections ?

That means it's dropping packets, so you should worry about that, of
course.

The conntrack table can store a limited a number of flow objects. You
probably need to increase that amount.

Still, you should investigate what's going on with your rule-set
configuration and the network traffic that is causing such population.

Wireshark should help.
