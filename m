From: Steve Brown <sbrown25@gmail.com>
Subject: Re: Poor upload speed with NAT
Date: Tue, 11 Aug 2009 10:58:23 -0500
Message-ID: <1f4ef0970908110858o38f3cf14s958287679e67f615@mail.gmail.com>
References: <1f4ef0970908101443i28bf4c1hc6b280d4096fd100@mail.gmail.com>
	 <6808368f3857f867cd0735df99bacdd8@mail.treenet.co.nz>
	 <1f4ef0970908110722i41e934bcm48b2ba0d66587dcf@mail.gmail.com>
	 <200908111029.42368.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=XYLgFrD0ZiitxJP0cyMq0U6Uii56fDUxD1Y7iBFHMKE=;
        b=g9LJeoPPUcnt7gHne1atig2EWb0JW7QV5vRbtZvloJVG+me/Z6lPcFvX6NfVT36/ji
         3ymWBjkzes7lQ2X0yyZrYm6bNWTqK7TrNNKSwMTHNndct1rCE7N+XUCC+zw/IjQ1PlLI
         tLLdQAnrWxQDCrm0WBMmq80usGa7X3ySryamU=
In-Reply-To: <200908111029.42368.rob0@gmx.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

>> > Have never seen any such performance drop on multiple NIC.
>>
>> Neither have I, which is why this is bothering me.
>
> I can't really comment on this. You might consider doing some
> troubleshooting to test your hypothesis, such as tcpdump(1) of some
> poor-performing connections. You haven't posted anything here which
> lends credence to it.

My setup:

LAN -----> Router -----> Internet

If I don't go through NAT, performance increases dramatically.  As I
stated in the OP, uploading to any location from the router box itself
is about 10x faster than going through NAT.  To me, that indicates the
likely source of the problem, although I'm open to other suggestions.

What would I be looking for in a tcpdump?  Connection resets or
something similar?

>> I'm running a custom 2.6.30.3 kernel.
>
> Do the same symptoms manifest when you're running the distro kernel?
> The custom kernel would be a possible suspect.

Isn't the kernel the "definitive" netfilter source?  How would a
vendor's patches impact performance to this degree?  If I am
understanding you correctly, you are suggesting that Ubuntu's
implementation of netfilter is significantly faster than netfilter's
implementation, is this correct?

I'm willing to allow that the kernel has something to do with this.
For example, when I first started looking at this problem, uploads
wouldn't go faster than 30kb/s on a 2.6.26 kernel.  When I upgraded to
2.6.30, performance doubled to 60kb/s.  So if I could double that
performance 4-5 more times, I would be good to go. ;-)

Unfortunately, these boxes have been in service for a long and the
vendor no longer supports the versions they are running.  They are
maintained by building software and the kernel from source, so going
back to a vendor-supplied kernel isn't really an option ATM.
