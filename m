From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Sat, 05 Feb 2011 16:37:40 +0000
Message-ID: <1296923860.1695.20.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus> <4D4C0B8F.10005@unipex.it>
	 <20110205155829.3a5ebc7b@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296923868; bh=mHibtNo0zT0Mz7Bu09QH5kQDp3+U2Qm1r9wio
	oT6VEc=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=Tw2E1qIZ
	GWhijsxhBf9j9Q8VIWnKHptHNtbGzWNHzJm8xgIVZvmlKMMZrj+30AY4ZYZ67zcf7i6
	/k2dBo66FYcV+xfDGPI3u+OrS05W4M23TYXzyx4ZH2cj3G/xBayTThlXZdYY/eQxRKA
	8HrVcG32t+PNTBtXNpkaTTaMVFUoo=
In-Reply-To: <20110205155829.3a5ebc7b@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>, wilson@optimumwireless.com, netfilter@vger.kernel.org

On Sat, 2011-02-05 at 15:58 +0100, Marek Kierdelewicz wrote:
> > Hi,
> 
> Hi
> 
> >I, are you sure about the big difference?
> >I agree with you about tc u32 filters are better than iptables +
> >marking, but like now I have about 100mbit 1k+ users with
> >mangle+classify and tc+htb+egress and I have a load at about 0.2.
> >My cpu are xeon 2.6 quad.
> 
> Do you have individual iptables rule doing marking for each user (1k+
> rules in mangle)?
> 

I have to admit that I don't mark per user. I have lots of users, but I
instead mark the type of traffic and shape on that.

Optimum Wireless Services - what is your aim? Do you really want to
limit bandwidth per user, or do you instead want to provide each user
with a fair share of bandwidth and fast internet access? If it is the
latter, you are better to not mark per user, but instead mark the
traffic type and use tc's hash functionality to share the bandwidth
between client IP address, rather than the default which is per
connection.

Andy


