From: Jon Wilson <lists@erentil.net>
Subject: Re: Filtering by Mac Address
Date: Wed, 13 Feb 2008 19:55:11 -0700
Message-ID: <47B3AD8F.6090704@erentil.net>
References: <63D06BD7-145A-4A49-8E64-D91C813B987F@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <63D06BD7-145A-4A49-8E64-D91C813B987F@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cupertino Miranda <philfine@gmail.com>
Cc: netfilter@vger.kernel.org

Cupertino Miranda wrote:
> Hello everyone,
> 
> For one of my current hackings I need to construct the following network 
> rules.
> 
> I need to disable internet access to all the local network hosts by 
> redirecting them the my webserver (allowing to show some web page in 
> case of http connection).
> Enable internet access by mac address to some of this hosts.
> 
> I have currently general NAT rules in gateway machine.
> 
> Can someone provide me some details how can I do it.
> 
> Thanks a lot
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
this is the shell script I wrote for wireless user authentication.

uses prerouting default drop policy to limit to dns and redirect 
http/https traffic.  apache instance redirects everything coming in to 
auth page, can run the shell script

firewall.sh add 00:01:02:03:04:05

to add the mac to allowed range.

should give you what you need.

http://erentil.net/wiki/iptables/auth/

-- 
Jon Wilson
