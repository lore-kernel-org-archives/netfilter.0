From: Curby <curby@cur.by>
Subject: Re: noob question howto using iptables limit ip access times
Date: Mon, 21 Jun 2010 08:58:16 -0600
Message-ID: <AANLkTilhJbehk5bjVQRspb0ludFdW0F0bzEvTtU4E9cR@mail.gmail.com>
References: <AANLkTimidapf_oJzL3tN2U275oX-nubojD5YRC6mwS-H@mail.gmail.com> 
	<4C1F54DF.5090802@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C1F54DF.5090802@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Zhu Jing <shadowarrx@gmail.com>, netfilter@vger.kernel.org

On Mon, Jun 21, 2010 at 6:02 AM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Because your rule limits packets, not connections. A single TCP
> connection involves multiple packets.

Yes, the stateful features of netfilter would be useful here.  Drop
the INVALIDs, accept the ESTABLISHED,RELATED, drop NEW not SYN
packets, and your match will mostly match valid new connection
attempts.  This could be further improved by detecting and dropping
port scans, as Jan wrote about.

This prevents the 1000/day rule from matching packets for ESTABLISHED
connections and for spurious packets that should be ignored.

--Mike
