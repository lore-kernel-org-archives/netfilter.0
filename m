From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: Trying to setup two ethernet cards with two websites
Date: Fri, 3 Jan 2003 13:23:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2762500A-1F16-11D7-97EA-000393950CC2@karlsbakk.net>
References: <200301021021.07838.netfilter@newkirk.us>
Mime-Version: 1.0 (Apple Message framework v548)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301021021.07838.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@newkirk.us
Cc: JUSTIN GERRY <JGERRY@butchers.com>, netfilter@lists.netfilter.org

> If you trust that nothing on the box is or ever will connect that you
> don't want to, then output chain can just have an ACCEPT policy.  If 
> you
> want to lock down to make it harder for a trojan or such to communicate
> back from the box, you can set a DROP policy, then:
>
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

just remember to allow incoming ICMP. Please? ICMP _is_ an integral 
part of IP, and shouldn't be blocked out!
You can do

iptables -I INPUT -p icmp -j REJECT --reject-with echo-reply

to answer all pings to hosts behind with echo reply (just fake it) in 
case you're afraid of anyone scanning you.

you might add a -limit as well to prevent them DoSing you (man iptables)

roy

> will let traffic back out in response to client requests, but not let 
> the
> box initiate any connections.  If this tighter firewall still allows 
> the
> needed connections, why open up any further?  I'd suggest you might 
> want
> to log dropped output traffic, though, to see what DOES try to get out.
> Depending on your usage and plans, you might want to open a few
> outbounds, like traceroute, ping, CVS, http, or ftp access FROM the box
> if you want to use these services when logged into the box, for 
> updating
> software etc.  Of course you can just allow those connections when
> needed, and the rest of the time go with DROP policy and the EST/REL
> rule above.
>
> j
>
>


