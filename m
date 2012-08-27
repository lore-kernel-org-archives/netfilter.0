From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: ssh configuration issue / doubt
Date: Mon, 27 Aug 2012 14:12:07 -0400
Message-ID: <201208271412.07979.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday, August 27, 2012 03:51:05 PM Net Warrior wrote:
> Hi there.
> I've got a simple question regarding ssh configuration.
> Reading the documentation and googling, It seems that to enable ssh is
> the simple thing in the world, I've got this.
> 
>  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
>         --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
> 
> With this rule I can connec to the machine, so far so good, now if I
> want to do scp or to scp to another machine I get blocked,
> I permit ALL the output chain.
> 
> The only way I'm able to do ssh to another host or do scp is by adding this
> 
>  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
>         --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

That is almost perfect and works.

Pedantically, the following shows how to allow SSH conns in and out regardless 
of later chains, rules and policies. They should illustrate why you need your 
second rule (to wit, you must address packets in both directions).

  # These two rules address external connections to your local SSH server
  #
  # Allow packets FROM new and established conns to the local SSH server
  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp --dport 22 \
         -m state --state NEW,ESTABLISHED -j ACCEPT

  # Allow packets TO established conns to the local SSH server
  $IPTABLES -A OUTPUT -o $ETH_PRIMARY -p tcp --sport 22 \
         -m state --state ESTABLISHED -j ACCEPT

  # These two rules address local connections to remote SSH servers
  #
  # Allow packets TO new and established conns to remote SSH servers
  $IPTABLES -A OUPUT -o $ETH_PRIMARY -p tcp --dport 22 \
         -m state --state NEW,ESTABLISHED -j ACCEPT

  # Allow packets FROM established conns to remote SSH servers
  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp --sport 22 \
         -m state --state ESTABLISHED -j ACCEPT

where you look at the conns 'from the local CPU'. With these rules, a remote 
program using port 22 can not try to start a new inbound connection to the 
local SSH server, and a local program using port 22 cannot start a new 
outbound connection to a remote SSH server. A little more secure. Pedantic, 
perhaps; but computers like and work most predictably with pedantry.
