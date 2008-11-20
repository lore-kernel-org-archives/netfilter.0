From: Mike <mikef1007@gmail.com>
Subject: Re: Ports
Date: Thu, 20 Nov 2008 10:00:20 -0800
Message-ID: <d006ee070811201000k7684ffaah4851e687dc3942d4@mail.gmail.com>
References: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
	 <20081120122753.606233a2@nacelle.mxtelecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=nnpAP1ePESzyIPe8kOnp9adk9vU3hF7kTfPhXw+aPWU=;
        b=FlMOeSH0hyOR4DbN8CC450SY+BjBvb1MtIDREXn6NojEq5hNFZu1QjWOe4HU7QNqKE
         bYF9+jHhw0xoXy3/LVm+D8LxYlO4uvoAQI2JxmwWiMsS1/bTX2Q3kxD+UcreSDCoTq4C
         qdsJ0LSYDX5YnTGZYSbcwsx0dH2OehZYz3Wek=
In-Reply-To: <20081120122753.606233a2@nacelle.mxtelecom.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Evans <paul@mxtelecom.com>
Cc: netfilter@vger.kernel.org

> Mike <mikef1007@gmail.com> wrote:
>
>> iptables -t nat -A PREROUTING -p tcp --dport portX -j DNAT --to :portY
>
> You want -j REDIRECT rather than DNAT

Paul, Thanks for your reply.

I tried the following, prior to that i flushed iptables.

 iptables -t nat -A PREROUTING -p tcp --dport X -j REDIRECT --to-ports Y

I ssh from another box, into the box I issued the above iptable
tcpdump only showed traffic on port X and nothing on port Y

thanks,
