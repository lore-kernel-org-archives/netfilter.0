From: Simion Onea <simionea@gmail.com>
Subject: Re: Forwarding packets over the same LAN
Date: Wed, 15 Jul 2009 10:40:54 +0300
Message-ID: <1247643654.11785.6.camel@TestField.intranet.bem.md>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
	 <1247558286.7214.16.camel@TestField.intranet.bem.md>
	 <1247585686.1173.7.camel@enterprise.ims-firmen.de>
	 <e1ba8dde0907141201i5647546r78c2a66e24cad18f@mail.gmail.com>
	 <4A5D8626.6060002@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=Bb9nwwIsLYu+zCmxVPF0MA49mabFbAby2Z6i9abNBWI=;
        b=DCg54xtAc+NRwLirT+OOoVXNurafM3CgyrrFgMzv/cE1QZUn4aZaREm4KBCm+A0PDj
         T+pumAXsTLJNisUEV16h25xEXxdfADZE90zS9Qq2C3bJaLEYTJjUNodHZcj9kHHV5yMY
         pFCd1D2h7jP+UkAt9LJvMhi8Tkz+TwGBslbS8=
In-Reply-To: <4A5D8626.6060002@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Wed, 2009-07-15 at 09:32 +0200, Pascal Hambourg wrote:
> The INPUT chain is only for local delivery, forwarded traffic does not 
> go through it. So you do not need to accept inbound traffic to port 
> 10025 in the INPUT chain. You need to accept the return traffic in the 
> FORWARD chain.
> 
> If the TRACE target is not available, you can insert rules with the LOG 
> target at the beginning of each table/chain. You can also use a packet 
> sniffer such as tcpdump or wireshark to watch the traffic at each interface.

Hi Pascal!

I finally managed to set it up correctly. The problem was with another
rule blocking traffic to port 25.

Thank you!

Regards,
Simion.


