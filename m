From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: traceroute
Date: Thu, 1 Jul 2004 10:30:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407011030.28788.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.33.0407011119540.29206-100000@blackhole.kfki.hu>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0407011119540.29206-100000@blackhole.kfki.hu>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 01 July 2004 10:21 am, Jozsef Kadlecsik wrote:

> On Wed, 30 Jun 2004, Antony Stone wrote:
> > On Wednesday 30 June 2004 11:36 pm, Florian Boelstler wrote:
> > >
> > > By looking at other posts in this thread I've learned that traceroutes
> > > are done with echo-requests. Is this true for Linux 2.6.6 ?
> >
> > No, that's true for Windows systems.   Unix machines (Linux included)
> > use high-port numbered UDP packets.
> >
> > Therefore you need to allow UDP packets to leave your machine for you to
> > be able to run traceroute from it.
>
> Actually UDP based traceroute uses ports in the range 33434-33523.

That's one of things I like about this mailing list - I can find people who 
are even more precise and pedantic than I am :)

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


