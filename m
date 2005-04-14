From: Jason Opperisano <opie@817west.com>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Wed, 13 Apr 2005 21:35:25 -0400
Message-ID: <20050414013525.GA32192@bender.817west.com>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
	<20050413211349.GA31336@bender.817west.com>
	<1113436673.3544.186.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113436673.3544.186.camel@seberino.spawar.navy.mil>
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

On Wed, Apr 13, 2005 at 04:57:53PM -0700, Christian Seberino wrote:
> Thank you very much!
> Are you saying that there is no reason for firewalls to check for and
> drop packets addressed to and from 127.0.0.1 because Linux TCP stack
> already drops those automatically?  I didn't know source IP addresses
> were checked by default.  This is almost like a built in 'always on'
> firewalling on Linux!?
> 
> In other words, if I tried to spoof packets to your LAN from 127.0.0.1,
> they would never get through even with no firewalls?

yeah--somewhere around line 1434 of:

  /usr/src/linux-2.4.28/net/ipv4/route.c

on the machine i'm looking at.

-j

--
"Chris: Hi, my name is Chris. Mom and dad said that I'm supposed to be
 on my best behavior tonight and not say "poop". Oh god. What have I
 done?"
        --Family Guy

