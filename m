From: "Dennis J." <dennisml@conversis.de>
Subject: Re: [ANNOUNCE] Release of iptables-1.4.3.2
Date: Mon, 06 Apr 2009 16:18:49 +0200
Message-ID: <49DA0F49.4090802@conversis.de>
References: <49D9E9A6.7010303@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49D9E9A6.7010303@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

On 04/06/2009 01:38 PM, Pablo Neira Ayuso wrote:
> The netfilter coreteam presents:
>
>       iptables version 1.4.3.2
>
> the iptables release for the 2.6.29 kernel. This version includes
> accumulated bugfixes for the previous release from Jan Engelhardt and
> Peter Volkov. Check the Changelog file for more details.
>
> Remember that iptables>= 1.4.3 starts enforcing the deprecation of NAT
> filtering that was added in 1.4.2-rc1, filtering rules in the NAT tables
> will cause an error instead of a warning from now on. Please make sure
> your rulesets are update appropriately.

What does "deprecation of NAT filtering" entail exactly? I checked the 
release notes for 1.4.2-rc1 but couldn't find any reference to that and I 
wasn't lucky searching the devel mailinglist either.

Regards,
   Dennis
