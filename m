From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Tue, 08 Feb 2011 06:52:11 +0000
Message-ID: <1297147931.1742.49.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	 <1296908825.1695.8.camel@andybev>
	 <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
	 <1297008953.1613.24.camel@andybev>
	 <1297010113.3928.12.camel@debian-laptop.OptimumWireless>
	 <1297011729.1613.50.camel@andybev>
	 <1297034845.3928.23.camel@debian-laptop.OptimumWireless>
	 <1297126577.1742.34.camel@andybev>
	 <1297131075.3956.2.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1297147944; bh=ouhUL2TcGLhjhFDxCXRXY2oksW2cj7Pcpz/GP
	G9WQfo=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=qpXGdcJ4
	R6uL9tA1lH1mc0kWtS6/HE5MHbA6Vu73gj466qkBYtNYRFZit/idXr8UY/ToytlJjPL
	AwU1Up29fEDUF6os/UlMVoKx6jGN/FoNI1JtpT8sINoeKskMrEOHyMnaioDeFXMVWtz
	/QzHc2svPBv3HAJelDvHoyAToMLeM=
In-Reply-To: <1297131075.3956.2.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

On Mon, 2011-02-07 at 22:11 -0400, Optimum Wireless Services wrote:
> > If you give me a few days I'll send you through my traffic
> > prioritisation script. It won't give you the per-user limit, but I can
> > almost guarantee that it will give everyone faster access, so you can at
> > least use it for a comparison to see what is possible.
> > 
> Thanks.
> 
> I will defenately test it but, I wouldn't like my users to get used to a
> higher speed than they're paying for in case I decide to remove it. If
> it works, great. 
> 
> How many users do you have on the network you're running the script?

Maximum signed-up I don't know, but about 100 concurrently actually
using it at peak periods.


