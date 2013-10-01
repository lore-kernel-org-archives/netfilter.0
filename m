From: John Lister <john.lister@kickstone.com>
Subject: Re: statistic mode / every nth / packet problem
Date: Tue, 1 Oct 2013 14:17:54 +0100
Message-ID: <1AE30C65-10FF-4A65-B007-C1865F473E6D@kickstone.com>
References: <1380632533.32003.YahooMailNeo@web162406.mail.bf1.yahoo.com>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kickstone.com; s=mail;
	h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type; bh=ybISUspsKtx+JHfVIXYI2taqa4aW6KXF3FXUUWLTDy4=;
	b=kU1PXqx97Uh0wPXTgMmzn7/XAKfEOc3WsfcKXV/n6jAKnAZXn0oKq7A1Z/C/d16COwYsmxLtNr5IRE3CguZIA7dem7G2eoTI2V51TzIWkemCCuV5J+P0oV0NxKuJGJJY;
In-Reply-To: <1380632533.32003.YahooMailNeo@web162406.mail.bf1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tristen <tristen_e@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

The stats filters work at a rule level, so you need to decrease the every count by 1 each time and have packet = 0.The first rule is called 1 in 5 times, so the second rule only needs to be called 1 in 4, catches most people out unfortunately.

giving
iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 0 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 4 --packet 0 -j REDIRECT --to-port 8081
iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 3 --packet 0 -j REDIRECT --to-port 8082
and so on


John
On 1 Oct 2013, at 14:02, tristen <tristen_e@yahoo.com> wrote:

> hello
> 
> i have a situation where i want to round-robin new http connections to different ports, but i'm finding that the following is resulting in a significant amount "falling through" to my catch-all on port 9000, rather than being evenly distributed across 8080-8084.
> 
> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -P INPUT ACCEPT
> iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 0 -j REDIRECT --to-port 8080
> iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 1 -j REDIRECT --to-port 8081
> iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 2 -j REDIRECT --to-port 8082
> iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 3 -j REDIRECT --to-port 8083
> iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 4 -j REDIRECT --to-port 8084
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 9000
> 
> it's about 80-20, where 80% are evenly distributed amongst 8080-8084 and 20% are winding up on 9000.
> 
> i'd prefer 100% evenly distributed on 8080-8084 and none on 9000. i put 9000 there as a catch-all "hack" because i found connections were failing to be caught by the 8080-8084 range.
> 
> any help would be really appreciated, thank you in advance!
> 
> tristen
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

