From: Franck JONCOURT <franck.mail@dthconnex.com>
Subject: Re: CONNMARK and ip rule fwmark
Date: Sun, 30 Mar 2008 13:23:10 +0200
Message-ID: <bd29d6543567ecfd7c483671f163d14e@localhost>
References: <046B6BE8F9E1409CAF96941CED215BD0@shs1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <046B6BE8F9E1409CAF96941CED215BD0@shs1>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


On Sun, 30 Mar 2008 13:03:09 +0200, "Steffen Heil" <lists@steffen-heil.de>

wrote:

> Hi



Hi,



> I want every reply packet belonging to every connection made through tun1

> to

> be send back through tun1 (not being the default gateway tough).

> (tun1 is P-t-P, so there is no routing nessessary.)

> 

> I tried the following:

> 

> # iptables -t mangle -A PREROUTING -i tun1 -p tcp --syn -j CONNMARK

> --set-mark 71

> # iptables -t mangle -A OUTPUT -p tcp -m connmark --mark 71 -j MARK

> --set-mark 71



What about using the nat table to add your mark on a whole connection 

instead of using the mangle table ?



[...]

No idea about that :p!



---

Franck Joncourt

http://www.debian.org/ - http://smhteam.info/wiki/



