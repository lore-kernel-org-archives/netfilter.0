From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Wed, 13 Apr 2005 16:57:53 -0700
Message-ID: <1113436673.3544.186.camel@seberino.spawar.navy.mil>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
	<20050413211349.GA31336@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050413211349.GA31336@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


> allow traffic on the loopback interface unconditionally,  and allow the
> linux routing code 'martian' checks to drop 127.0.0.0/8 packets received
> 'on the wire' as it does by default.
> 

Jason

Thank you very much!
Are you saying that there is no reason for firewalls to check for and
drop packets addressed to and from 127.0.0.1 because Linux TCP stack
already drops those automatically?  I didn't know source IP addresses
were checked by default.  This is almost like a built in 'always on'
firewalling on Linux!?

In other words, if I tried to spoof packets to your LAN from 127.0.0.1,
they would never get through even with no firewalls?

Chris


