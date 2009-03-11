From: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Subject: RE: Help with whitelist
Date: Wed, 11 Mar 2009 22:22:38 +0300
Message-ID: <000401c9a27e$c05959f0$410c0dd0$@ath.cx>
References: <000301c9a276$33669010$9a33b030$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000301c9a276$33669010$9a33b030$@net>
Content-Language: ru
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Joey' <Joey@Web56.net>, 'IPTables' <netfilter@vger.kernel.org>

You seem to have lots of entries in your lists. Did you consider using ipset?

As for the question. Look at iptables -L. Fail2ban adds it's rules to the head of the INPUT chain of the filter table by default, so it's rules trigger before whitelist.


-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Joey
Sent: Wednesday, March 11, 2009 9:21 PM
To: IPTables
Subject: Help with whitelist

Hello All,

 

Im having a problem with a whitelist I am trying to implement with iptables
and apparently we still block IP's on the whitelist.

I am basically blocking port 25 traffic to blocked IP's but also need to
whitelist some as well insuring they never get blocked by accident.

I have my iptables rules posted here: http://web56.net/iptables.txt

 

We also use fail2ban which blocks other IP's which fail password, so my
whitelist is to hopefully protect against false bocking of legit clients.

 

I must be missing something stupid, but I just cant see it.

 

Any help is greatly appreciated!

 

Thanks!

 

 

 



--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

