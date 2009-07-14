From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 14:30:28 +0200
Message-ID: <1247574628.30915.35.camel@enterprise.ims-firmen.de>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
	 <1247558286.7214.16.camel@TestField.intranet.bem.md>
	 <4A5C4EFE.7000700@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A5C4EFE.7000700@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, 2009-07-14 at 11:25 +0200, Mart Frauenlob wrote:
> >   
> Remember for the POSTROUTING rule, the previously redirected packets 
> come from the host:port, NOT go to the host again.
> You need `-s xxx.xxx.xxx.xxx --sport xx' -j SNAT ....

DNAT rewrites the destination IP and Port, so in the POSTROUTING
table the TCP SYN packets should look like:

    <Orig-Src-IP, Orig-Src-Port, DNAT-Dst-IP, DNAT-Dst-Port>

right?

