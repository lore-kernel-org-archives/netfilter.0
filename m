From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: iptables, NAT, DNS & Dan Kaminsky
Date: Wed, 30 Jul 2008 23:06:18 -0400
Message-ID: <20080731030618.GA26552@cipherdyne.org>
References: <2d460de70807300753h6673017i29374763ca9f763@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <2d460de70807300753h6673017i29374763ca9f763@mail.gmail.com>
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Jul 30, 2008, Richard Hartmann wrote:

> Hi all,
> 
> as you are very likely all aware, Dan Kaminsky uncovered a major exploit
> in RFC-compliant DNS caching servers the successful execution of which
> relies on port prediction/guessing.
> 
> After quite some research, I have come up with the following facts which
> I want to cross-check with you guys so I can be _sure_.
> 
> 
> 1) The --random target for SNAT exists since 2.6.22 to allow 'fixing' of
> broken DNS servers in your NATted LAN along the lines of
> 
> iptables -t nat -I POSTROUTING 1 -p udp -s 1.2.3.4 --dport 53 -j SNAT \
> --to 1.2.3.4 --random
> 
> Is that correct?

Yes (but see below) - you may be interested in this post:

http://www.cipherdyne.org/blog/2008/07/mitigating-dns-cache-poisoning-attacks-with-iptables.html

> 2) Unless there is a collision, the original UDP source ports for
> requests are kept the same. I.e. boxes within the NATted LAN which use
> random UDP ports are secure and neither the 2.4.x nor the 2.6.x series
> of kernels will make those ports predictable while NATting the packets.
> Is that correct?
> 
> 
> 3) Ever since a commit that went into 2.6.24 [1], UDP ports that are
> NATted are randomized by the NATting forewarder, anyway. This means that
> any DNS lookup made from within a NATted LAN secured with iptables to a
> DNS server outside of said NAT is secure by default.
> Is that correct?

That commit applies to the UDP stack itself and is independent of any
iptables NAT functionality.  That is, the source port assigned to a
local UDP socket is randomized, but only if a bind() does not otherwise
request a specific source port.  You can also use the SNAT --random
option in an iptables rule to force a random source port even for those
applications that request a specific source port (the blog post above
has an example of this).

There is also another important factor for the attack which is that any
nameserver that is behind a NAT device that removes any randomness that
the server builds into the UDP source port (regardless of whether this
is accomplished by a patched nameserver or something like the SNAT
--random option is used) will once again make the server vulnerable (at
least from the source port predictability problem).  At this point
randomized transaction ID's become really important - and insufficient.

BTW, I emailed Dan about the first version of his DNS checker tool (see
http://www.doxpara.com) not accounting for cases where the targeted
nameserver is behind something like the SNAT --random feature.  The
source port appears to be predictable because of iptables state
tracking, but only if one testing server is used - Dan has since updated
the DNS checker to use five different testing servers, so the change in
the tuple means the different source ports are assigned and the checker
detects this.

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F

> 
> 
> Thanks for any and all input. I am sure many people would like
> clarification on those points.
> 
> Richard
> 
> 
> [1] http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=32c1da70810017a98aa6c431a5494a302b6b9a30
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
