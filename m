From: Andrew Beverley <andy@andybev.com>
Subject: Re: good tutorial
Date: Sat, 05 Feb 2011 22:47:04 +0000
Message-ID: <1296946024.1663.18.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus> <4D4C0B8F.10005@unipex.it>
	 <20110205155829.3a5ebc7b@catus> <1296923860.1695.20.camel@andybev>
	 <BLU0-SMTP7495DFC8C5F2213D76D1D2F3E90@phx.gbl>
	 <1296933724.1617.10.camel@andybev>
	 <BLU0-SMTP140C2CE9F593F7CCFDC80F0F3E90@phx.gbl>
	 <1296935478.4980.147.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296946028; bh=hiktey7sDiOKcrdKOuasn8ITTdpE8924otVwa
	V1BBXM=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=F9YWO6ke
	xZ3d8/Ugl1eNOWQo/On92UksAbBG6IBW09z6t+DEXWub5GHDDktlDYhLf3SxXmPMThc
	SMnTPs8j24hH1oA8Q0DUpvVRP8GYMnh55x0Z7nrP3xK01JAPGYrpXP9v93BGxAFLUay
	zpWN8eUUGfGcfI8+gvdQpIu2oQE8I=
In-Reply-To: <1296935478.4980.147.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Miller <bob@computerisms.ca>
Cc: J Webster <webster_jack@hotmail.com>, netfilter@vger.kernel.org

On Sat, 2011-02-05 at 11:51 -0800, Bob Miller wrote:
> > 
> > Now the reason I asked for a tutorial somewhere is I went through the 
> > LARTC tutorial (which just looks like a blank white document) and my 
> > understanding of leaf, HTB, U32, qdisc, etc is kind of lacking :)
> > 
> 
> I have implemented shaping on a couple of occasions, I found using tcng
> to generate the tc script greatly simplified the whole question of
> qdisc, htb, etc, for me.  I note that I have never seen anyone mention
> tcng on this list, and it causes me to wonder if there is a reason it is
> not commonly used?

I seem to remember I looked at it, but preferred the flexibility of
writing rules myself. Good point though - for the needs of most it looks
to be useful. Is it still maintained though? The Sourceforge site
doesn't look like it's been touched for a few years (not that that
necessarily matters of course)...

Andy


