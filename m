From: "John Lister" <john.lister@kickstone.com>
Subject: Checking line status
Date: Wed, 2 Sep 2009 10:23:27 +0100
Message-ID: <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi, I have a multihomed machine to which i'd like to check the status of 
each line periodically. I want to do this so that I can modify the iptables 
rules and send new connections out over the active lines and restore service 
when the line comes back up.

I thought I could use ping with the -I option, but that doesn't seem to 
work, it always uses the default route. However if I get rid of the default 
route and modify the rules to match the packets I get a "network 
unreachable" message without it ever hitting iptables. For example adding 
something like this never gets matched for the ping.

iptables -t mangle -I OUTPUT -j LOG --log-prefix "output: "

Normally ping results in ICMP messages being traversed, but not this time.

Could someone explain what is going on and I'd be grateful if there were any 
suggestions on other ways to detect if a line is down - simply looking in 
/proc/net/dev or similar wouldn't help as the local connection is likely to 
be up, but the physical line to the ISP may be down.


Thanks

John 

