From: Joelly Alexander <alex@joelly.net>
Subject: Re: unable to source and destination nat at the same time on multi-homed
 server
Date: Wed, 10 Nov 2010 23:33:50 +0100
Message-ID: <4CDB1DCE.7090409@joelly.net>
References: <4CD6C4C6.3050508@joelly.net> <4CD6CF5B.2030606@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CD6CF5B.2030606@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On 07.11.2010 17:10, Pascal Hambourg wrote:does anyone know a way to 
solve this
> You can mark the packets (-j MARK) or the connection (-j CONNMARK) in
> mangle/OUTPUT before DNAT, and match the packet mark (-m mark) or
> connection mark (-m connmark) in nat/POSTROUTING.
>
> Or you can use -m conntrack --ctorigdst to match the original
> destination address.
>
After playing around some time to see how to use and how it works - it 
does exactly what i need

Thanks
