From: Bradley Kite <bradley.kite@gmail.com>
Subject: Re: nfq_set_verdict
Date: Mon, 24 Sep 2012 14:54:43 +0100
Message-ID: <CA+JxU+4Y3VPiLTioN=WNKX+ma=FY-OW8MF8ncYG0KgU4Y+ay7g@mail.gmail.com>
References: <CA+JxU+5mE7cYFR53HZwwOMLhB9Ho1C4+eTrs81Z2r0yy6Yh=4A@mail.gmail.com>
	<1348257655.4663.97.camel@andrew-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=544qFdmua78rlzxiNUKXLFyI7UBDCjmTQt/JrV3k1a8=;
        b=z2Iqw7GEIoufIGDttyTJLYFLOpkZftUE5F6UxFweGi8dwssegZEyfBpN3N+jbGcCDx
         u9s5GoeICYL74Ic3CWWgC1ekooRASnMW0F0rv7KULczSzKJOedPWoq6XvKEgSqTzA+Jn
         oL9z6bbQpes5p0NCrn3FtotZ5KAiCMFa92Sw/IOt3cXRy4d/JBgKTSPucXg201HeyMCo
         1G7oASdl8s2IiHbNGHN4vZw0HPSk6b079t6NK5J+eiOnSgJcd6/L/9RPjOpT0c1wZPVH
         KXF1t5bjzChVlOJYROMpB3dd5ZxXoA4XN1ztkko2crD6j41qfjVzHMsTmloqStZPaMwR
         qy9Q==
In-Reply-To: <1348257655.4663.97.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On 21 September 2012 21:00, Andrew Beverley <andy@andybev.com> wrote:
> On Fri, 2012-09-21 at 14:38 +0100, Bradley Kite wrote:
>> Any clarification would be appreciated - or perhaps someone can point
>> me in the direction of the right way to introduce delays to specific
>> packets in this way?
>
> Could you use the netem qdisc instead, and filter only the required
> packets into it?
>
> Andy

Hi Andy,

I need very fine-grained control over the delay that should be
introduced for each packet - although I havent looked into it in any
great detail I think netem qdisc etc. is more for general
latency/bandwidth control.

I've since stumbled across netmap
(http://info.iet.unipi.it/~luigi/netmap/) and looking into using that
instead of netfilter_queue - I think it might be more suited to my
needs as I dont actually need any of the iptables functionality - just
a way to hook into each packet.

--
Brad.
