From: Tim Mooney <Tim.Mooney@ndsu.edu>
Subject: Re: converting iptables/ip6tables to efficient nftables rules
Date: Wed, 2 Aug 2023 13:37:53 -0500 (CDT)
Message-ID: <835ec4a-548f-783-937f-4c3b4520eb7f__7307.61054889939$1691002493$gmane$org@ndsu.edu>
References: <924b35f-bda5-6ae5-efe-d05a8de7aec@ndsu.edu> <20230730221447.af1b866bdddfe794be4d9b47@plushkava.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20230730221447.af1b866bdddfe794be4d9b47@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org

In regard to: Re: converting iptables/ip6tables to efficient nftables...:

>> Similarly, all of the rules list CIDR ranges or individual IPs, though
>> there are a mix of IPv4 and IPv6 ranges.  I therefore could greatly reduce
>> the number of rules by creating a couple of named sets, one for IPv4 and
>> one for IPv6, and match the 'ip saddr' against the sets.
>
> You are definitely on the right track. Maps and/or verdict maps
> incorporating concatenations of the form "ipv4_addr . inet_service" and
> "ipv6_addr . inet_service" might also prove useful, depending on your
> exact requirements.
>

Thanks Kerin!

I really appreciate you taking the time to reply.  It was very helpful.

Cheers!

Tim
-- 
Tim Mooney                                             Tim.Mooney@ndsu.edu
Enterprise Computing & Infrastructure /
Division of Information Technology    /                701-231-1076 (Voice)
North Dakota State University, Fargo, ND 58105-5164
