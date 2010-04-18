From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: can we design a modified fail2ban ?
Date: Sun, 18 Apr 2010 18:44:10 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004181841450.9840@obet.zrqbmnf.qr>
References: <4BC7E028.8050209@infoservices.in> <alpine.LSU.2.01.1004160923230.31861@obet.zrqbmnf.qr> <4BC9DB51.6000407@tana.it> <alpine.LSU.2.01.1004171956030.10627@obet.zrqbmnf.qr> <4BCB0D3C.3060006@tana.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BCB0D3C.3060006@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org


On Sunday 2010-04-18 15:46, Alessandro Vesely wrote:
>
> Correct. Browsing action.d/iptables.conf one finds

> actionban = iptables -I fail2ban-<name> 1 -s <ip> -j DROP
> actionunban = iptables -D fail2ban-<name> -s <ip> -j DROP
>
> I don't know whether fail2ban uses some other storage to remember frequently
> banned IPs.

If you are using iptables for actionban, it would not need to.
You can make use of iptables-save or ipset -S on shutdown.

> How would you compare iptables and netfilter?

Like you compare a tree with soil?

> I mean fail2ban actions versus looking up a b-tree file,

Where does that btree file come from, and what should it be useful for?

>in terms of rough
> memory consumption and responsiveness expectations? For the max number of
> entries, I reckon b-trees can allow to map the entire IPv4 address space
> within 1Tb of mass storage. But what might be the difference with usual
> volumes?
>

