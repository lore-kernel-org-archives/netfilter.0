From: Bob Miller <bob@computerisms.ca>
Subject: Re: good tutorial
Date: Sat, 05 Feb 2011 11:51:18 -0800
Message-ID: <1296935478.4980.147.camel@laplaplian>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus> <4D4C0B8F.10005@unipex.it>
	 <20110205155829.3a5ebc7b@catus> <1296923860.1695.20.camel@andybev>
	 <BLU0-SMTP7495DFC8C5F2213D76D1D2F3E90@phx.gbl>
	 <1296933724.1617.10.camel@andybev>
	 <BLU0-SMTP140C2CE9F593F7CCFDC80F0F3E90@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP140C2CE9F593F7CCFDC80F0F3E90@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <webster_jack@hotmail.com>
Cc: Andrew Beverley <andy@andybev.com>, netfilter@vger.kernel.org


> 
> Now the reason I asked for a tutorial somewhere is I went through the 
> LARTC tutorial (which just looks like a blank white document) and my 
> understanding of leaf, HTB, U32, qdisc, etc is kind of lacking :)
> 

I have implemented shaping on a couple of occasions, I found using tcng
to generate the tc script greatly simplified the whole question of
qdisc, htb, etc, for me.  I note that I have never seen anyone mention
tcng on this list, and it causes me to wonder if there is a reason it is
not commonly used?

Bob Miller
334-7117/660-5315
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

