From: Gerardo Fernandez <gfhgfh@gmail.com>
Subject: Re: Windows/NetBIOS & SNAT
Date: Mon, 7 Sep 2009 00:01:55 +0200
Message-ID: <8ed551510909061501v5a2812d0sd46efd3a5ec07904@mail.gmail.com>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=AuPEfXcrR7HG6OTpFJ+79APEanrNnwz9FgdoaDayMEo=;
        b=Lx7VVOSSYoQFpB3+Y4nt/rWIlI1892Gnr3Np+3If/cQKgC38ifDKDda6bAwV2MCqpN
         orH5OYazgmyO2MzqYvHIsnUhquy+LTlb0YwtB4n1W0GMbbqPNP2R7LVVRuz2tNiwsG3V
         G3aQwRXyarszYfm1Sb7wHAE37Hm/S6MxqRgc0=
In-Reply-To: <651562.95010.qm@web33406.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

2009/9/4 Nicholas Couchman <nick.couchman@yahoo.com>:
> I've done quite a bit of Google searching and haven't turned up anything definitive hear.  I have a few Windows XP machines that I want to put behind a Linux/iptables NAT configuration.  The domain controllers and WINS servers sit outside the NAT configuration.  On the Linux side, I've enabled ip forwarding, and added the following rule with iptables:
>
> iptables -t nat -A POSTROUTING -s 172.16.34.0/24 -j SNAT --to-source 192.168.100.100
>
> However, I'm getting the following error when trying to log on to Windows:
> The system cannot log you on now because the domain DOMAIN is not
> available.

In an environment almost equal to yours, without doing any packet
tracing, we've found that some XPs (I would say that just the first 3
or 4) can logon in the domain, but there is a point where noone else
can logon.

The only difference with your setup is the fact that we don't use a
WINS server.

--
Saludos.
Gerardo.
http://www.AjedrezVasco.com
