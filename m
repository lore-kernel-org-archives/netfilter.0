From: "Joey" <Joey@Web56.net>
Subject: Help with whitelist
Date: Wed, 11 Mar 2009 14:21:29 -0400
Message-ID: <000301c9a276$33669010$9a33b030$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: IPTables <netfilter@vger.kernel.org>

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

 

 

 



