From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nf_conntrack_max
Date: Mon, 5 Sep 2016 11:33:04 +0200
Message-ID: <20160905093304.GB2469@salvia>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
 <20160831224731.GP28999@harrier.slackbuilds.org>
 <20160901105911.GA2779@salvia>
 <20160901170540.GQ28999@harrier.slackbuilds.org>
 <000201d2052b$78188090$684981b0$@bluemarble.net>
 <000001d20613$933e88e0$b9bb9aa0$@bluemarble.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000001d20613$933e88e0$b9bb9aa0$@bluemarble.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Ratliff <jratliff@bluemarble.net>
Cc: netfilter@vger.kernel.org

On Sat, Sep 03, 2016 at 02:47:08PM -0400, John Ratliff wrote:
> I have been able to raise the conntrack limits and the hashsize, but I don't
> know how to get a udp timeout policy yet. I'm using Debian 8 Jessie with
> nfct 1.42.
> 
> $ nfct timeout add dns-udp inet udp established 15 close 1 close_wait 1
> nfct v1.4.2: Wrong state name: `ESTABLISHED' for protocol `udp'

UDP has two states, replied and unreplied, so this is:

 # nfct add timeout dns-udp inet udp replied 15 unreplied 1

For TCP, states are:

        syn_sent
        syn_recv
        established
        fin_wait
        close_wait
        last_ack
        time_wait
        close
        syn_sent2
        retrans
        unacknowledged

When the generic tracker is in place, you use "timeout", eg.

 # nfct add timeout generic-timeout-policy inet generic timeout 15

For SCTP, states are:

        closed
        cookie_wait
        cookie_eched
        established
        shutdown_sent
        shutdown_recd
        shutdown_ack_sent

For DCCP, states are:

        request
        respond
        partopen
        open
        closereq
        closing
        timewait

For ICMP/v6, there is only one, so you use "timeout".

That's it. If anyone gets some spare cycles, I'd appreciate if you can
contribute a patch to update the manpage so this information is
available there.

You can use this to create your custom timeout policies. You can also
set global default timeouts via nfct:

 # nfct default-set timeout inet tcp established 15

instead of using sysctl, just an alternative.

Thanks!
