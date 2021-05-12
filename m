From: "" <kfm@plushkava.net>
Subject: Re: Commas or Spaces?
Date: Wed, 12 May 2021 03:01:02 +0100
Message-ID: <0f84ccca-3ceb-2af6-9abe-d1923f495557@plushkava.net>
References: <521e0906-81f8-4885-2137-0dffc0fd9935.ref@att.net>
 <521e0906-81f8-4885-2137-0dffc0fd9935@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=p
        9ZScXRFbsbBXdTqNTTFyBXDYT/J0HzeqklDNo2zN5s=; b=SlQdo1GO2IP+DeRcY
        i+c+QA/lHA0wgnsHfhcy/l4bBFnuUOPxmouUd9dcfAJvt44aM3IxpjEmpQYzwgTj
        dbzar+ufhHegyWqnVvmU9C8ToE4q/Dtyz66JKGZqSxu3CHWlAmF4ftkKsYuEexOU
        GZCca41e85KUPI4yP2CJE2xfLbbnnWW6s/9RuMbrgXKek1eKr34mW0cFvfbUqdVa
        WqGrQWrZH2y9aHmAQrNoMUZVpxp0oe/7AYDwnv5REeCYTp/nNEL9ntB+nGt0MT7R
        CnXlb4RjOars5Ta9Rw+qNWPbUQnmQfOthMXqm650JSv4sTt9Xmyeith12n1wAt4d
        uYrEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=p9ZScXRFbsbBXdTqNTTFyBXDYT/J0HzeqklDNo2zN
        5s=; b=V3H/xYjHMZ8N30cqcHElFkjpSAddnEK/o98KGI+cWq+wXsP/+YayUKKGP
        y8xj6vSld09X05zHNnHPdL9w6B4LDs55U3+Hh3NvLn6Fn+CzArx3Go8hhlaTwD70
        jOhegHV7fsvEqZ8XFdDjZ/adUsSlGyRDZesSxFt0sjqkvjf0XN9IqN1gIPaKiTt+
        Fpiw1AsMpHiFtS4PJ0OhwFuwz4KYOHYFGuT/c+GEPjQ8TU+3eQ7vMC0WwoKcAPvH
        k/A9zBxCi61B2Q5Z3FvfZY256aLOzVyFO+EGZ91Usasn5rhRr9Egauqfz/tvv/O6
        FbxF0QNLZB8o6Egn+neG3gyHOJm+Q==
In-Reply-To: <521e0906-81f8-4885-2137-0dffc0fd9935@att.net>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: slow_speed@att.net, netfilter@vger.kernel.org

On 12/05/2021 01:50, slow_speed@att.net wrote:
> If a person creates an iptables or nftables rule, should multiple IP 
> addresses be separated by a comma or a space or both?
> 

Per the iptables(8) manual, the syntax of the -s and -d options is shown 
as follows, indicating that addresses may be separated only by a comma.

   [!] -s, --source address[/mask][,...]
   [!] -d, --destination address[/mask][,...]

However, it goes on to say that "multiple addresses can be specified, 
but this will expand to multiple rules". In other words, you cannot 
define a single rule that references an arbitrary set of addresses 
without using an extension. If that's what you need, consider the ipset 
extension.

On the other hand, nftables intrinsically supports both named and 
anonymous sets and is not subject to this limitation. For example, the 
following rule is a valid one and singular in nature.

   ip daddr { 8.8.8.8, 8.8.4.4 } accept

The space that follows the comma there is not required.

-- 
Kerin Millar
