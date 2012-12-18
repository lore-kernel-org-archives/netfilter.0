From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Formal submission of Xtables2
Date: Mon, 17 Dec 2012 20:51:52 -0500
Message-ID: <201212172051.52499.neal.p.murphy@alum.wpi.edu>
References: <20121213142820.GA3489@1984> <alpine.DEB.2.00.1212172356530.16469@blackhole.kfki.hu> <alpine.LNX.2.01.1212180205180.24618@nerf07.vanv.qr>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1212180205180.24618@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

As a disinterested third party*, I think Jan is voicing stronger arguments, 
and that Pablo may need to enhance his debating skills.

N

* Disinterested in that I don't have a bone to pick in this debate. I do have 
a few netfilter thoughts, though, concerning general usability enhancements to 
the facility: 32 bit connmarks can be rather limiting (64 bits would be far 
more adequate), integrated IPv4/IPv6 (it'd be nice to be able to specify both 
addresses for a node in a single rule, for dual-stacked nodes), and a way to 
explicitly include related conns in a rule (after establishment, there seems 
to be no way to associate a related conn with the rule that allowed it in the 
first place).
