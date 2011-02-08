From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Tue, 08 Feb 2011 06:53:46 +0000
Message-ID: <1297148026.1742.51.camel@andybev>
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
	 <1297131635.3956.5.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1297148041; bh=nqJhxZroNawt3rEQm1HM+HAZBClDfzkFv06kr
	tEnaS4=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=RSaEvNYD
	fH4+O4L2Wyf/o1VVIroc1D9eChQ3erF7ubrXqjjuzUvT47Ufn8cui+4l1a/IplHOijz
	6GxdmFO4fhJXp42IsXVfzbxz1p+Npeo/9a0Vc+VelaNt3w1q4UvE70/hsKyPMf/nnTz
	Nv0XSNCzuCpXIp7HhePj9fIU01cww=
In-Reply-To: <1297131635.3956.5.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

On Mon, 2011-02-07 at 22:20 -0400, Optimum Wireless Services wrote:
> On Tue, 2011-02-08 at 00:56 +0000, Andrew Beverley wrote:
> > tc-viewer --iface=eth0 --zero --counter=1 --unit=kbit
> 
> I ran tc-viewer but, some of the values doesn't make sense or do not
> match:
> 
>  2:1085               <  739000bit -  739000bit >      0.0 kbit/s  (
> 0pps)
>  2:1087               <  739000bit -  739000bit >    403.0 kbit/s
> ( 36pps)
>  2:1089               <  739000bit -  739000bit >      0.0 kbit/s  (
> 0pps)
>  2:1091               <  739000bit -  739000bit >      0.0 kbit/s  (
> 0pps)
>  2:1093               <  739000bit -  739000bit >      0.0 kbit/s  (
> 0pps)
>  2:1095               <  739000bit -  739000bit >    941.4 kbit/s
> ( 82pps)
> 
> How come a leaf that's only allowing 739kbit is allowing 941kbit/s ?
> 

I don't know - I've not seen that before. Maybe this is one of those
"strange things" that happens when your leaf classes don't add up to the
root...?

Andy


