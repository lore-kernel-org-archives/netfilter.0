From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Wed, 13 Apr 2005 20:09:46 -0500
Message-ID: <425DC2DA.7010608@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

> allow traffic on the loopback interface unconditionally,  and allow the
> linux routing code 'martian' checks to drop 127.0.0.0/8 packets received
> 'on the wire' as it does by default.

I don't think this is such a good idea.  I could reconfigure my system such that it's loop back interface was not in the 127.0.0.0/8 network and set a route to the 127.0.0.0/8 network to be via your IP on the LAN.  Assuming that your system and my system were on the same LAN and subnet and we could ping each other I would be able to access your 127.0.0.1 address as your kernel would forward traffic to the loop back network in your system.



Grant. . . .

