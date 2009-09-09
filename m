From: Nicholas Couchman <nick.couchman@yahoo.com>
Subject: Re: Windows/NetBIOS & SNAT
Date: Wed, 9 Sep 2009 05:08:22 -0700 (PDT)
Message-ID: <413380.44233.qm@web33403.mail.mud.yahoo.com>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com> <8ed551510909061501v5a2812d0sd46efd3a5ec07904@mail.gmail.com> <235149.15070.qm@web33406.mail.mud.yahoo.com> <4AA761AE.2090603@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1252498102; bh=ofncfW5zJDfeILGUnztYe6eg1L0cVIMtDsKavYt/bN0=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=bWkM1Q3PjjQVWcxCfb8VQpRSyoQaTYYsvXVT2lbCjTlq9OHNE0+s9ErbftODaVhzBnHM1O9xXko4D161djpreo6igAyu/tsSW2Tmn5BLiCla8sw+XAGYYXPfCUPqcc4hXLiha2c0F/k1QQYL81Vtu1wnLKAY8p5jPqJJqYZSB4s=
In-Reply-To: <4AA761AE.2090603@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Hello,
> 
> I don't think it's possible what you want.
> The first thing a wins client needs to do is, to register itself in the wins database. Now if you exchange the ip headers and the data in the data fields, your wins server will get registration requests 
> from and for the same host over and over again. Even if that somehow works, your future queries will be messed up, as all answers of the wins server will point to the same ip address.
> 
> Regards
> 
> Mart

You may be right, but WINS is actually not the problem.  The WINS traffic (NetBIOS NS or NBNS) is done over port 137.  From what I can tell, this actually appears to be working okay - traffic is making it between the servers inside the NAT'd network and the WINS servers.  The traffic going over port 138, the NetBIOS Datagram Service, or NBDS, is what's the problem, because the NBDS frames have the IP address of the sending machine embedded in them in addition to the IP address in the IP header.  When an NT server replies to a NBDS request, it looks like it just ignores the IP header and uses the source IP and source port information embedded in the NBDS request.  So, you may be right that what I want to do is impossible, because it means mangling the actual NBDS request in addition the IP 
 header information, which I don't think can currently be done in Netfilter.  At best, I'm going to be writing some sort of application or module that does this - but
 I'm not even sure that will work, or that I'm really up to that challenge.

-Nick

