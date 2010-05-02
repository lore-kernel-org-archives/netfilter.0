From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: What's going on with my iptables?
Date: Sat, 1 May 2010 22:05:17 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D1418C4DB5A90@HSSBS.holdstead.local>
References: <00bb152b4be1b49181900acf571ab85f.squirrel@webmail.vp44.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <00bb152b4be1b49181900acf571ab85f.squirrel@webmail.vp44.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'jknowlton@vp44.com'" <jknowlton@vp44.com>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> Now I can get it to work only by commenting out the last line (iptables
> -A INPUT -j DROP). But that defies the purpose of a firewall, doesn't
> it?
> What the heck happened last afternoon??
> 

Logging helps...

prior to the drop, do a log

iptables -A INPUT -j LOG --log-prefix "FW: "
iptables -A FORWARD -j LOG --log-prefix "FW: "
iptables -A OUTPUT -j LOG --log-prefix "FW: "

Then tail the log file and see what is hitting the drop rule.  From there, poke any additional holes necessary.


