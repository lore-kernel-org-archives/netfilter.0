From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Dropped packets logged which should be accepted by Conntrack
Date: Sun, 4 Dec 2011 17:21:57 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111162204590.26054@frira.zrqbmnf.qr>
References: <1321326448.2936.43.camel@denise.theartistscloset.com>  <alpine.LNX.2.01.1111161648420.26212@frira.zrqbmnf.qr> <1321471542.2936.113.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1321471542.2936.113.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2011-11-16 20:25, John A. Sullivan III wrote:

>:FORWARD DROP
>-A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
>-A FORWARD -m mark --mark 0xcccc/0xcccc -j VPN_ALLOW
>-A FORWARD -j UPEPIN_DENY
>-A FORWARD -j UPEPIN
>-A FORWARD -j LOG --log-level warning --log-prefix "No Match: "
>
>I may be ignorant on this matter (and hence this request for help) but
>has the Internet matured to the point that the TCPMSS rule is no longer
>necessary? Is everyone now handling requests for fragmentation properly?

Well, of course there's always some "who never grow up", but I have not 
seen any such sites lately. Probably because such pages are of such a 
sort that does not interest me ;-)
