From: Simion Onea <simionea@gmail.com>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 15:20:25 +0300
Message-ID: <1247574025.7214.36.camel@TestField.intranet.bem.md>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
	 <1247558286.7214.16.camel@TestField.intranet.bem.md>
	 <4A5C4EFE.7000700@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:in-reply-to
         :references:content-type:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=9LpD8RZTpXNZv6ggerDAydGbXy9NubeVYV1CEFbSzzA=;
        b=i3qHsfTeMYTnHU5vNFGojXDWUdoj58toqW+KkA8ogKbp/StKWm73su8iRT3HV1i8qE
         bDKBbFTol5RQU9v9SpA8sxgFQ08AxD5vFGsK/IRxoQ8DmGQskHs1qUOM+S0Z7hhf0MQF
         ToC64HHH2zrJEbVfYDqHGZ7TF/G7Myw6IEHyc=
In-Reply-To: <4A5C4EFE.7000700@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, 2009-07-14 at 11:25 +0200, Mart Frauenlob wrote:
> Remember for the POSTROUTING rule, the previously redirected packets 
> come from the host:port, NOT go to the host again.
> You need `-s xxx.xxx.xxx.xxx --sport xx' -j SNAT ....

Hi Mart!

But this rule is for the packets leaving host 172.20.1.245 not for the
packets coming back from 172.20.1.254.
The first rule changes packets' destination address and port (DNAT) so
that they go to the other host. And the second rule changes packets'
source address (SNAT) so that the other host returns the packets back to
this host (172.20.1.245) not to the originating host from the LAN
(172.20.1.xxx).
When the packets return back from 172.20.1.254 to 172.20.1.245 the
kernel it is supposed to recognize that these packets were previously
DNAT-ed and SNAT-ed and to reverse back their source and destination
addresses and send them back to the originating host from the LAN
(172.20.1.xxx).
This is the way I understand the process.

Regards,
Simion.


