From: Andrew Beverley <andy@andybev.com>
Subject: Re: Problem with log which are corrupted and need help with
 hitcount and FORWARD rules
Date: Sat, 22 Oct 2011 15:25:17 +0100
Message-ID: <1319293517.26402.6312.camel@andybev-desktop>
References: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
	 <1319289600.26402.6260.camel@andybev-desktop>
	 <CACMGiwZ-4Q-xvVQOx3MM79U7YrwafcW+cMxsU932dRKfkM46GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319293516;
	bh=+D4oAyhXKHKEWNp41KZt0bGWrN8CSKMo6NwcnArqTCo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=cE8+ssxTw0VreLQcL0+GxqFGvCeLmDMkz0Dr06CjIHP3TjPJh/Ucgvq5v/32NjUvz
	 87j6Z6HoxQuxopHV/SmTsgZLNKzc8FXKyvlK1LJF3QBMLKOxf0ypdUESWBGt9nhvew
	 MzoVku4vM7h2PdMLeH1E3v4NcHIGZ/GEIQb1V1Nc=
In-Reply-To: <CACMGiwZ-4Q-xvVQOx3MM79U7YrwafcW+cMxsU932dRKfkM46GQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Azerty Ytreza <007liamg007@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2011-10-22 at 16:14 +0200, Azerty Ytreza wrote:
> "What exactly are you trying to achieve? If you're changing to a FORWARD
> rule then I assume that you are trying to adapt your rules in order to
> block connections destined for a remote server, rather than the local
> host?"
> 
> I want to limit the number of connections which passtrough the host.

Okay, in which case you do want FORWARD.

> Yes, I can block that on the remote server but I prefer on the local
> if it's possible.

Do you really mean "local" (in which case you want OUTPUT) or do you
just mean on your gateway/firewall server that all the traffic passes
through?

> 
> "Do you really mean UDP?"
> 
> No, it's an error sorry. I have copy/paste other rules and adapt rules
> but forget to change udp to tcp.

Okay, so it's working now?

> "You've got a mixture of INPUT and FORWARD. Is that what you want?
> Remember that packets will never transverse both the INPUT and FORWARD
> chains."
> 
> The port 443 is blocked by default it's for that which I open and
> after redirect. If I made only a FORWARD it's open directly the port
> without INPUT rules ?

It depends where you're blocking it. What's the default FORWARD rule?
ACCEPT?

The bottom line is that you need all your rules in FORWARD *or* INPUT. A
picture paints a thousand words:

http://jengelh.medozas.de/images/nf-packet-flow.png

Or for a simpler (out of date) version:

http://www.docum.org/docum.org/kptd/

> 
> 
> Thank you for your response !

No problem, but please put your responses in-line to the original email
rather than copying and pasting to the top! Oh, and copy the list as
well.

Andy


