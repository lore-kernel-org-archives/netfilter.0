From: Matt Hakim <thepigs@gmail.com>
Subject: Re: fwmark & iptables
Date: Fri, 29 Jan 2010 10:06:15 +1100
Message-ID: <fcfe0b071001281506p2380ef45t99cbf9733b074f1@mail.gmail.com>
References: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>
	 <4B6176A9.3030404@plouf.fr.eu.org>
	 <fcfe0b071001280526t75cdc774x8d3a91497e8af2cf@mail.gmail.com>
	 <4B619284.5030905@plouf.fr.eu.org>
	 <fcfe0b071001281250u13539aa3o82520e8044dee59f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=oVB4zEolzcJnrM7PHoCROtN7A89PAmcYKCeEp7lHna8=;
        b=rN2ElXhdxKMXne8bmQm48evJnl4aXlAtG9EWxhvOj1Hck/jCEqVq3Ot/2U5zCV/fvD
         vDkCn/MZbYeHKNGsnTKV/6xzEuVEbr2YKh7uvTx1WR9ZPMSet0Mh5y5ne8DHlb1P0uBp
         uZ8Am3c8IYXDEGIwX5FseOD/dxU30mf7oR7d0=
In-Reply-To: <fcfe0b071001281250u13539aa3o82520e8044dee59f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Jan 29, 2010 at 7:50 AM, Matt Hakim <thepigs@gmail.com> wrote:
>> Forgot about that, sorry. Make sure sysctl net.ipv4.conf.ppp0.rp_filter
>> is set to 0 after ppp0 is created, otherwise the packet is discarded at
>> the input routing decision stage. sysctl net.ipv4.conf.default.rp_filter
>> contains the value that will be set for any new interface.
>
> Didn't seem to help.
>

OK its working now, after I did various:

echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter

Thanks for your help,
Matt
