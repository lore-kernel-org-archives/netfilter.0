From: Franck JONCOURT <franck.mail@dthconnex.com>
Subject: Re: CONNMARK and ip rule fwmark
Date: Sun, 30 Mar 2008 17:08:15 +0200
Message-ID: <b0b02c5e06bacc73c248fd89cc14a159@localhost>
References: <alpine.LNX.1.10.0803301648110.28605@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0803301648110.28605@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


[...]

>> What about using the nat table to add your mark on a whole connection

>> instead of using the mangle table ?

> 

> Using the nat table to 'simulate' -m conntrack --ctstate NEW, that's

> just a gross hack IMO. Oh and as soon as you start using IPv6,

> there is no nat, so do not even think of doing it :p



Ok, thanks for your point of view I did not think about that.

I am going to change some stuff :)!



---

Franck Joncourt

http://www.debian.org/ - http://smhteam.info/wiki/



