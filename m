From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirection to local lan, isn't DNAT method unsafe.
Date: Thu, 1 Apr 2004 10:55:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404011055.45703.Antony@Soft-Solutions.co.uk>
References: <40696C1A.5080400@personalsoft.com.br> <200404011005.30735.Antony@Soft-Solutions.co.uk> <008601c417cd$9900d680$de0aa8c0@comp>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008601c417cd$9900d680$de0aa8c0@comp>
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

On Thursday 01 April 2004 10:42 am, Bo Jacobsen wrote:

> > Well, DNAT is normally used to map externally-accessible public IPs to
> > real internal systems on non-routable 10.x.y.z, 172.16.a.b or 192.168.c.d
> > addresses, therefore the problem never arises (since people across the
> > Internet can't send packets to the real private addresses even if they
> > knew what they were).
> >
> > There isn't a "better" way to redirect traffic to other IP addresses,
> > however why do you think it's a problem for people to use the "real"
> > address instead of the one you're telling them to use.   They have access
> > to the machine, so why does it really matter which address they use to
> > connect to it?
>
> The problem is that many hosts, with this setup, actually is connected to
> the internet using a public ip, and beeing able to resolve internal
> ip-information is not good.

Now I'm confused.   (Easily done...)

Were the 192.168.x.y addresses you gave in your original posting accurate, or 
just examples, and you are now saying that the source machines are actually 
systems out on the Internet somewhere with real public IPs?

Please clarify - who are you worried about discovering the real internal IP 
addresses of your machines, and where are they located on the network?   Can 
they really send packets to the private IP address as you outlined in your 
original posting?

My expectation is that people "out on the Internet" cannot connect to your 
private IPs (because the addresses are non-routable), therefore the question 
doesn't arise for them.   People associated with your local network (ie: 
inside your connection point to the Internet) surely aren't a problem even if 
they do discover the real private IP address?   Or am I missing something 
here about what you are trying to secure from whom?

Hope that's clear....

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


