From: Abraham van der Merwe <abz@frogfoot.net>
Subject: Re: how to match connection tracker's flows?
Date: Thu, 4 Nov 2004 10:46:58 +0200
Message-ID: <20041104084658.GA14605@oasis.frogfoot.net>
References: <20041103181718.GA16850@oasis.frogfoot.net>
	<1099508868.24863.8.camel@porky>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1099508868.24863.8.camel@porky>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Eric                                          >@2004.11.03_21:07:48_+0200

> > If I add
> > 
> > # rules to track ftp
> > iptables -t mangle -A POSTROUTING -p tcp -j CONNMARK --restore-mark
> > iptables -t mangle -A POSTROUTING -p tcp -m mark ! --mark 0 -j RETURN
> 
> If packet are marked they return so leave mangle, so if CONNMARK works
> leave mangle.
> 
> > # a rule to see how much ftp traffic is matched
> > iptables -t mangle -A POSTROUTING -m mark --mark 2
> 
> This line is never reached if CONNMARK works.

Ok, sorry I didn't paste the real commands. It is actually:

# rules to send all traffic to user-defined chain
iptables -t mangle -N TRACK
iptables -t mangle -A POSTROUTING -j TRACK

# a rule to see how much ftp traffic is matched
iptables -t mangle -A POSTROUTING -m mark --mark 2

# rules to track ftp
iptables -t mangle -A TRACK -p tcp -j CONNMARK --restore-mark
iptables -t mangle -A TRACK -p tcp -m mark ! --mark 0 -j RETURN
iptables -t mangle -A TRACK -p tcp --dport 21 -j MARK --set-mark 2
iptables -t mangle -A TRACK -j CONNMARK --save-mark

In other words, it returns from a user-defined chain and the mark is in the
top level chain and will always be matched.

With above, it doesn't match all the ftp traffic. It definitely matches
some, but I think it is just the port 21 traffic, not the port 20 (ftp-data)
stuff which should be picked up by the connection tracking.

I also tried a derivative of above scheme which doesn't work properly either:

iptables -t mangle -A POSTROUTING -p tcp --dport 21 \
	-m state --state NEW,ESTABLISHED,RELATED -j MARK --set-mark 2
iptables -t mangle -A POSTROUTING -m mark --mark 2

Above rule have pretty much the same effect.

-- 

Regards
 Abraham

TODAY the Pond!
TOMORROW the World!
                -- Frogs (1972)

___________________________________________________
 Abraham vd Merwe - Frogfoot Networks CC
 1st Floor, Albion Springs, 183 Main Road, Newlands
 Phone: +27 21 689 3876 Cell: +27 82 565 4451
 Http: http://www.frogfoot.net/ Email: abz@frogfoot.net


