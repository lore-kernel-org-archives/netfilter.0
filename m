From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Re: SNAT using the same internal address multiple times
Date: Wed, 06 Feb 2013 11:52:27 +0100
Message-ID: <1360147947.2455.0.camel@BEWS005.euractiv.com>
References: <738ED808-0B35-4645-9D73-3CB3B5CBC4D7@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-type:x-mailer:mime-version
         :content-transfer-encoding;
        bh=sDNXPWdb55u7YU8p407Pccd2IL8BgLKG/S4ATmBCGvQ=;
        b=P6qfM+2cdOODCL9PuqozqxC+ea5erIbZl4dCVHebauuYqrXNr1Q/SvB5+XDX06OyG6
         z+OS7DFuGRT8DWeIdMWV6xlFsT2pNb7xwlXideJuW4X+OE3t+RTpBxwiwAgYCvHL7vGc
         OWEArSjMhSNdQZa4y0W+oYPuZA3DMLIRmRSGpD+oN9aqJDWNXOboG2yhbxoW8fW3Qlm9
         AN+b3/Y2HXYSQJnHh6BUiJHwhCEwLSzdNAiz8++diO/vQubOGFQeRgcKMTuzFcGqxbwW
         BI1Vm+Ul0X5qm9Rf6ZLnp2UdZ4ZDSPwp++7EM3EkgXbZ0cichQmpDGgqmlt5NPyGWKPt
         YU/A==
In-Reply-To: <738ED808-0B35-4645-9D73-3CB3B5CBC4D7@alex.org.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Bligh <alex@alex.org.uk>
Cc: netfilter@vger.kernel.org

> Is it possible to use SNAT like this? (what I'm really asking is whether one can use the ingress interface as part of the NAT tuple):
> 
>                   LINUX
>    eth0 <-------- ROUTER ----------- 10.0.1.0/24
>                   \\\\\\\------------ 10.0.1.0/24
>                    \\\\\\------------ 10.0.1.0/24
>                     \\\\\------------ 10.0.1.0/24
>                      \\\\------------ 10.0.1.0/24
>                       \\\------------ 10.0.1.0/24
>                        \\------------ 10.0.1.0/24
>                         \------------ 10.0.1.0/24
> 
> Each private / internal address is the same on every interface. I plan to use
> unnumbered interfaces and proxy ARP at the linux level.
> 

Hi Alex,

I don't really get what you are trying to achieve. Can you detail a
little bit more?


Jimmy


