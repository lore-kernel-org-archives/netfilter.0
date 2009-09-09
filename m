From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Windows/NetBIOS & SNAT
Date: Wed, 09 Sep 2009 10:05:02 +0200
Message-ID: <4AA761AE.2090603@chello.at>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com> <8ed551510909061501v5a2812d0sd46efd3a5ec07904@mail.gmail.com> <235149.15070.qm@web33406.mail.mud.yahoo.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <235149.15070.qm@web33406.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Nicholas Couchman wrote:
> -Sigh- Well, Microsoft has done it, again.  I think I've finally located the problem, and the solution is going to be a bit more difficult - maybe impossible - for SNAT to handle (I think).  I was doing some packet sniffing and noticed that I was not getting any attempts to reply to messages sent on port 138 for my machines by my NAT router.  I started looking into the packets, and, guess what?  On NetBIOS datagram packets (port 138), Microsoft has decided to embed the IP address of the original requesting machine in the packet, rather than just using the information already on the IP header.  I'm guessing they did this to try to make an already unsecure protocol a bit more secure, but it is defeating the SNAT'ing I'm trying to do on my network.  In looking at the packet in Wireshark, th
 e "NetBIOS Datagram Service" portion of the packet has Source IP and Source Port fields.  So, in addition to standard NAT'ing, I'm going to have to "mangle" these fields
>  in the packet, too.  I'm not even sure that's possible, even in a connection tracking helper module - any hints would be greatly appreciated.
>
> -Nick
>   
Hello,

I don't think it's possible what you want.
The first thing a wins client needs to do is, to register itself in the 
wins database. Now if you exchange the ip headers and the data in the 
data fields, your wins server will get registration requests from and 
for the same host over and over again. Even if that somehow works, your 
future queries will be messed up, as all answers of the wins server will 
point to the same ip address.

Regards

Mart

