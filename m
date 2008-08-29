From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Is p-o-m still the correct thing to use?
Date: Fri, 29 Aug 2008 07:53:56 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808290748360.30197@fbirervta.pbzchgretzou.qr>
References: <488A7D17.4070506@gmail.com> <s7sl841gefisi4k0lreotlvqbmq9kfl99u@4ax.com> <488EF032.5020000@gmail.com> <alpine.LNX.1.10.0807290646260.21011@fbirervta.pbzchgretzou.qr> <48B744CC.6080903@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48B744CC.6080903@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Mearns <mearns.b@gmail.com>
Cc: Andrew Schulman <andrex@alumni.utexas.net>, netfilter@vger.kernel.org


On Thursday 2008-08-28 20:37, Brian Mearns wrote:

> Thanks for the help Jan and Andrew. I've got xtables (combined) and
> it built and installed fine. When I run iptables --version, it
> matches what's given in the versions file in the source
> distribution. My problem is that the TARPIT target doesn't seem to
> be recognized. When I try to add a rule with the TARPIT target, it
> says "iptables: No chain/target/match by that name". I've tried
> using rules that work otherwise, for instance, changing from DROP
> to TARPIT, and it still doesn't work, so it's not the rest of the
> rule that is the problem.
>
> I found libxt_TARPIT.so in /usr/local/libexec/xtables/. Is it in
> the wrong spot or something?

If you used -combined, there is no problem, as the same prefix (see
below) is passed to both the bundle's components ./configure. You may
need to run `depmod -a` after make install.

I added a patch that will always do this now.

> Also, my service runs from
> /sbin/iptables, but this is soft linked to
> /usr/local/sbin/iptables: could this be part of the problem?

If the .so files got installed into /usr/local/libexec/xtables, the
program files got into /usr/local/sbin (since the default is
./configure --prefix=/usr/local when no prefix is given), hence
/usr/local/sbin/iptables includes the new binary, and if
/sbin/iptables is a softlink, well congrats, you have it all
installed.
