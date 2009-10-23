From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: Disabling conntrack for local net
Date: Fri, 23 Oct 2009 09:26:35 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD509DD@HSSBS.holdstead.local>
References: <034DEBCAE934A74991E6E76B8DA72D14185DD509DA@HSSBS.holdstead.local>
 <4AE13AA6.5080509@chello.at> <4AE14B9E.9050705@chello.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AE14B9E.9050705@chello.at>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> > Benefit = No resources used on connection tracking
> >
> > -t raw -m -s x.x.x.x/zz -d y.y.y.y/zz -j NOTRACK
> >
> sorry, missed that:
> or the RAWNAT target from the xtables addon if you used NAT.

RAWNAT?  Never seen that before.

Looking up the xtables implementation it looks like I can do the RAWNAT in raw/rawpost for routing stead of PRE/POSTROUTING in nat.  Is there a recommendation of doing this over PRE/POSTROUTING rules?

Playing with it last night (based upon your answer and looking up some of my old posts from years ago) I added the rule to NOTRACK local but I ran into a problem with making connections to external IP's routing back inside.  For my own stuff, I run split DNS, but the problem is all of the client hosted stuff is blocked and split DNS isn't an option for their domains since we don't control them.  Since we have a limited number of public IP's now we are really dependent on NAT'ing to multiple different servers internally.

With that said, can someone assist me with writing a good NOTRACK rule that will still allow me to access my public IP's from internally, and be able to cross subnets, in the best possible manner.  We are running CentOS 5.3 if that make any this point in the game.

Here is an example of the rules we are running right now:

_A PREROUTING -d 208.35.34.20 -p tcp -m tcp --dport 53 -j DNAT --to-destination 10.40.16.21
-A PREROUTING -d 208.35.34.20 -p udp -m udp --dport 53 -j DNAT --to-destination 10.40.16.21
-A PREROUTING -d 208.35.34.20 -j DNAT --to-destination 10.40.16.29
...
-A POSTROUTING -s 10.40.16.21 -o eth1 -p tcp -m tcp --sport 53 -j SNAT --to-source 208.35.34.20
-A POSTROUTING -s 10.40.16.21 -o eth1 -p udp -m udp --sport 53 -j SNAT --to-source 208.35.34.20
-A POSTROUTING -s 10.40.16.29 -o eth1 -j SNAT --to-source 208.35.34.20
...
-A POSTROUTING -s 10.0.0.0/255.0.0.0 -o eth1 -j SNAT --to-source 208.35.34.2


Given this, can someone whip up the proper raw/nat/filter on how to make this NOTRACK and be able to route back inside?  

