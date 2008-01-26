From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Can I block nat'ed user with iptables?
Date: Sat, 26 Jan 2008 17:20:46 +0100
Message-ID: <001a01c86037$689bfc20$39d3f460$@info>
References: <001101c85ff6$ffbf9bc0$ff3ed340$@info> <985036.73480.qm@web55409.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <985036.73480.qm@web55409.mail.re4.yahoo.com>
Content-language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> > > i have internet router using linux & i want only
> > > user1 can access internet & user2 can't but if
> > > user1 use program like ccproxy, user2 can using
> > > internet from user1 as proxy server
> > >
> > > is't possible to block user from being nat'ed with
> > > iptables?
> >
> > Sure.
> >
> > INET_IP="a.b.c.d" # Your internet IP address
> > USER_IP="192.168.0.11" # IP of user1
> > LAN="192.168.0.0/24" # LAN where user1 is in
> >
> > $ipt -P FORWARD DROP
> > $ipt -A FORWARD -m state --state RELATED,ESTABLISHED
> > -j ACCEPT
> > $ipt -A FORWARD -m state --state NEW -s $USER_IP -j
> > ACCEPT
> > $ipt -t nat -A POSTROUTING -s $LAN -j SNAT --to
> > $INET_IP
> >
> > Here, it's possible to perform NAT for the entire
> > LAN (see the rule for the nat table). However, the
> > policy for the FORWARD chain in the filter table
> > (which is where most of us do filtering) is set to
> > DROP so every packet that did not match a rule that
> > accepts a packet will be dropped.
> > Only ESTABLISHED and RELATED packets (which will be
> > the most) will be accepted, as well as NEW packets
> > from user1. This way only user1 will be able to use
> > the internet (assuming routing is setup correctly).
> > It's up to you to get ccproxy on the PC of user1
> > working.
> >
> >
> > Grts,
> > Rob
> >
> 
> thanks Rob, but i'm litle bit confusing about this. If
> user1 install ccproxy & user2 use user1 as a proxy for
> their browser & user2 can connect.
> From linux server point of view, he just know, request
> come from user1 IP not from user2 IP, so he will
> forward it not block. is't right?
> 
> thanks for your help

With the rule set above, the Linux server doesn't know about allowing
the requests from user2: as I interpreted your question you don't want
to accept internet traffic from that host. The Linux server only has to
know about allowing requests from and answers to user1 and drop
everything else. (Note that this was just an example: it's not a
"definitive rule set".)

Ccproxy on the PC of user1 has to deal with requests from user2 because,
as you said in the original post, user2 had to use ccproxy from user1
(well, that's what I thought you were saying anyway).
When user2 sends a request it will be received by ccproxy on the PC of
user1. Ccproxy will have to do it's "magical stuff" with the request to
make it look like the request came from user1 and send the answer it
receives from the Linux server back to user2, because user1 will indeed
receive the answer *for* user2. (I know: this looks like spaghetti.)


Grts,
Rob


