From: Alberto Quattrini Li <alberto.quattrinili@gmail.com>
Subject: Re: NAT with forwarding to multiple destinations
Date: Thu, 2 Dec 2010 13:49:03 +0100
Message-ID: <AANLkTimdrDkbv_OUnFdPWCQ3So4NBB3yrfxv-gPGZG8E@mail.gmail.com>
References: <AANLkTinoWt8qNJKYhyjHbM5oOb-V6_aNAqTm=EJmU1Gn@mail.gmail.com>
	<4CF79516.9000003@coochey.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=vaXJ1bDSWy+hhZPTDBlC/iipWvSytDr1AzoO+lcMk6k=;
        b=YMycY8ZsP9imXyKuJwUT0adavSzUDVbQULmdsyNdYjwRHzvwU+Qz6r5HIr8xWoMChI
         Kr8F+JY14N7PVlO/0XRbUR2KKFGYPcT3r6xkX4f3wIkAdbuIW+pbwYHEr8oaiVX9A6vb
         w7tvi8A+oBI39W18K+s0J8qIA4l255lNImmp0=
In-Reply-To: <4CF79516.9000003@coochey.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giles Coochey <giles@coochey.net>
Cc: netfilter@vger.kernel.org

Sorry I didn't specify it. Of course I use UDP protocol, so it is
connectionless.

Alberto


On Thu, Dec 2, 2010 at 1:46 PM, Giles Coochey <giles@coochey.net> wrote:
> On 02/12/2010 13:38, Alberto Quattrini Li wrote:
>
> Hi,
>
> I would like to know if there is any way by using NAT feature to
> forward a message to multiple destinations. I know that there is the
> package TEE, but that works at IP level, and so you can duplicate the
> packet to another host (i.e. specifying another address, but not the
> port). Moreover I know that specifying a range of port in
> to-destination just load-balances the traffic flow within that range,
> so that solution doesn't work.
>
> For example, let's say that I have a server that wants to broadcast a
> message to different clients on the same machine (so identified by
> localhost:port; each client has different port obviously).
> So it would be very easy if the server can send the message to the
> "broadcast port" and when netfilter intercepts it, by matching that
> broadcast port as destination port, netfilter would forward it to
> destinations specified by the rule.
>
> Maybe you just want multi-cast.
>
> You couldn't do this with connection based protocols such as TCP as you need
> to handle each connection differently at higher layers.
>
> --
> Best Regards,
>
> Giles Coochey
> NetSecSpec Ltd
> Email/MSN/Live Messenger: giles@coochey.net
> Skype: gilescoochey
>
>
