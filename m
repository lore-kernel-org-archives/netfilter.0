From: Jason Opperisano <opie@817west.com>
Subject: Re: Ethernet port redirection
Date: Fri, 07 Jan 2005 08:47:06 -0500
Message-ID: <1105105625.3553.18.camel@hubcap.ljm.dom>
References: <000d01c4f33a$5ac1f590$eaab9385@gagan>
	<20050105155239.GB24445@bender.817west.com>
	<002501c4f4b6$278eed40$eaab9385@gagan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002501c4f4b6$278eed40$eaab9385@gagan>
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
To: Navneet <navneetkc@gmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2005-01-07 at 07:41, Navneet wrote:
> > On Wed, Jan 05, 2005 at 08:52:06PM +0530, Navneet wrote:
> > > Hi,
> > >
> > > Now, pease check this out :-
> > > I was trying to run squid in transparent mode(Transparent Proxying) ?
> > >
> > > System details:
> > > RedHat Linux 9
> > > eth0 133.147.171.169/8 [Internal NIC]
> > > eth1 172.21.133/14        [External NIC]
> >
> > maybe i'm being silly--but it sure looks to me like eth0 is external and
> > eth1 is internal.
> 
> No it' not. eth0 is being used as internal GW & eth1 as external.
> 
> Any reason for you being silly...about eth0 as internal & eth1 as external ?
> please suggest

because the IP on eth0 is 133.147.169 and the IP on eth1 is 172.21.133,
which is from an RFC1918 range.

> > > All http request get REDIRECTED to squid  at eth0(Internal).It should
> work
> > > as Gateway by means of eth1(External).
> > >
> > > i've done this:
> > > 1.Enabled IP forwarding
> > > #echo "1" >/proc/sys/net/ipv4/ip_forward
> > > 2.iptables (Netfilter) PORT REDIRECTION:
> > > #iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> > > REDIRECT --to-port 3128
> >
> > are you *positive* that you don't mean eth1 there?
> 
> yes ofcourse i am very +ve about it.eth0 should be there...

your REDIRECT rule is correct--do you also have an INPUT rule that
allows traffic to connect to 172.21.133:3128 on eth1?  do you also have
an OUTPUT rule that allows the gateway to resolve DNS, and fetch HTTP
content?

someone else asked this, but are you sure you have squid compiled with
transparent proxying support and have you configured it to support
transparent proxying?

-j

--
"Default! The two sweetest words in the English language!"
	--The Simpsons


