From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack helpers in kernel 4.7
Date: Thu, 11 Aug 2016 13:34:35 +0200
Message-ID: <20160811113435.GA4544@salvia>
References: <20160811085251.GR9430@torres.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160811085251.GR9430@torres.zugschlus.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter@vger.kernel.org

On Thu, Aug 11, 2016 at 10:52:51AM +0200, Marc Haber wrote:
> Hi,
> 
> I am running my firewall at home with Debian stable (which has
> iptables 1.4.21) with a current kernel. Since the update to kernel
> 4.7, my connection tracking seems to be broken which shows itself in
> sporadic malfunctions of SIP telephony. Protocols not needing
> conntrack helpers do still work fine.
>
> I have found the document "Secure use of iptables and connection
> tracking helpers" on
> https://home.regit.org/netfilter-en/secure-use-of-helpers/ and am
> currently suspecting that support for the legacy mechanisms has been
> removed in kernel 4.7 since the reject log messages for SIP packets
> have started after I upgraded to linux 4.7.

You can still recover the old automagic behaviour by:

        echo 1 > /proc/sys/net/netfilter/nf_conntrack_helper

But that will go away too at some point given this behaviour is
unsecure as the document above describes, so please don't give up on
upgrading your ruleset.

[...]
> This confuses me:
> 
> (1) Why does the packet end up in the input queue in the first place?
> To me, this looks like the incoming packet on unt381 is not correctly
> tracked by the NAT code. It should be natted and processed by the
> FORWARD chain.
> 
> (2) Why are the packet counters of all ctstate rules with helper match
> "sip" at zero? Why don't they apply for the incoming packet which
> seems to fall through until the concluding REJECT rule?

Because no conntrack entries are getting the sip helper attached.

> (3) do I need the PREROUTING --jump CT rule mentioned in the Securing
> helpers page if I only use the default Port 5060?

Yes, the CT target explicitly attach the conntrack helper, so you
need something like:

        -A PREROUTING -t raw -p udp --dport 5060 -j CT --helper sip

This plugs the sip helper to every new flow going to port 5060.
