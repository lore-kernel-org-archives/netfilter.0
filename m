From: Brian Mearns <mearns.b@gmail.com>
Subject: Re: Is p-o-m still the correct thing to use?
Date: Thu, 28 Aug 2008 20:37:32 -0400
Message-ID: <48B744CC.6080903@gmail.com>
References: <488A7D17.4070506@gmail.com> <s7sl841gefisi4k0lreotlvqbmq9kfl99u@4ax.com> <488EF032.5020000@gmail.com> <alpine.LNX.1.10.0807290646260.21011@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :organization:user-agent:mime-version:to:cc:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=21XcEXGnjJexzG6G+H6YX+wBthe6FCY/HUnG6aTuA9Q=;
        b=UGTbYPc4cpZo9GncfQ1Pr5ITUd0hVv7URSubv5DTFBlVCOu7OBolQQyiIGhuFVMrfY
         eQ/1g/8JGPrfnbBPFC3gwMqBBd32LQtx36NbiuLHE0U2VEzHIH1xwekaiwxDNvwtx79u
         r6PeF3ooCb9FovCSNjKN0MY7Wy6SnoxF6E7oI=
In-Reply-To: <alpine.LNX.1.10.0807290646260.21011@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Andrew Schulman <andrex@alumni.utexas.net>, netfilter@vger.kernel.org

Thanks for the help Jan and Andrew. I've got xtables (combined) and it 
built and installed fine. When I run iptables --version, it matches 
what's given in the versions file in the source distribution. My problem 
is that the TARPIT target doesn't seem to be recognized. When I try to 
add a rule with the TARPIT target, it says "iptables: No 
chain/target/match by that name". I've tried using rules that work 
otherwise, for instance, changing from DROP to TARPIT, and it still 
doesn't work, so it's not the rest of the rule that is the problem.

I found libxt_TARPIT.so in /usr/local/libexec/xtables/. Is it in the 
wrong spot or something? Also, my service runs from /sbin/iptables, but 
this is soft linked to /usr/local/sbin/iptables: could this be part of 
the problem? I did this so my package manager doesn't overwrite it any 
point, but maybe it was a bad idea?

Any help would be great.

Thanks,
-Brian

Jan Engelhardt wrote:
> On Tuesday 2008-07-29 06:25, Brian Mearns wrote:
> 
>> Thanks a lot for the help, Andrew. The iptables source I have
>> doesn't have a configure script...oh, but it does have an autogen
>> script. I guess I was probably supposed to use that first. But it's
>> a moot point, apparently, because of xtables, so I will be
>> switching to that.
> 
> Released tarballs should have configure; for autogen, you usually
> need (even more) developer tools than you do without, like
> autoconf, automake, and the other autowhatevers.
> 
> No moot point; iptables still is, as of today, the name of the
> userspace package and control program.
