From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: irc
Date: Mon, 17 Nov 2003 16:38:10 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171638.hAHGcDj22282@agate.rockstone.co.uk>
References: <7A3B4AA360FDEF448F3390421FC8D73101131848@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D73101131848@coxhpexg.coxhp.com>
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

On Monday 17 November 2003 4:28 pm, bmcdowell@coxhealthplans.com wrote:

> At the risk of getting OT, what is the point of a proxy for IRC on a
> gateway?  I could see it as an anonymizer to bounce IRC off of, but on a
> gateway this would not seem to functionally any different than NAT.  What
> am I missing?

I don't think you're missing anything.   And whether an IRC proxy would 
anonymise connections depends on how the proxy was written, I think (an http 
proxy does not necessarily anonymise http connections, for example, and an 
smtp proxy (aka mail server) certainly doesn't).

I simply think packet filtering and application proxying are two approaches 
to building a firewall, and some people choose one, some people choose the 
other.   This list is mainly for people using the packet filtering method, 
but it doesn't mean it's the only way to do it.

Antony.

-- 

Software development can be quick, high-quality, or low-cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.

