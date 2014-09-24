From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: advanced routing with NAT: returning UDP traffic
Date: Wed, 24 Sep 2014 15:38:26 +0300
Message-ID: <5422BB42.6040707@ngtech.co.il>
References: <1955116.aThXd60LEg@localhost.localdomain> <4623776.NNCmRlCAkc@localhost> <5422938E.2030104@plouf.fr.eu.org> <2942322.0b85jGZzF5@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <2942322.0b85jGZzF5@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Maarten Vanraes <maarten@ba.be>, Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On 09/24/2014 01:16 PM, Maarten Vanraes wrote:
> ok, thanks,
>
> so, this is why streaming/voip stuff will still have issues...
Yes indeed.
and I Meant conntrack and connmark...
VOIP and STREAMING are beasts!!!
There are modules which analyze them and also recognize them but you 
will need to enable them first.

The issue is not UDP by itself as you understand.
It's a well known issue with multi IP nat machines in ISPS.
In many cases a SIP proxy helps to fix couple things.
I haven't tried it yet but it seems like there are commercial products 
that implement these SIP proxy.

Eliezer
