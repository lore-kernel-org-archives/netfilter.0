From: "/dev/rob0" <rob0@gmx.co.uk>
Subject: Re: Poor upload speed with NAT
Date: Tue, 11 Aug 2009 10:29:40 -0500
Message-ID: <200908111029.42368.rob0@gmx.co.uk>
References: <1f4ef0970908101443i28bf4c1hc6b280d4096fd100@mail.gmail.com> <6808368f3857f867cd0735df99bacdd8@mail.treenet.co.nz> <1f4ef0970908110722i41e934bcm48b2ba0d66587dcf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1f4ef0970908110722i41e934bcm48b2ba0d66587dcf@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tuesday 11 August 2009 09:22:17 Steve Brown wrote:
> > I always *NAT in PREROUTING and MASQUERADE in POSTROUTING if
> > needed. 
>
> According to the manpage for iptables, SNAT is only valid in the
> POSTROUTING chain.  Is this incorrect?

MASQUERADE is a form of SNAT (source NAT). SNAT is done in the
POSTROUTING chain.

> > Have never seen any such performance drop on multiple NIC.
>
> Neither have I, which is why this is bothering me.

I can't really comment on this. You might consider doing some
troubleshooting to test your hypothesis, such as tcpdump(1) of some
poor-performing connections. You haven't posted anything here which
lends credence to it.

On Monday 10 August 2009 16:43:14 you wrote:
> I'm running a custom 2.6.30.3 kernel.

Do the same symptoms manifest when you're running the distro kernel?
The custom kernel would be a possible suspect.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
