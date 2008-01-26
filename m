From: duren duren <jusdurian_jr@yahoo.com>
Subject: RE: Can I block nat'ed user with iptables?
Date: Sat, 26 Jan 2008 07:30:58 -0800 (PST)
Message-ID: <985036.73480.qm@web55409.mail.re4.yahoo.com>
References: <001101c85ff6$ffbf9bc0$ff3ed340$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <001101c85ff6$ffbf9bc0$ff3ed340$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


--- Rob Sterenborg <rob@sterenborg.info> wrote:

> > i have internet router using linux & i want only
> user1
> > can access internet & user2 can't
> > but if user1 use program like ccproxy, user2 can
> using
> > internet from user1 as proxy server
> > 
> > is't possible to block user from being nat'ed with
> > iptables?
> 
> Sure.
> 
> INET_IP="a.b.c.d" # Your internet IP address
> USER_IP="192.168.0.11" # IP of user1
> LAN="192.168.0.0/24" # LAN where user1 is in
> 
> $ipt -P FORWARD DROP
> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED
> -j ACCEPT
> $ipt -A FORWARD -m state --state NEW -s $USER_IP -j
> ACCEPT
> $ipt -t nat -A POSTROUTING -s $LAN -j SNAT --to
> $INET_IP
> 
> Here, it's possible to perform NAT for the entire
> LAN (see the rule for
> the nat table). However, the policy for the FORWARD
> chain in the filter
> table (which is where most of us do filtering) is
> set to DROP so every
> packet that did not match a rule that accepts a
> packet will be dropped.
> Only ESTABLISHED and RELATED packets (which will be
> the most) will be
> accepted, as well as NEW packets from user1. This
> way only user1 will be
> able to use the internet (assuming routing is setup
> correctly). It's up
> to you to get ccproxy on the PC of user1 working.
> 
> 
> Grts,
> Rob
> 

thanks Rob, but i'm litle bit confusing about this. If
user1 install ccproxy & user2 use user1 as a proxy for
their browser & user2 can connect.
From linux server point of view, he just know, request
come from user1 IP not from user2 IP, so he will
forward it not block. is't right?

thanks for your help




      ____________________________________________________________________________________
Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ 

