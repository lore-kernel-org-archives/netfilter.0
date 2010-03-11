From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Update delay when using nat table?
Date: Thu, 11 Mar 2010 22:59:01 +0100
Message-ID: <4B9967A5.3070005@chello.at>
References: <09084388150B46A2B74F745A8E1272DA@main> <2122a8b921764fb70003e1215e6e38e0@thom.fr.eu.org> <383286BAD7464B6296AB3157C21B3C99@main> <967e5777d730e5c39389a4e554144099@thom.fr.eu.org> <67C8429999B648F983EB141D7A928400@main>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <67C8429999B648F983EB141D7A928400@main>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 11.03.2010 19:41, netfilter-owner@vger.kernel.org wrote:
> ipset looks intresting but I've no experience of patching the kernel. I
> did run an aptitude install ipset.
> 
> ipset -H
> I'm of protocol version 2.
> Kernel module is not loaded in, cannot verify kernel version.
> ipset v2.5.0
> ...
> 
> What needs to be done here? I've tried googling around but there's not
> that much information available.
> 

Please switch to bottom posting...

If on debian, you may need to install netfilter-extensions-modules.

Mart
