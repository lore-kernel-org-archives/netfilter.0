From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables - external IP address on internal interface?
Date: Thu, 14 Apr 2011 21:24:49 +0100
Message-ID: <1302812689.4938.46.camel@andybev-desktop>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
	 <1302544375.1551.11.camel@andybev>
	 <054F5B1BB94BD943B243C3B39B4F568D016E42F1@victory.Erudine.local>
	 <1302626146.4938.1.camel@andybev-desktop>
	 <054F5B1BB94BD943B243C3B39B4F568D0161B8F7@victory.Erudine.local>
	 <1302636161.4938.5.camel@andybev-desktop>  <4DA4C61A.4070308@erudine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1302812689; bh=YPJfy5pdFJSTexxXizokoxyPh7CXCQi1cjnR2
	dJnKj0=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=Vdu8TCOw
	p628WBaTIa/wXj8ATfHiQO8Ke3X1gk+8jF5ZaH0iMtenXWcOXeZS4tBW9HHN49XTd7F
	REz6Ft7N7pQDQzUqCLN22EH7dhZ3CZzpidUPyyPVvp9WQt/WRZFp3vVF4V+eO6Y244M
	Z5gSAqrHEgvd7h5K5UevG6hMeP7T8=
In-Reply-To: <4DA4C61A.4070308@erudine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tony Rogers <tony.rogers@erudine.com>
Cc: netfilter@vger.kernel.org


> Ok, trying with Thunderbird this time... (and it too seems to be 
> wrapping the text) <sigh>
> 

Not sure about Thunderbird, but Evolution has a "preformat" option that
doesn't wrap the text.

Anyway, back to the original subject, can you post the output from
"iptables-save" instead, as this has additional detail such as the
interfaces in the rules.

As a thought before you do so, if you're doing NAT in the normal way to
share an internet connection, then what you are seeing is to be
expected. You would normally SNAT on the internet-facing interface, not
on the LAN-facing interface, meaning that traffic on the LAN interface
will be going from/to public IP addresses.

Andy


