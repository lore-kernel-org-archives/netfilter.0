From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multiple firewalls
Date: Wed, 11 Sep 2002 16:17:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111517.g8BFHuv08855@vulcan.rissington.net>
References: <1031749586.345.26.camel@bigblue> <200209111407.g8BE7av08714@vulcan.rissington.net> <1031757171.345.31.camel@bigblue>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031757171.345.31.camel@bigblue>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 11 September 2002 4:12 pm, darkstar wrote:

> On Wed, 2002-09-11 at 16:07, Antony Stone wrote:
> > On Wednesday 11 September 2002 2:06 pm, darkstar wrote:
> > > I have two seperate iptables firewalls for two lines for our
> > > company.Both machines have two network cards.
> > > Would it be advisable to combine the two into one machine with three
> > > cards..???
> >
> > What are you trying to do with the two external links ?
> >
> > How have you got your internal network set up ?
> >
> > Is there any sort of redundancy / load balancing / failover going on here
> > ?
> No just two simple firewalls going into a internal network, no fail over
> and no load balancing

In that case I agree with Roy.

1 interface for ext1
1 interface for ext2
1 interface for int LAN
1 interface for DMZ

It'll give a good opportunity to play with iproute2 as well :-)

How are your internal clients set up to route to the Internet at present ?   
What determines whether they go via ext1 or ext2 ?

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

