From: Maarten Vanraes <maarten@ba.be>
Subject: Re: advanced routing with NAT: returning UDP traffic
Date: Wed, 24 Sep 2014 14:52:51 +0200
Message-ID: <3545996.7GKZQHL5tP@localhost>
References: <1955116.aThXd60LEg@localhost.localdomain> <2942322.0b85jGZzF5@localhost> <5422BB42.6040707@ngtech.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5422BB42.6040707@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: Pascal Hambourg <pascal@plouf.fr.eu.org>, netfilter@vger.kernel.org

Op woensdag 24 september 2014 15:38:26 schreef Eliezer Croitoru:
> On 09/24/2014 01:16 PM, Maarten Vanraes wrote:
> > ok, thanks,
> > 
> > so, this is why streaming/voip stuff will still have issues...
> 
> Yes indeed.
> and I Meant conntrack and connmark...
> VOIP and STREAMING are beasts!!!
> There are modules which analyze them and also recognize them but you
> will need to enable them first.
> 
> The issue is not UDP by itself as you understand.
> It's a well known issue with multi IP nat machines in ISPS.
> In many cases a SIP proxy helps to fix couple things.
> I haven't tried it yet but it seems like there are commercial products
> that implement these SIP proxy.

i've used siproxd before... but it's limited, i could set up an asterisk in 
between, but that might be overkill and i'm not sure i could intercept it 
without configuring stuff on the other side...

what kind of modules do you know that help conntracking this kind of stuff?

and... what about ipv6 and multiple ISPs? (but without natting, but still no 
bgp or something), won't i still have the same problem?

Regards,

Maarten
-- 
BA NV
IT & Security
