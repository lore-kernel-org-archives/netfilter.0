From: John Little <jlittle_97@yahoo.com>
Subject: Re: Using iptables with high volume mail
Date: Thu, 1 Oct 2009 05:45:08 -0700 (PDT)
Message-ID: <806519.62905.qm@web53107.mail.re2.yahoo.com>
References: <594040.85734.qm@web53111.mail.re2.yahoo.com> <56378e320910010454v7a200e8evb7b39f1923637dd4@mail.gmail.com>
Reply-To: John Little <jlittle_97@yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1254401108; bh=hbj3/8ZNHi9diDAcNSctk0EZG3tqucYZh1hjauhWtEo=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type; b=NfDvO+QK/2Yqzk+l7Cd+y1KI+TKWMocgCeYVKzG5Hv+MAFg0s4UCVPiTeikn2AabwpmICmBNXiKQWOxlnxstVT2Ptd3rHuDziD1MYTrU0BSOpcibMGwS2tpa2X6eg3FDIk8Bx4VM7gcRCECCNHk9G6FHl681z6k74k26RS+fNkI=
In-Reply-To: <56378e320910010454v7a200e8evb7b39f1923637dd4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org



----- Original Message ----
> From: Richard Horton <arimus.uk@googlemail.com>
> To: John Little <jlittle_97@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Sent: Thursday, October 1, 2009 7:54:06 AM
> Subject: Re: Using iptables with high volume mail
> 
> 2009/10/1 John Little :
> 
> > What modules, tables and rules to use to optimize iptables for this type 
> volume?  All of the mail is sent on the standard port 25.  We need to optimize 
> for quick deliverability.  (I've read the man page and looked at TOS with the 
> mangle table.  I read somewhere that this only for udp.)
> 
> Setting the DSCP / ToS field via mangle will work with IP traffic
> regardless of payload type (UDP/TCP/IPSEC Tunnelled/etc). However,
> there is only any point in applying it for 'quick' delivery if the
> upstream routers are configured to apply a diffserv policy on a per
> hop basis.
> 
> Apart from that 'quick delivery' isn't really something diffserv can
> give you: EF traffic (Expedited forwarding) is intended for real-time
> jitter sensitive traffic where loss is less of an issue than excessive
> inter-packet delay. For reliable delivery use an AFxx class. However I
> don't believe applying diffserv / tos in your case will achieve the
> end results you are looking for unless you have control over all the
> hops along the mail path, or SLA's in place with the network
> provider(s) -- and usually once you exceed your purchased amount of
> traffic within a class its either remarked or dropped - and strictly
> under diffserv should be dropped as you should not remark outside of a
> class.
> 
> -- 
> Richard Horton
> Users are like a virus: Each causing a thousand tiny crises until the
> host finally dies.
> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
> http://www.pbase.com/arimus - My online photogallery


Hi Richard

Good point.  We don't control the hops on the mail path.  We also
strictly observe the traffic rules that we have agreed to with the
upstream providers.  

As I think about my question and your answers the next part would be
that we want to "streamline" our iptables rules so that they are
working efficiently and not consuming any more resources than are
necessary.  To that end I would think that I would probably need to have some rules written and post them here for review.  

Resource consumption has been a major issue with the commercial devices
we have tried.  This has led to the question of building the machines
with iptables that are tuned specifically for our environment.  

I realize that other kernel tuning parameters need to be factored in as
well.  I'm just want to make sure we have all of our bases covered.

Thanks,
John



      
