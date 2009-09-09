From: Nicholas Couchman <nick.couchman@yahoo.com>
Subject: Re: Windows/NetBIOS & SNAT
Date: Tue, 8 Sep 2009 17:54:42 -0700 (PDT)
Message-ID: <235149.15070.qm@web33406.mail.mud.yahoo.com>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com> <8ed551510909061501v5a2812d0sd46efd3a5ec07904@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1252457682; bh=Kj+gEEX1WQeLd1LmnE6+oMdn2lohwwJLvFBlJVUHhDU=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=BkYrEpIpjIb+n6EImicXBGrfX/W9U7skYKKMyn7AQkL+tovt8cE5qpWQmnfb+Sig+CD8SinS6Z/K48tboZk6LvpFPeVj29+T4wh8psZ0gJATF53rAH/smj+6GRLSPwe3Xuucqjlu84rEF6ewR8KSeBU1a0x6bLVVRtpiKjrQNx4=
In-Reply-To: <8ed551510909061501v5a2812d0sd46efd3a5ec07904@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gerardo Fernandez <gfhgfh@gmail.com>, netfilter@vger.kernel.org

-Sigh- Well, Microsoft has done it, again.  I think I've finally located the problem, and the solution is going to be a bit more difficult - maybe impossible - for SNAT to handle (I think).  I was doing some packet sniffing and noticed that I was not getting any attempts to reply to messages sent on port 138 for my machines by my NAT router.  I started looking into the packets, and, guess what?  On NetBIOS datagram packets (port 138), Microsoft has decided to embed the IP address of the original requesting machine in the packet, rather than just using the information already on the IP header.  I'm guessing they did this to try to make an already unsecure protocol a bit more secure, but it is defeating the SNAT'ing I'm trying to do on my network.  In looking at the packet in Wireshark, the 
 "NetBIOS Datagram Service" portion of the packet has Source IP and Source Port fields.  So, in addition to standard NAT'ing, I'm going to have to "mangle" these fields
 in the packet, too.  I'm not even sure that's possible, even in a connection tracking helper module - any hints would be greatly appreciated.

-Nick

