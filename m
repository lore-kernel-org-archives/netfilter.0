From: Andrew Beverley <andy@andybev.com>
Subject: Re: IPTable Rules... again
Date: Thu, 08 Mar 2012 17:29:53 +0000
Message-ID: <1331227793.30413.438.camel@andrew-desktop>
References: <20120308151651.300950@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120308151651.300950@gmx.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1331227797;
	bh=6+zZgbfBWesY3iumv+YuWiBF29EyTtcIy6o+kyP1k3M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=EoPdzXsckcnnLcdmaPG1+nCQxaArXARVPG4ea+kmdvOnKgGHAibFByftIU9/UHk+s
	 zz63jNmKSzXD6MQQwWe+OTU9rT0oNeHgJVB3hbAL0J/vb4ubzeR64OcUhmiuVTDWIP
	 vHtH2fJOcEZnSy+QNEGLJ3rg77moxjpdlvVN325Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nullv@gmx.com
Cc: users@lists.fedoraproject.org, netfilter@vger.kernel.org

On Thu, 2012-03-08 at 10:16 -0500, nullv@gmx.com wrote:
> Hi,
> 
> I have the following  rules on my router/gateway: 
> 
> *nat
> :PREROUTING ACCEPT 
> :INPUT ACCEPT 
> :OUTPUT ACCEPT 
> :POSTROUTING ACCEPT 
> -A POSTROUTING -d 93.186.25.52/32 -m comment --comment "bb" -j SNAT --to-source 41.94.39.49-41.94.39.51

> -A POSTROUTING -s 10.0.0.0/8 -p tcp -m tcp --dport 53 -m comment
> --comment "domain" o eth0 -j SNAT --to-source 41.94.39.49-41.94.39.51

                    ^^^^ Is this what you really have? Or is it a typo
in your email? Obviously it should be "-o" not "o"

> -A POSTROUTING -s 10.0.0.3/32 -j o eth0 -j SNAT --to-source
> 41.94.39.49-41.94.39.51

Have you tried removing all the other SNAT lines apart from this one?
And also seeing if this is definitely matching by setting a LOG target
first?

<snip>

> -A FORWARD -j REJECT --reject-with icmp-host-prohibited

Does it work if you remove this line?

Everything else looks fine to me, assuming that all your IP addresses
etc. are correct.

Andy


