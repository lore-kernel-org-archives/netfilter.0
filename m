From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Tue, 14 Feb 2012 23:41:06 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1202142332470.22503@aurora.sdinet.de>
References: <28509660.3204.1329242724424.JavaMail.root@ixer.mx>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <28509660.3204.1329242724424.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Cc: SamLT <sam@sltosis.org>, netfilter@vger.kernel.org, Andrew Beverley <andy@andybev.com>

On Tue, 14 Feb 2012, Enrique Huerta de la Fuente wrote:

> The problem is that the MASQUERADE rule does not work with UDP(1195).
>     
> Any idea?

One thing to check out, took me a whole day to figure out with openvpn 
udp traffic to port 1194 not beeing masqueraded in some "random" cases:

Does the connection to your port 1195 exist before the filewall rulesets 
are loaded first after boot? - one packet before the rule setup may be 
enough. Once a connection with the same sip+sport+dip+dport has been 
added to the conntrack list their masquerading/SNAT/DNAT state is not 
changed again - and with the "virtual" udp connection they can stay 
alive quite a while.

Perhaps try just flushing the whole connection-tracking table and see if 
it starts working afterwards:

conntrack -F conntrack ; conntrack -F expect

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
