From: Noino <mg8c1zu02@sneakemail.com>
Subject: Re: simple port translation on the localhost / local loopback
Date: Fri, 28 Mar 2008 15:15:41 +0100
Message-ID: <20080328141541.6BD98B850@sem.mel.teaser.net>
References: <20080327211643.B37CA78C86@gam.mel.teaser.net>
            <47ECC9EB.1000308@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47ECC9EB.1000308@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Pascal Hambourg wrote : 

> I confirm. On 2.6 kernels < 2.6.11 and 2.4 kernels < 2.4.29 this option 
> must be enabled in order to do local NAT on loopback.

Merci, Pascal; that would explain why I had so little success... 

Stll, is there a way to achieve local port redirection without that option 
set, maybe by combining DNAT, SNAT, REDIRECT in some astute way ? 

Does it make things easier if I arrange for Tor to listen on the IP 
associated with the ethernet adapter rather than localhost ? Or even listen 
on 0.0.0.0 ? 

Regards 

-- 
Noino

