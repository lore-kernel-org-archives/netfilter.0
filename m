From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Strange behaviour of REDIRECT/ipt_recent
Date: Fri, 23 Sep 2005 07:55:15 -0500
Message-ID: <200509230755.21161.rob0@gmx.co.uk>
References: <20050922211815.GA3701@diesel.geggus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050922211815.GA3701@diesel.geggus.net>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org
Cc: Sven Geggus <sven@gegg.us>

On Thursday 22 September 2005 16:18, Sven Geggus wrote:
> the following rule works fine so far
> (redirect any connection to a given IP to Port 22):
>
> iptables -t nat -A PREROUTING  -p tcp ! --dport 22 -d $SSHIP -j \
> REDIRECT --to-port 22
>
> But now I need to restrict Connections to 3 accesses per minute to
> prevent DOS-Attacken by means of Portscans:
>
> iptables -A INPUT -i eth0 -p tcp -d $SSHIP -m state --state NEW \
> -m recent --set --name SSH

You changed the destination IP in the REDIRECT rule. I can only guess 
that $SSHIP is not the primary IP of eth0.

> I suspect that the redirect rule may change the destination IP to the
> default IP of eth0, but I would consider this to be a bug.

Why guess? From "man iptables":
   REDIRECT
      ...redirects the packet to the machine itself by changing
      the destination IP to the primary address of the incoming
      interface  (locally-generated  packets are mapped  to the
      127.0.0.1 address).

You're getting the intended (documented) behaviour. Perhaps you will 
want to mangle/MARK these packets before REDIRECT.

This whole exercise seems odd to me. Why force all TCP into one port? 
Your sshd is sure to complain about all the non-SSH protocol traffic 
it's getting. </dev/lightbulb comes on> Are you trying to ssh from 
sites with brain-dead restrictive firewalls? And you don't know in 
advance which ports they might allow out?

If so I see the sense in it. Consider, however, the possibility that 
these sites are allowing NO direct traffic out. It is possible to 
create the illusion of Internet access by using proxy servers. Their 
proxy won't handle your SSH.

Have you talked to the site administrator[s]? I know, most of them 
wouldn't know what you're talking about, and you would frighten them. 
But, you seem to be deliberately doing something which goes against 
their security policy. If you hit their proxy servers with your SSH 
traffic, they might come seeking YOU.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

