From: "Sheepa" <sheepa@sheepa.org>
Subject: Re: Update delay when using nat table?
Date: Tue, 16 Mar 2010 18:15:13 +0100
Message-ID: <D81687727C1844B89F42B72243979CCE@main>
References: <09084388150B46A2B74F745A8E1272DA@main> <2122a8b921764fb70003e1215e6e38e0@thom.fr.eu.org> <383286BAD7464B6296AB3157C21B3C99@main> <967e5777d730e5c39389a4e554144099@thom.fr.eu.org> <67C8429999B648F983EB141D7A928400@main> <fb38a2c6c48a619cad79a09967062ef1@thom.fr.eu.org> <12BF43FAE6E84B42B79EC7FF3075058A@main> <4B9B4EF5.5010700@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

> if I remember correctly, you need the module-assistant package.
> then install the modules with:
>
> module-assistant prepare
> module-assistant auto-install netfilter-extension-modules
>
> I think that's how I did it on debian lenny.
>
> Best regards
>
> Mart
> --

----- Original Message ----- 
From: "Mart Frauenlob" <mart.frauenlob@chello.at>
To: <netfilter@vger.kernel.org>
Sent: Saturday, March 13, 2010 9:38 AM
Subject: Re: Update delay when using nat table?

module-assistant prepare returns:

The following packages have unmet dependencies:
linux-headers-2.6.30-2-686: Depends: linux-kbuild-2.6.30 but it is not 
installable.

Thanks,
Sheepa 
