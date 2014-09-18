From: "R. Sterenborg (lists)" <lists@sterenborg.org>
Subject: Re: Can IPTables check for a valid IP address
Date: Thu, 18 Sep 2014 17:11:36 +0200
Message-ID: <541AF628.8090509@sterenborg.org>
References: <D4669F1AE5CE3D4293C4658A698E502904B637068E4C@SELENIUM.amity.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D4669F1AE5CE3D4293C4658A698E502904B637068E4C@SELENIUM.amity.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lars Dam <l.p.dam@amity.nl>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On 09/18/2014 03:50 PM, Lars Dam wrote:
> We suffer from DNS lookups with a response IP address which is not existing.
>
> Can Iptables check on this?

What is it you actually want iptables to do? Do you want it to check if 
the IP address that the DNS server responds with exists and is in use? 
Or..? Maybe the DNS server should be fixed instead of trying to go this way.

Iptables (well, Netfilter) is a packet filter. You can filter packets 
that match a rule that you define. It can't validate your DNS server's 
output.


--
Rob




> Regards,
>
> Lars Dam
> Manager ICT services							
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

