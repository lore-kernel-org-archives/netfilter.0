From: Santiago Vila <sanvila@unex.es>
Subject: Re: iptables rules still working after being flushed (?)
Date: Sun, 15 Mar 2015 19:21:36 +0100
Message-ID: <20150315182136.GA16333@cantor.unex.es>
References: <alpine.DEB.2.11.1503151144110.8487@cantor.unex.es>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1503151144110.8487@cantor.unex.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Finally I found a likely explanation.

What I did: Put "exit 0" at the top of the firewall script and reboot.

I can ssh 30 times in a row from a nearby computer, but I still can't
do the same from my computer at home.

So this surely must be the result of some corporate firewall rule at
my Universiry which I can't control. Grrr.

Sorry for the false alarm.
