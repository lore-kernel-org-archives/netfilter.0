From: "Marcelo Moreira" <marcelom@qualitau.com>
Subject: Re: SSH and NAT
Date: Mon, 24 Mar 2003 17:08:19 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <037001c2f26b$05ef5a70$a828a8c0@qualitau.com>
References: <20030324182922.GF8391@netinertia.co.uk> <NABBJOOEOFODEALNMJAJCEFEHOAA.B-Morgan@concentric.net> <20030324203629.GH8391@netinertia.co.uk> <200303242314.13073.kimj@dawn.dk> <20030324224026.GN8391@netinertia.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: James O'Gorman <james@netinertia.co.uk>
Cc: netfilter@lists.netfilter.org

> > The IP packet only contain some primitive information - if you wish to
deal
> > with names, then you have to use DNS. You can't store the name
information in
> > the packet header.
>
> Not quite sure what you mean by this? I've set up the DNS so that box1
> and box2 both point to an IP (albeit the same one as I only have the
> one) - an A record on the DNS server.

Ok. Let me see if I can explain this a little bit better.
An IP packet has only the numeric address information on it.
So essentialy, a ssh packet to box1 and another to box2 are
the same (except for time, sequence, flags, etc).
The DNS information is not on the IP header at all. It is just
another protocol that is used to map names to numeric addresses.

> > I can recommend that you read about IP headers if you wish to know more
about
> > the construction of these magic little packets :-)
>
> I understand bits of it, but obviously not enough. :)
> Guess I should get reading!

Yes, I guess you should also. In fact, get the definitive IP guide:
TCP/IP Illustrated, Vols I II and III. Author is Stevens.
Have fun on your reading...

Marcelo.



