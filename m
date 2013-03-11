From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Netfilter applied to specific interfaces only
Date: Mon, 11 Mar 2013 07:42:59 -0400
Message-ID: <CACuyg25jxPuGnVWOCfzg+r3jOr2qZxXks=cHBEKRqCC2TDZ4Wg@mail.gmail.com>
References: <201303102246.48024.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=DArJe7KLLjfYv8kJg0yGIBZ7MMP/QIodg3eCmBs4d34=;
        b=XJp7cSUUU43f7yTZ5wCo06dNI9ZP9mjAdqtGfAVrsLxESdxy8JDmKb2LVJZSuNF4jk
         +6nAmocCJYUiNRQbbqWfAU2nVGOdC4rGeLIwWE8aQerKUYPXlkvGToFFTG3cEKJWRieH
         kVElFmKvj0T3EDer0icmAtTTQps+YxxQH1l7reL3/NImCtdThFcVyOzEQlbwxd6ITfLC
         SsesjQOFOaGStBE5YKhsk7BXKettieD3dCZWtK5rjffObbQDLUFlaWgNmRIFsJOkF+c1
         SGdobE8O+xufs8QmbniXxy/JL/Zlr9PtsZcKvGfE7HlBFI8gZopAdB3cAh86tNi3sJUs
         aCFQ==
In-Reply-To: <201303102246.48024.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

2013/3/10 Neal Murphy <neal.p.murphy@alum.wpi.edu>:
> I humbly disagree. Any server exposed to the internet should be configured to
> limit inbound and outbound access to exactly that which is needed for it to
> operate. For example, an simple web server should allow only new incoming
> conns to ports HTTP and HTTPS from internet; they should block new outgoing
> conns (since a simple web server only serves data over existing conns).
> Management ports, like ssh, should be limited to the least reasonable set of
> addresses expected. Periodic audits should show if these limits have been
> altered. The server is its own first line of defense. The nearest firewall is
> the second line of defense. The perimeter firewall is the last line of
> defense.

Ok, it's a different approach than I usually take.

IMHO, the first level of security is a firewall and the second a IPS -
so, I can reduce the load processed by IPS (which makes analysis at a
high level - we are working with HP TippingPoint IPS). Servers are
entities that need protecting. We have more than 300 servers. In my
opinion, it would be impractical to manage otherwise. The firewall
rules can't protect a web server of an exploit, but a IPS can.

It is quite likely that the firewall rules on the server does not make
much difference if the service is compromised.
But it's only my opinion.
