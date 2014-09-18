From: Lars Dam <l.p.dam@amity.nl>
Subject: RE: Can IPTables check for a valid IP address
Date: Thu, 18 Sep 2014 17:19:37 +0200
Message-ID: <D4669F1AE5CE3D4293C4658A698E502904B637068E4E@SELENIUM.amity.local>
References: <D4669F1AE5CE3D4293C4658A698E502904B637068E4C@SELENIUM.amity.local>
 <541AF628.8090509@sterenborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <541AF628.8090509@sterenborg.org>
Content-Language: nl-NL
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "R. Sterenborg (lists)" <lists@sterenborg.org>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hi Rob,

Sure thing! I was just looking for a workaround.

I was looking for a way iptables might check if it's a valid (in function) IP address, before a DNS server is handling the request.
Regards

-----Oorspronkelijk bericht-----
Van: R. Sterenborg (lists) [mailto:lists@sterenborg.org] 
Verzonden: Thursday, September 18, 2014 5:12 PM
Aan: Lars Dam; 'netfilter@vger.kernel.org'
Onderwerp: Re: Can IPTables check for a valid IP address

On 09/18/2014 03:50 PM, Lars Dam wrote:
> We suffer from DNS lookups with a response IP address which is not existing.
>
> Can Iptables check on this?

What is it you actually want iptables to do? Do you want it to check if the IP address that the DNS server responds with exists and is in use? 
Or..? Maybe the DNS server should be fixed instead of trying to go this way.

Iptables (well, Netfilter) is a packet filter. You can filter packets that match a rule that you define. It can't validate your DNS server's output.


--
Rob




> Regards,
>
> Lars Dam
> Manager ICT services							
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" 
> in the body of a message to majordomo@vger.kernel.org More majordomo 
> info at  http://vger.kernel.org/majordomo-info.html
>

